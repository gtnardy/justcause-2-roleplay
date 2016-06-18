class 'CompanyRelations'

function CompanyRelations:__init()
	-- [CompanyTypes] = {ProviderType...}
	self.relations = {
		[10] = {14},
		[11] = {15},
		[14] = {18},
		[15] = {18},
		[20] = {21},
	}
end
