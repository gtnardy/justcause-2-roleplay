class 'Languages'

function Languages:__init()
	
	self.language = "pt"
	self.alias = {}
	
	Events:Subscribe("NetworkObjectValueChange", self, self.ObjectValueChange)
	Events:Subscribe("SharedObjectValueChange", self, self.ObjectValueChange)
end


function Languages:ObjectValueChange(args)
	if args.object.__type == "LocalPlayer" and args.object == LocalPlayer and args.key == "Language" then
		self.language = LocalPlayer:GetValue("Language")
		self:UpdateValues()
	end
end


function Languages:SetLanguage(als, languages)
	self.alias[als] = languages
	self[als] = languages[self.language]
end


function Languages:UpdateValues()
	for key, words in pairs(self.alias) do
		self[key] = words[self.language]
	end
end