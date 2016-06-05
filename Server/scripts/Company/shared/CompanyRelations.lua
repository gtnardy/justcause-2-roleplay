class 'CompanyRelations'

function CompanyRelations:__init()
	-- [CompanyTypes] = {ProviderType...}
	self.relations = {
		[10] = {14},
		[14] = {15},
	}
end
