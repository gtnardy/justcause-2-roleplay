class 'GerenciadorVeiculos'

function GerenciadorVeiculos:__init()

	self.veiculoAtual = nil
	
	self.veiculos = {}
	self.veiculosStreamed = {}
	
	self.casa = nil
	
	self.buzinandio = false
	self.timerBuzina = Timer()
	self.timerHidraulica = Timer()
	
	 -- por tecla
	self.valoresHidraulica = {
		[VirtualKey.Up] = {x = 5, z = 0},
		[VirtualKey.Down] = {x = -4, z = 0},
		[VirtualKey.Left] = {x = 0, z = -7},
		[VirtualKey.Right] = {x = 0, z = 7},
	}
	
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
	
	Events:Subscribe("EntitySpawn", self, self.EntitySpawn)
	Events:Subscribe("EntityDespawn", self, self.EntityDespawn)
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	
	Network:Subscribe("AtualizarVeiculos", self, self.AtualizarVeiculos)
	Network:Subscribe("AtualizarVeiculo", self, self.AtualizarVeiculo)
	
	Events:Subscribe("AtualizarUtensilhoVeiculo", self, self.AtualizarUtensilhoVeiculo)
	Events:Subscribe("AtualizarVeiculo", self, self.AtualizarVeiculo)
	
	Events:Subscribe("GetVeiculoAtual", self, self.GetVeiculoAtual)
	Events:Subscribe("AtivarHidraulica", self, self.AtivarHidraulica)
		
	Network:Subscribe("AtivarBuzina", self, self.AtivarBuzina)
	
	Events:Subscribe("AtualizarSpots", self, self.AtualizarSpots)
end


function GerenciadorVeiculos:AtualizarSpots()

	Events:Fire("DeleteSpot", {grupo = "VeiculoProprio"})
	for _, dados in pairs(self.veiculos) do
		
		if dados.idDono == LocalPlayer:GetSteamId().id then--dados.idCasa and self.casa and dados.idCasa == self.casa.idCasa then

			self:AddSpot(dados)
		end
	end
	
end


function GerenciadorVeiculos:LocalPlayerInput(args)

	if LocalPlayer:InVehicle() and self.veiculoAtual and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer then
		
		if args.input == Action.SoundHornSiren then
		
			if self.veiculoAtual.utensilhos.soundBuzina then
				self:Businar(true)
				return false
			end
		end
	end
	
end


function GerenciadorVeiculos:KeyUp(args)

	if self.veiculoAtual then
	
		if self.veiculoAtual.utensilhos.hidraulica == 1 then
		
			if args.key == VirtualKey.Shift then

				self:AtivarHidraulica(nil)

			end	
			
			if args.key == VirtualKey.Left or args.key == VirtualKey.Up or args.key == VirtualKey.Down or args.key == VirtualKey.Right then
				
				local valores = self.valoresHidraulica[args.key]
				self:AtivarHidraulica(valores)

			end
		end
	end
	
end


function GerenciadorVeiculos:PostTick()

	if self.buzinando then
		if self.timerBuzina:GetSeconds() > 0.1 then
		
			self:Businar(false)
		end
	end
end


function GerenciadorVeiculos:AtivarBuzina(args)

	local dados = self.veiculosStreamed[args.veiculoId]
	if IsValid(dados.veiculo) then
		if dados.utensilhos.soundBuzina then
			if args.boolean then
				dados.utensilhos.soundBuzina:Play()
			else
				dados.utensilhos.soundBuzina:Stop()
			end
		end
	end
end


function GerenciadorVeiculos:Businar(boolean)
	
	if boolean then
		if self.buzinando then
			self.timerBuzina:Restart()
		else

			self.veiculoAtual.utensilhos.soundBuzina:Play()
			self.timerBuzina:Restart()
			self.buzinando = true
			Network:Send("AtivarBuzina", {boolean = true, veiculoId = LocalPlayer:GetVehicle():GetId()})
		end
	else

		self.veiculoAtual.utensilhos.soundBuzina:Stop()
		Network:Send("AtivarBuzina", {boolean = false, veiculoId = LocalPlayer:GetVehicle():GetId()})
		self.buzinando = false
	end
	
