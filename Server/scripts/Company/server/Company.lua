class 'Company'

function Company:__init()
	
	self.companies = {}
	self.timer = Timer()
	
	self.queryCompany = "SELECT c.IdEstablishment, c.Value, c.Goods, c.Feedstock, c.Production, c.IdOwner, c.IsFactory, e.Type, e.Position, e.Name FROM Company c INNER JOIN Establishment e ON e.Id = c.IdEstablishment"
	
	self.CompanyRelations = CompanyRelations()
	
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("UpdateCompany", self, self.UpdateCompany)
end


function Company:PostTick()
	if self.timer:GetSeconds() > 5 then
		for _, company in pairs(self.companies) do
			self:Produce(company)
		end
		self:UpdatePlayers()
		self.timer:Restart()
	end
end


function Company:Produce(company)
	if company.isFactory or company.feedstock >= company.production then
		self:SetGoods(company, company.goods + company.production)
		if not company.isFactory then
			self:SetFeedstock(company, company.feedstock - company.production)
		end		
	end

	if not company.isFactory and company.feedstock <= company.production * 3 then
		self:CreateDelivery(company)
	end
end


function Company:CreateDelivery(company)

	local query = SQL:Query("SELECT 1 FROM JobDeliveryDeliveries WHERE IdEstablishmentTo = ?")
	query:Bind(1, company.id)
	local result = query:Execute()
	if #result > 0 then return end

	local relations = self.CompanyRelations.relations[company.typeCompany]
	if not relations then return end
	
	local delivery = {to = company} -- from: to:

	for _, provider in pairs(self.companies) do
		for _, typeCompany in pairs(relations) do
			if provider.typeCompany == typeCompany then
				if provider.goods >= company.production then
					local distance = Vector3.Distance(company.position, provider.position)
					if not delivery.distance or delivery.distance > distance then
						delivery.distance = math.ceil(distance)
						delivery.from = provider
						delivery.cost = 2000
						delivery.goods = company.production
						delivery.deliveries = 3
					end
				end
			end
		end
	end
	
	if delivery.from then
		Events:Fire("CreateDelivery", delivery)
	end
end


function Company:SetGoods(company, goods)
	local command = SQL:Command("UPDATE Company SET Goods = ? WHERE IdEstablishment = ?")
	command:Bind(1, goods)
	command:Bind(2, company.id)
	command:Execute()
	
	company.goods = goods
end


function Company:SetFeedstock(company, feedstock)
	local command = SQL:Command("UPDATE Company SET Feedstock = ? WHERE IdEstablishment = ?")
	command:Bind(1, feedstock)
	command:Bind(2, company.id)
	command:Execute()
	
	company.feedstock = feedstock
end


function Company:InstanceCompany(args)
	for _, company in pairs(self.companies) do
		if company.id == tonumber(args.IdEstablishment) then
			table.remove(self.companies, _)
		end
	end
	
	table.insert(self.companies, {
		id = tonumber(args.IdEstablishment),
		value = tonumber(args.Value),
		idOwner = args.IdOwner,
		goods = tonumber(args.Goods),
		feedstock = tonumber(args.Feedstock),
		production = tonumber(args.Production),
		isFactory = not (tonumber(args.IsFactory) == 0),
		typeCompany = tonumber(args.Type),
		position = Vector3.ParseString(args.Position),
		name = args.Name,
	})
end


function Company:UpdateCompany(args)
	local query = SQL:Query(self.queryCompany .. " WHERE c.IdEstablishment = ?")
	query:Bind(1, args.id)
	local result = query:Execute()
	if #result > 0 then
		self:InstanceCompany(result[1])
	end
end


function Company:ModuleLoad()
	local query = SQL:Query(self.queryCompany)
	local result = query:Execute()
	for _, line in pairs(result) do
		self:InstanceCompany(line)
	end
end


function Company:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function Company:UpdatePlayer(player)
	for _, company in pairs(self.companies) do
		if company.idOwner and company.idOwner == player:GetSteamId().id then
			player:SetNetworkValue("IdCompany", company.id)
		end
	end
	Network:Send(player, "UpdateData", {companies = self.companies})
end


function Company:UpdatePlayers()
	for player in Server:GetPlayers() do
		self:UpdatePlayer(player)
	end
end


function Company:PlayerJoin(args)
	self:UpdatePlayer(args.player)
end


function Company:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS Company(" ..
		"IdEstablishment INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"Value INTEGER NOT NULL," ..
		"Goods INTEGER NOT NULL DEFAULT 0," ..
		"Feedstock INTEGER NOT NULL DEFAULT 0," ..
		"Production INTEGER NOT NULL," ..
		"IsFactory INTEGER NOT NULL DEFAULT 0," ..
		"IdOwner VARCHAR(20))")
end


Company = Company()