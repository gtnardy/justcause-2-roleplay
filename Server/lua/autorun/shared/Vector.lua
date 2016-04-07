function Vector3.ParseString(str)
	if not str then return nil end
	local v = tostring(str):split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
end