end


function GerenciadorVeiculos:AtivarHidraulica(args)
	
	local veiculo = LocalPlayer:GetVehicle()
	if self.timerHidraulica:GetSeconds() > 0.8 then
		
		Network:Send("AtivarHidraulica", args)
		self.timerHidraulica:Restart()
		
	end
end


function GerenciadorVeiculos:LocalPlayerEnterVehicle(args)

	if not args.is_driver then return end

	local dados = self.veiculos[args.vehicle:GetId()]
	if dados then
		if dados.idDono == LocalPlayer:GetSteamId().id then	
			Chat:Print("Bem Vindo ao seu veiculo!", Color(255,255,200))
		else

			if dados.idCasa and self.casa and dados.idCasa == self.casa.idCasa and dados.liberado >= self.casa.nivelMorador then
			
				Chat:Print("Bem Vindo ao veiculo da casa!", Color(255,255,200))
			else
				if dados.trancado == 1 then
					Network:Send("EjetarVeiculo")
					return
				end
			end
			
		end

		self.veiculoAtual = dados
	else
		self.veiculoAtual = nil
	end
	
end


function GerenciadorVeiculos:LocalPlayerExitVehicle(args)

	self.veiculoAtual = nil
	
end


function GerenciadorVeiculos:GetVeiculoAtual()

	local retorno = nil
	if LocalPlayer:GetVehicle() then
		retorno = self.veiculos[LocalPlayer:GetVehicle():GetId()]
	end

	Events:Fire("AtualizarVeiculoAtual", retorno)
end


function GerenciadorVeiculos:ModuleUnload()

	for _, dados in pairs(self.veiculosStreamed) do
	
		if dados.utensilhos.neon then
			dados.utensilhos.neon:Remove()
		end	
		
		if dados.utensilhos.soundBuzina then
			dados.utensilhos.soundBuzina:Remove()
		end
	
	end
	
	Events:Fire("DeleteSpot", {grupo = "VeiculoProprio"})

end


function GerenciadorVeiculos:EntitySpawn(args)

	if args.entity.__type == "Vehicle" then
		local v = args.entity

		self:NovoVeiculoStreamed(v)

	end

end


function GerenciadorVeiculos:EntityDespawn(args)

	if args.entity.__type == "Vehicle" then
	
		local v = args.entity
		self:LimparVeiculoStreamed(v:GetId())
	end

end


function GerenciadorVeiculos:RemoverVeiculo(index)

	self.veiculos[index] = nil

end


function GerenciadorVeiculos:AdicionarVeiculo(index, args)

	self.veiculos[index] = args

end


function GerenciadorVeiculos:AtualizarUtensilhoVeiculo(args)

	if self.veiculos[args.id] then	
	
		self.veiculos[args.id].utensilhos[args.utensilho] = args.valor
	else
		self.veiculos[args.id] = {veiculoId = args.id}
		self.veiculos[args.id].utensilhos = {}
		self.veiculos[args.id].utensilhos[args.utensilho] = args.valor

	end
	
	if IsValid(args.veiculo) then

		self:NovoVeiculoStreamed(args.veiculo)
	end

end

	
function GerenciadorVeiculos:AddSpot(arrayVeiculo)

	local nome = "Veiculo Proprio"
	local descricao = "Retirado da garagem por "..tostring(arrayVeiculo.motorista)
	local idImagem = 5
	
	if arrayVeiculo.motorista != LocalPlayer then
		idImagem = 6
	end
	
	Events:Fire("AddSpot", {nome = nome, tipo = -idImagem, descricao = descricao, posicao = arrayVeiculo.ultimaPosicao, idVeiculo = arrayVeiculo.veiculoId, grupo = "VeiculoProprio", index = arrayVeiculo.veiculoId, idImagem = idImagem})

