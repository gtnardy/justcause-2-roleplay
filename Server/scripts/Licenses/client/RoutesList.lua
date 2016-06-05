class 'RoutesList'

function RoutesList:__init()
	self.routes = {
		A = {
			startingPosition = Vector3(-10100, 207, -3382),
			routeTime = 30,
			startingAngle = Angle(-1.56, 0, 0),
			modelId = 29,
			checkpoints = {
				Vector3(-9974, 207, -3380), 
				Vector3(-9804, 207, -3360), 
				Vector3(-9600, 207, -3380), 
			}
		},
	}
end


function RoutesList:GetRoute(license)
	return self.routes[license]
end
