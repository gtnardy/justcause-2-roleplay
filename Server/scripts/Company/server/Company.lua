class 'Company'

function Company:__init()
	
	self.companies = {}
	self.timer = Timer()
	
	self.CompanyRelations = CompanyRelations()
	
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
end


function Company:PostTick()
	if self.timer:GetSeconds() > 60 then
		for idEstablishment, company in pairs(self.companies) do
			self:Produce(idEstablishment, company)
		end
		self:UpdatePlayers()
		self.timer:Restart()
	end
end


function Company:Produce(id, company)

	if company.isFactory or company.feedstock >= company.production then
		self:SetGoods(id, company, company.goods + company.production)
		if not company.isFactory then
			self:SetFeedstock(id, company, company.feedstock - company.production)
		end		
	end

	if not company.isFactory and company.feedstock <= company.production * 2 then
		self:CreateDelivery(id, company)
	end
end


function Company:CreateDelivery(id, company)
	local relations = self.CompanyRelations.relations[company.typeCompany]
	if relations then
		local delivery = {to = {id = id, company = company}} -- from: to:
		for idFactory, factory in pairs(self.companies) do
			for _, typeCompany in pairs(relations) do
				if factory.typeCompany == typeCompany then
					if factory.goods >= company.production then
						local distance = Vector3.Distance(company.position, factory.position)
						if not delivery.distance or delivery.distance > distance then
							delivery.distance = distance
							delivery.from = {id = idFactory, company = factory}
						end
					end
				end
			end
		end
		
		if delivery.from then
			Events:Fire("CreateDelivery", delivery)
		else
		end
	end
end


function Company:SetGoods(id, company, goods)
	local command = SQL:Command("UPDATE Company SET Goods = ? WHERE IdEstablishment = ?")
	command:Bind(1, goods)
	command:Bind(2, id)
	command:Execute()
	
	company.goods = goods
end


function Company:SetFeedstock(id, company, feedstock)
	local command = SQL:Command("UPDATE Company SET Feedstock = ? WHERE IdEstablishment = ?")
	command:Bind(1, feedstock)
	command:Bind(2, id)
	command:Execute()
	
	company.feedstock = feedstock
end


function Company:ModuleLoad()
	local query = SQL:Query("SELECT c.IdEstablishment, c.Value, c.Goods, c.Feedstock, c.Production, c.IdOwner, c.IsFactory, e.Type, e.Position FROM Company c INNER JOIN Establishment e ON e.Id = c.IdEstablishment")
	local result = query:Execute()
	for _, line in pairs(result) do
		self.companies[tonumber(line.IdEstablishment)] = {
			value = tonumber(line.Value),
			idOwner = line.IdOwner,
			goods = tonumber(line.Goods),
			feedstock = tonumber(line.Feedstock),
			production = tonumber(line.Production),
			isFactory = not (tonumber(line.IsFactory) == 0),
			typeCompany = tonumber(line.Type),
			position = Vector3.ParseString(line.Position),
		}
	end
end


function Company:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function Company:UpdatePlayer(player)
	for idCompany, company in pairs(self.companies) do
		if company.idOwner and company.idOwner == player:GetSteamId().id then
			player:SetNetworkValue("IdCompany", idCompany)
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