end


function GerenciadorVeiculos:AtualizarVeiculo(args)
	
	-- if args.veiculo and args.veiculo.idDono == LocalPlayer:GetSteamid().id then
		-- self:GetVeiculoAtual()
	-- end

	self.veiculos[args.id] = args.veiculo
	
	if self.veiculos[args.id] and self.veiculos[args.id].idDono == LocalPlayer:GetSteamId().id then--and self.casa and self.veiculos[args.id].idCasa == self.casa.idCasa then
	
		if not args.veiculo then
		
			Events:Fire("DeleteSpot", {grupo = "VeiculoProprio", index = args.id})
		else
		
			self:AddSpot(args.veiculo)
		end
	end

	if self.veiculosStreamed[args.id] then
		self:NovoVeiculoStreamed(Vehicle.GetById(args.id))
	end
	
	if self.veiculoAtual and args.veiculo and self.veiculoAtual.veiculoId == args.veiculo.veiculoId then
		self.veiculoAtual = args.veiculo
	end
	
end


function GerenciadorVeiculos:AtualizarVeiculos(args)
	
	if args.casa then
		self.casa = args.casa
	end
	
	if args.veiculos then
		self.veiculos = args.veiculos
		self:AtualizarSpots()
	end

end


function GerenciadorVeiculos:NovoVeiculoStreamed(veiculo)

	if IsValid(veiculo) then
		self:LimparVeiculoStreamed(veiculo:GetId())
		local dados = self.veiculos[veiculo:GetId()]

		if dados then
			
			dados.veiculo = veiculo
				
			if dados.utensilhos then 
				if dados.utensilhos.corNeon and dados.utensilhos.corNeon != "" then

					dados.utensilhos.neon = ClientLight.Create({
						position = veiculo:GetPosition(),
						color = dados.utensilhos.corNeon,
						constant_attenuation = 10,
						linear_attenuation = 1,
						quadratic_attenuation = 0.1,
						multiplier = 10,
						radius = 5
					})
				end

				if dados.utensilhos.buzina and dados.utensilhos.buzina.bank_id and dados.utensilhos.buzina.sound_id then
		
					dados.utensilhos.soundBuzina = ClientSound.Create(AssetLocation.Game, {
						bank_id = dados.utensilhos.buzina.bank_id,
						sound_id = dados.utensilhos.buzina.sound_id,
						position = veiculo:GetPosition(),
						angle = Angle(),
						variable_id_focus = 0,
						--distance = Vector3.Distance(LocalPlayer:GetPosition(), veiculo:GetPosition()),
					})
					dados.utensilhos.soundBuzina:Stop()
				end
			end
			
			self.veiculosStreamed[veiculo:GetId()] = dados
			
			return
				
		end
	end

end


function GerenciadorVeiculos:AtualizarBusina(posicao, clientSound)
	
	clientSound:SetPosition(posicao)
end


function GerenciadorVeiculos:AtualizarNeon(posicao, clientLight)
	
	clientLight:SetPosition(posicao + Vector3(0, 0.5, 0))
end


function GerenciadorVeiculos:LimparVeiculoStreamed(veiculoId)

	local array = self.veiculosStreamed[veiculoId]
	if array then
		if array.utensilhos.neon then
			array.utensilhos.neon:Remove()
			array.utensilhos.neon = nil
		end
		
		if array.utensilhos.soundBuzina then
			array.utensilhos.soundBuzina:Remove()
			array.utensilhos.soundBuzina = nil
		end
		array.veiculo = nil
		self.veiculosStreamed[veiculoId] = nil
	end
	
end

