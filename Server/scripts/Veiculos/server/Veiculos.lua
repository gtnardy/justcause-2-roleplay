class 'Veiculos'

function Veiculos:__init(args)

	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	
	Events:Subscribe("TrocouVeiculo", self, self.TrocouVeiculo)

	self.veiculos = {}
	--self:CarregarVeiculos( "--spawns.txt" )
end


function Veiculos:CarregarVeiculos( filename )
    -- Open up the spawns
    print("Opening " .. filename)
    local file = io.open( filename, "r" )

    if file == nil then
        print( "No spawns.txt, aborting loading of spawns" )
        return
    end

    -- For each line, handle appropriately
    for line in file:lines() do
        if line:sub(1,1) == "V" then
            self:SalvarDB( line )
        end
    end


    file:close()
end


function Veiculos:SalvarDB( line )
    -- Remove start, end and spaces from line
    line = line:gsub( "VehicleSpawn%(", "" )
    line = line:gsub( "%)", "" )
    line = line:gsub( " ", "" )

    -- Split line into tokens
    local tokens = line:split( "," )   

    -- Model ID string
    local model_id_str  = tokens[1]

    -- Create tables containing appropriate strings
    -- local pos_str       = { tokens[2], tokens[3], tokens[4] }
    local pos_str       = tokens[2] .. ", " .. tokens[3] .. ", ".. tokens[4]
    local ang_str       = tokens[5] .. ", " .. tokens[6].. ", " .. tokens[7] .. ", ".. tokens[8]

    -- Create vehicle args table
	template = ""
    if #tokens > 8 then
        if tokens[9] ~= "NULL" then
            -- If there's a template, set it
            template = tokens[9]
        end

        -- if #tokens > 9 then
            -- if tokens[10] ~= "NULL" then
                -- -- If there's a decal, set it
                -- args.decal = tokens[10]
            -- end
        -- end
    end

	local command = SQL:Command("INSERT INTO VeiculoSpawn (idVeiculo, posicao, angulo, template) VALUES (?, ?, ?, ?)")
	command:Bind(1, model_id_str)
	command:Bind(2, pos_str)
	command:Bind(3, ang_str)
	command:Bind(4, template)
	command:Execute()

end



function Veiculos:ModuleUnload()

	for id, vei in pairs(self.veiculos) do
		if IsValid(vei.veiculo) then
			vei.veiculo:Remove()
		end
	
	end

end


function Veiculos:ModuleLoad()
	
	local query = SQL:Query("SELECT * FROM VeiculoSpawn")
	local result = query:Execute()
	
	if #result > 0 then
	
		Chat:Broadcast("Preparando para spawnar: " .. tostring(#result) .. " veiculo(s).", Color(255,255,255))	
		for _, linha in ipairs(result) do
		
			local spawnArgs = {
				model_id = tonumber(linha.idVeiculo),
				position = self:StringToVector3(linha.posicao),
				angle = self:StringToAngle(linha.angulo),
				template = linha.template,
			}
			
			local veiculo = Vehicle.Create(spawnArgs)
			table.insert(self.veiculos, {veiculo = veiculo, idVeiculoSpawn = tonumber(linha.idVeiculoSpawn)})
			
		end	
	else
		Console:Print("Falha ao carregar SpawnVeiculos")
	end

end


function Veiculos:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end
	
end


function Veiculos:StringToAngle(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5]) and tonumber(v[7])) then
		return Angle(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]), tonumber(v[7]))
	else
		return nil
	end
	
end


function Veiculos:TrocouVeiculo(args)


end


veiculos = Veiculos()