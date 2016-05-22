function JobsList()
	local Languages = Languages()
	Languages:SetLanguage("JOB_01_N", {["en"] = "Unemployed", ["pt"] = "Desempregado"})
	Languages:SetLanguage("JOB_01_D", {["en"] = "Jobless", ["pt"] = "Sem emprego"})
	Languages:SetLanguage("JOB_01_DD", {["en"] = "Idle", ["pt"] = "Não faz nada"})
	
	Languages:SetLanguage("JOB_02_N", {["en"] = "Taxi-driver", ["pt"] = "Taxista"})
	Languages:SetLanguage("JOB_02_D", {["en"] = "Description", ["pt"] = "Description ETEste"})
	Languages:SetLanguage("JOB_02_DD", {["en"] = "Description Detailed", ["pt"] = "Transporta passageiros ao redor de Panau"})
	
	local list = {
		[1] = {name = Languages.JOB_01_N, description = Languages.JOB_01_D, detailed_description = Languages.JOB_01_DD},
		[2] = {name = Languages.JOB_02_N, description = Languages.JOB_02_D, detailed_description = Languages.JOB_02_DD}
	}
	return list
end


function JobCategoriesList()
	local Languages = Languages()
	Languages:SetLanguage("JOBCATEGORY_01_N", {["en"] = "Common", ["pt"] = "Comum"})
	Languages:SetLanguage("JOBCATEGORY_02_N", {["en"] = "Transport	", ["pt"] = "Transporte"})
	
	local list = {
		[1] = {name = Languages.JOBCATEGORY_01_N},
		[2] = {name = Languages.JOBCATEGORY_02_N}
	}
	return list
end


function JobsUnlockList()
	local Languages = Languages()
	Languages:SetLanguage("JOBUNLOCK_02_01_N", {["en"] = "Motorcycle Taxi", ["pt"] = "Mototaxi"})
	Languages:SetLanguage("JOBUNLOCK_02_01_D", {["en"] = "Can drive and carry passengers on a Motorcycle Taxi. The fare is slightly lower than a common Taxi.", ["pt"] = "Pode dirigir e transportar passageiros em uma Mototaxi. A tarifa é um pouco menor que um taxi convencional."})
	
	Languages:SetLanguage("JOBUNLOCK_02_02_N", {["en"] = "Taxi Car", ["pt"] = "Carro Taxi"})
	Languages:SetLanguage("JOBUNLOCK_02_02_D", {["en"] = "Can drive and carry passengers on a conventional Taxi.", ["pt"] = "Pode dirigir e transportar passageiros em um Taxi convencional."})
	
	local list = {
		[1] = {},
		[2] = {
			[1] = {name = Languages.JOBUNLOCK_02_01_N, description = Languages.JOBUNLOCK_02_01_D},
			[2] = {name = Languages.JOBUNLOCK_02_02_N, description = Languages.JOBUNLOCK_02_02_D},
		}
	}
	return list
end