function GerenciadorVeiculos:Render()


	-- if LocalPlayer:InVehicle() then
		-- Render:DrawText(Render.Size / 2, tostring(LocalPlayer:GetVehicle():GetAngularVelocity()), Color(255,255,255,100))
		-- Render:DrawText(Render.Size / 2 + Vector2(0, 100), tostring(LocalPlayer:GetVehicle():GetLinearVelocity()), Color(255,255,255,100))
	-- end
	if Game:GetState() ~= GUIState.Game then
        return
    end
	
	local sorted_vehicles = {}
	
	for _, dados in pairs(self.veiculosStreamed) do
	
		local v = dados.veiculo
		if IsValid(v) then
            local pos = v:GetPosition()
			local aim = self:AimingAt(pos)
			
			if aim < 0.2 then
			
				table.insert(sorted_vehicles, {
					dados = dados,
					distancia = LocalPlayer:GetPosition():Distance(pos),
					aim = aim,
				})
				
				table.sort(sorted_vehicles, 
					function(a, b) 
						return (a.distancia > b.distancia) 
					end
				)
				
				for _, veiculo_data in ipairs(sorted_vehicles) do
					self:DrawVeiculo(veiculo_data)
				end
				
			end
		end
		
	end

end


function GerenciadorVeiculos:DrawVeiculo(veiculo_data)
	
	local dados = veiculo_data.dados
	local veiculo = dados.veiculo
	local aim = veiculo_data.aim
	local distancia = veiculo_data.distancia
	
	local escala = self:CalculateAlpha(
		distancia, 
        50,--self.vehicle_bias, 
        750,--self.vehicle_max, 
        500
	) --self.vehicle_limit)
	if not escala then return end
	local alpha = math.max(0, escala * 255 * (1.0 - (aim * 10)))
	
	local cor = math.lerp(Color( 200, 200, 200 ), Color(255,255,255), 0.3)
	
	
	local texto = dados.utensilhos.placa
	if texto then
		self:DrawPlaca(veiculo:GetPosition() + Vector3(0, 1, 0), texto, cor, escala, alpha)
	end
	
	if dados.utensilhos.neon then
		self:AtualizarNeon(veiculo:GetPosition(), dados.utensilhos.neon)
	end
	
	if dados.utensilhos.soundBuzina then
		self:AtualizarBusina(veiculo:GetPosition(), dados.utensilhos.soundBuzina)
	end
end


function GerenciadorVeiculos:DrawPlaca(pos, texto, cor, escala, alpha)

	local pos_2d, success = Render:WorldToScreen(pos)
	if not success then return end
	
    local width = Render:GetTextWidth(texto, TextSize.Default, escala)
    local height = Render:GetTextHeight(texto, TextSize.Default, escala)
	
	pos_2d = pos_2d - Vector2(width / 2, height / 2)
	
	self:DrawText(pos_2d, texto, cor, escala, alpha)
	
end


function GerenciadorVeiculos:DrawText(pos, text, cor, escala, alpha)

    local col = cor
    col.a = alpha

    Render:DrawText( pos + Vector2( 1, 1 ), text, 
        Color( 20, 20, 20, alpha * 0.6 ), TextSize.Default, escala)
    Render:DrawText( pos + Vector2( 2, 2 ), text, 
        Color( 20, 20, 20, alpha * 0.3 ), TextSize.Default, escala)

    Render:DrawText( pos, text, col, TextSize.Default, escala)
	
end


function GerenciadorVeiculos:CalculateAlpha( dist, bias, max, limit )
    if dist > limit then return nil end

    local alpha = 1

    if dist > bias then
        alpha =  1.0 - ( dist - bias ) /
                       ( max  - bias )
    end

    return alpha
end


function GerenciadorVeiculos:AimingAt( pos )
    local cam_pos   = Camera:GetPosition()
    local cam_dir   = Camera:GetAngle() * Vector3( 0, 0, -1 )

    local pos_dir   = (pos - cam_pos):Normalized()
    local diff      = (pos_dir - cam_dir):LengthSqr()

    return diff
end