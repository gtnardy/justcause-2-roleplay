function JobsList()
	local Languages = Languages()
	Languages:SetLanguage("JOB_01_N", {["en"] = "Unemployed", ["pt"] = "Desempregado"})
	Languages:SetLanguage("JOB_01_D", {["en"] = "Player unemployed.", ["pt"] = "Description Desempregado"})
	Languages:SetLanguage("JOB_02_N", {["en"] = "Taxi-driver", ["pt"] = "Taxista"})
	Languages:SetLanguage("JOB_02_D", {["en"] = "Player teste.", ["pt"] = "Description ETEste"})
	
	local list = {

		[1] = {name = Languages.JOB_01_N, description = Languages.JOB_01_D},
		[2] = {name = Languages.JOB_02_N, description = Languages.JOB_02_D}
	}
	return list
end


function JobCategoriesList()
	local Languages = Languages()
	Languages:SetLanguage("JOBCATEGORY_01_N", {["en"] = "Common", ["pt"] = "Comum"})
	
	local list = {

		[1] = {name = Languages.JOBCATEGORY_01_N}
	}
	return list
end