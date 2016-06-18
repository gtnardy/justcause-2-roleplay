function JobsList()
	local Languages = Languages()
	Languages:SetLanguage("JOB_01_N", {["en"] = "Unemployed", ["pt"] = "Desempregado"})
	Languages:SetLanguage("JOB_01_D", {["en"] = "Jobless", ["pt"] = "Sem emprego"})
	Languages:SetLanguage("JOB_01_DD", {["en"] = "Idle", ["pt"] = "Não faz nada"})
	
	Languages:SetLanguage("JOB_02_N", {["en"] = "Taxi-driver", ["pt"] = "Taxista"})
	Languages:SetLanguage("JOB_02_D", {["en"] = "Description", ["pt"] = "Description ETEste"})
	Languages:SetLanguage("JOB_02_DD", {["en"] = "Description Detailed", ["pt"] = "Transporta passageiros ao redor de Panau"})
	
	Languages:SetLanguage("JOB_03_N", {["en"] = "Deliver", ["pt"] = "Entregador"})
	Languages:SetLanguage("JOB_03_D", {["en"] = "Description", ["pt"] = "Description ETEste"})
	Languages:SetLanguage("JOB_03_DD", {["en"] = "Description Detailed", ["pt"] = "Entregador"})
	
	Languages:SetLanguage("JOB_04_N", {["en"] = "Police", ["pt"] = "Policial"})
	Languages:SetLanguage("JOB_04_D", {["en"] = "Description", ["pt"] = "Description ETEste"})
	Languages:SetLanguage("JOB_04_DD", {["en"] = "Description Detailed", ["pt"] = "Prende"})
	
	local list = {
		[1] = {name = Languages.JOB_01_N, description = Languages.JOB_01_D, detailed_description = Languages.JOB_01_DD},
		[2] = {name = Languages.JOB_02_N, description = Languages.JOB_02_D, detailed_description = Languages.JOB_02_DD},
		[3] = {name = Languages.JOB_03_N, description = Languages.JOB_03_D, detailed_description = Languages.JOB_03_DD},
		[4] = {name = Languages.JOB_04_N, description = Languages.JOB_04_D, detailed_description = Languages.JOB_04_DD},
	}
	return list
end


function JobCategoriesList()
	local Languages = Languages()
	Languages:SetLanguage("JOBCATEGORY_01_N", {["en"] = "Common", ["pt"] = "Comum"})
	Languages:SetLanguage("JOBCATEGORY_02_N", {["en"] = "Transport", ["pt"] = "Transporte"})
	Languages:SetLanguage("JOBCATEGORY_03_N", {["en"] = "Military", ["pt"] = "Militar"})
	
	local list = {
		[1] = {name = Languages.JOBCATEGORY_01_N},
		[2] = {name = Languages.JOBCATEGORY_02_N},
		[3] = {name = Languages.JOBCATEGORY_03_N},
	}
	return list
end


