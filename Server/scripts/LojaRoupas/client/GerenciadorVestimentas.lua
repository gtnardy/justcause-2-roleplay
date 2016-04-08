class 'GerenciadorVestimentas'

function GerenciadorVestimentas:__init()

	self.playerVestimentas = {}

	Events:Subscribe("Render", self, self.Render)

	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("EntitySpawn", self, self.EntitySpawn)
	Events:Subscribe("EntityDespawn", self, self.EntityDespawn)
	Events:Subscribe("PlayerNetworkValueChange", self, self.PlayerNetworkValueChange)

	self.listaVestimentas = ListaVestimentas()
	
end


function GerenciadorVestimentas:EntitySpawn(args)

	if args.entity.__type == "Player" then
		self:CriarVestimentas(args.entity)
	end
end


function GerenciadorVestimentas:EntityDespawn(args)

	if args.entity.__type == "Player" then
		self:DestruirVestimentas(args.entity)
	end
	
end


function GerenciadorVestimentas:ModuleLoad()

	for p in Client:GetStreamedPlayers() do
		self:CriarVestimentas(p)
	end

	self:CriarVestimentas(LocalPlayer)
	
end


function GerenciadorVestimentas:ModuleUnload()

	for k, vestimentas in pairs(self.playerVestimentas) do
	
		for _, vestimenta in ipairs(vestimentas) do
		
			local objeto = vestimenta.objeto
			if IsValid(objeto) then
			
				objeto:Remove()

			end
		end	
		
	end
	
end


function GerenciadorVestimentas:DestruirVestimentas(player)

	local vestimentas = self.playerVestimentas[player:GetId()]
	if vestimentas != nil then
		
		for _, vestimenta in ipairs(vestimentas) do
		
			local objeto = vestimenta.objeto
			if IsValid(objeto) then
			
				objeto:Remove()

			end
		end	

		self.playerVestimentas[player:GetId()] = nil
		
	end
	
end


function GerenciadorVestimentas:CriarVestimentas(player)

	self:DestruirVestimentas(player)	
	
	local utensilhos = player:GetValue("utensilhos")
	if (utensilhos) then
		self.playerVestimentas[player:GetId()] = {}
		local utensilhosDivididos = utensilhos:split(",")
		for i, utensilhoString in ipairs(utensilhosDivididos) do
			local stringDividida = utensilhoString:split("=")
			local tipo = tonumber(stringDividida[1])
			local idVestimenta = tonumber(stringDividida[2])
			
			local vestimentasTipo = self.listaVestimentas.vestimentas[tipo]
			if (vestimentasTipo) then
				local vestimenta = vestimentasTipo[idVestimenta]
				
				
				-- nome, modelo, preco
				if (vestimenta) then
					local staticObject = ClientStaticObject.Create({
						position = player:GetBonePosition(vestimentasTipo.bone), -- Place the hat at the model's head
						angle = player:GetBoneAngle(vestimentasTipo.bone), -- Angle the hat at the same angle of the model's head
						model = vestimenta.modelo
					})
					
					
					table.insert(self.playerVestimentas[player:GetId()], {objeto = staticObject, bone = vestimentasTipo.bone})
				
				end
			end
		end
		
	end


end


function GerenciadorVestimentas:PlayerNetworkValueChange(args)

	if args.key == "utensilhos" then
		self:CriarVestimentas(args.player)
	end
	
end


function GerenciadorVestimentas:MoverVestimentas(player)

	if IsValid(player) then
		
		local vestimentas = self.playerVestimentas[player:GetId()]
		if (vestimentas) then
			
			for _, vestimenta in ipairs(vestimentas) do
				
				local objeto = vestimenta.objeto
				if objeto ~= nil and IsValid(objeto) then
					objeto:SetAngle(player:GetBoneAngle(vestimenta.bone))
					local hatoffset = objeto:GetAngle() * Vector3(0,1.62,.03)
					objeto:SetPosition(player:GetBonePosition(vestimenta.bone) - hatoffset)
				end
			end
		end

	end

end



function GerenciadorVestimentas:Render()
	
	for p in Client:GetStreamedPlayers() do
		self:MoverVestimentas(p)
	end

	self:MoverVestimentas(LocalPlayer)	


end


gerenciadorVestimentas = GerenciadorVestimentas()