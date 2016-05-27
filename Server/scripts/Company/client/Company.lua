class 'Company'

function Company:__init()

	self.companies = {}
	
	Network:Subscribe("UpdateData", self, self.UpdateData)
	Events:Subscribe("RequestStock", self, self.RequestStock)
end


function Company:UpdateData(args)
	self.companies = args.companies
end


function Company:RequestStock(args)
	local company = self.companies[args.id]
	if company then
		Events:Fire("RequestStock_RETURN", {goods = company.goods, feedstock = company.feedstock})
	end
end


Company = Company()