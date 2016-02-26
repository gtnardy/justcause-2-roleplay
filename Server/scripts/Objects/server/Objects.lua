class 'Objects'

function Objects:__init()
	
	self.structure = Structure()

	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
end


function Objects:ModuleUnload()

	for _, object in pairs(self.structure.objects) do
		object:Remove()
	end
end


class 'Structure'

function Structure:__init()

	self.objects = {}
	self.position = Vector3(-6337, 208.9, -3517)
	table.insert(self.objects, StaticObject.Create({position = self.position, angle = Angle(0, 0, 0), model = "areaset13.blz/cs_combase-v5b.lod", collision = "areaset13.blz/cs_combase_lod1-v5b_col.pfx"}))
	table.insert(self.objects, StaticObject.Create({position = self.position + Vector3(20, 0, -65), angle = Angle(3, 0, 0), model = "areaset13.blz/cs_combase-v5b.lod", collision = "areaset13.blz/cs_combase_lod1-v5b_col.pfx"}))
	table.insert(self.objects, StaticObject.Create({position = self.position + Vector3(65, 0, -20), angle = Angle(1.5, 0, 0), model = "areaset13.blz/cs_combase-v5b.lod", collision = "areaset13.blz/cs_combase_lod1-v5b_col.pfx"}))
	table.insert(self.objects, StaticObject.Create({position = self.position + Vector3(0, 0, -50), angle = Angle(-1.5, 0, 0), model = "areaset13.blz/cs_combase-v5b.lod", collision = "areaset13.blz/cs_combase_lod1-v5b_col.pfx"}))
	table.insert(self.objects, StaticObject.Create({position = self.position + Vector3(0, 4.9, -40), angle = Angle(0, 0, 0), model = "areaset13.blz/cs_res_t4-v3a.lod", collision = "areaset13.blz/cs_res_t4_lod1-v3a_col.pfx"}))
end


Objects = Objects()