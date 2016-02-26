class 'Vehicles'

function Vehicles:__init()
    self.vehicles = {}


    Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
    Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
    Events:Subscribe("ServerStart", self, self.ServerStart)
end


function Vehicles:ModuleLoad()
	local query = SQL:Query("SELECT Id, VehicleId, Position, Angle, Template, Decal FROM VehicleSpawn")
	local result = query:Execute()
	for _, line in ipairs(result) do 
		self:SpawnVehicle(
			tonumber(Id),
			tonumber(line.VehicleId),
			self:StringToVector3(line.Position),
			self:StringToAngle(line.Angle),
			line.Template,
			line.Decal
		)
	end
end


function Vehicles:ModuleUnload()
    for k, data in pairs(self.vehicles) do
        if IsValid(data.vehicle) then
            data.vehicle:Remove()
        end
    end
end


function Vehicles:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS VehicleSpawn(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"VehicleId INTEGER NOT NULL," ..
		"Position VARCHAR(50) NOT NULL," ..
		"Angle VARCHAR(50) NOT NULL," ..
		"Template VARCHAR(30)," ..
		"Decal VARCHAR(30))")
end


function Vehicles:SpawnVehicle(id, model_id, position, angle, template, decal)
	
	local args = {
		model_id = model_id,
		position = position,
		angle = angle,
		template = template and template or "",
		decal = decal and decal or "",
		enabled = true,
	}
    local vehicle = Vehicle.Create( args )

    self.vehicles[vehicle:GetId()] = {vehicle = vehicle, id = id}
end


function Vehicles:StringToVector3(str)
	local v = str:split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
end


function Vehicles:StringToAngle(str)
	local a = str:split(", ")
	return Angle(tonumber(a[1]), tonumber(a[3]), tonumber(a[5]), tonumber(a[7]))
end


Vehicles = Vehicles()