function JobsUnlockList()
	local Languages = Languages()
	Languages:SetLanguage("JOBUNLOCK_02_01_N", {["en"] = "Motorcycle Taxi", ["pt"] = "Mototaxi"})
	Languages:SetLanguage("JOBUNLOCK_02_01_D", {["en"] = "Can drive and carry passengers on a Motorcycle Taxi. The fare is slightly lower than a common Taxi.", ["pt"] = "Pode dirigir e transportar passageiros em uma Mototaxi. A tarifa é um pouco menor que um taxi convencional."})
	
	Languages:SetLanguage("JOBUNLOCK_02_02_N", {["en"] = "Taxi Car", ["pt"] = "Carro Taxi"})
	Languages:SetLanguage("JOBUNLOCK_02_02_D", {["en"] = "Can drive and carry passengers on a conventional Taxi.", ["pt"] = "Pode dirigir e transportar passageiros em um Taxi convencional."})
		
	Languages:SetLanguage("JOBUNLOCK_02_03_N", {["en"] = "Heli Taxi", ["pt"] = "Taxi Aéreo"})
	Languages:SetLanguage("JOBUNLOCK_02_03_D", {["en"] = "Can drive and carry passengers on a helicopter Taxi. The fare is slightly further than a common Taxi.", ["pt"] = "Pode dirigir e transportar passageiros em um Taxi helicoptero. A tarifa é um pouco maior que um taxi convencional."})
	
	
	Languages:SetLanguage("JOBUNLOCK_03_01_N", {["en"] = "Motorcycle Delivery", ["pt"] = "Entrega de Moto"})
	Languages:SetLanguage("JOBUNLOCK_03_01_D", {["en"] = "Can delivery goods on a motorcycle. Due be a small vehicle, its capacity of loading is reduced.", ["pt"] = "Pode transportar mercadorias dirigindo uma motocicleta. Por ser um veículo de pequeno porte, sua capacidade de carregamento também é reduzida."})
	
	Languages:SetLanguage("JOBUNLOCK_03_02_N", {["en"] = "Common Delivery", ["pt"] = "Entrega de Carro"})
	Languages:SetLanguage("JOBUNLOCK_03_02_D", {["en"] = "Can delivery goods on a common car. Due be a small vehicle, its capacity of loading is reduced.", ["pt"] = "Pode transportar mercadorias dirigindo uma carro comum. Por ser um veículo de pequeno porte, sua capacidade de carregamento também é reduzida."})
	
	Languages:SetLanguage("JOBUNLOCK_03_03_N", {["en"] = "Van Delivery", ["pt"] = "Entrega de Furgão"})
	Languages:SetLanguage("JOBUNLOCK_03_03_D", {["en"] = "Can delivery goods on a van. Due this vehicle has a medium trunk, its capacity of loading is razoable.", ["pt"] = "Pode transportar mercadorias dirigindo um furgão. Por possuir um porta-malas um pouco maior, sua capacidade de carregamento é maior."})
	
	Languages:SetLanguage("JOBUNLOCK_03_04_N", {["en"] = "Pickup Delivery", ["pt"] = "Entrega de Pickup"})
	Languages:SetLanguage("JOBUNLOCK_03_04_D", {["en"] = "Can delivery goods on a pickup. Pickups have large trunks and can carry a bit heavy load.", ["pt"] = "Pode transportar mercadorias dirigindo uma pickup. Pickups possuem um porta-malas um pouco maior, portanto pode carregar mais mercadorias."})
	
	Languages:SetLanguage("JOBUNLOCK_03_05_N", {["en"] = "Truck Delivery", ["pt"] = "Entrega de Caminão"})
	Languages:SetLanguage("JOBUNLOCK_03_05_D", {["en"] = "Can delivery goods on a truck. Trucks have huges trunks and can carry heavy and powerful loads..", ["pt"] = "Pode transportar mercadorias dirigindo um caminhão. Caminhões possuem enormes espaços de carga, podendo transportar grandes e poderosas cargas."})
	
	local list = {
		[1] = {},
		[2] = {
			[1] = {name = Languages.JOBUNLOCK_02_01_N, description = Languages.JOBUNLOCK_02_01_D},
			[2] = {name = Languages.JOBUNLOCK_02_02_N, description = Languages.JOBUNLOCK_02_02_D},
			[3] = {name = Languages.JOBUNLOCK_02_03_N, description = Languages.JOBUNLOCK_02_03_D},
		},
		[3] = {
			[1] = {name = Languages.JOBUNLOCK_03_01_N, description = Languages.JOBUNLOCK_03_01_D},
			[2] = {name = Languages.JOBUNLOCK_03_02_N, description = Languages.JOBUNLOCK_03_02_D},
			[3] = {name = Languages.JOBUNLOCK_03_03_N, description = Languages.JOBUNLOCK_03_03_D},
			[4] = {name = Languages.JOBUNLOCK_03_04_N, description = Languages.JOBUNLOCK_03_04_D},
			[5] = {name = Languages.JOBUNLOCK_03_05_N, description = Languages.JOBUNLOCK_03_05_D},
		}
	}
	return list
end