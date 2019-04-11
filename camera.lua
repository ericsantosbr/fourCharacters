local camera = {}

-- (x position, y position, scale x, scale y, rotation)
function camera.newCamera(x, y, sx, sy, r)
	local newCamera = {}

	newCamera.x = x or 0
	newCamera.y = y or 0
	newCamera.scaleX = sx or 1
	newCamera.scaleY = sy or 1
	newCamera.rotation = r or 0

	newCamera.set = function(self)
		love.graphics.push()
		love.graphics.rotate(self.rotation)
		love.graphics.translate(-self.x, -self.y)
		love.graphics.scale(1 / self.scaleX, 1 / self.scaleX)
	end

	newCamera.unset = function(self)
		love.graphics.pop()
	end

	newCamera.move = function(self, dx, dy)
		self.x = self.x + (dx or 0)
		self.y = self.y + (dy or 0)
	end

	newCamera.rotate = function(self, r)
		self.rotation = self.rotation + r or self.rotation
	end

	newCamera.setPosition = function(self, x, y)
		self.x = x or self.x
		self.y = y or self.y
	end

	newCamera.scale = function(self, sx, sy)
		sx = sx or 1
		self.scaleX = self.scaleX * sx
		self.scaleY = self.scaleY * (sy or sx)
	end

	newCamera.setScale = function(self, sx, sy)
		self.scaleX = sx or self.scaleX
		self.scaleY = sy or self.scaleY
	end

	return newCamera
end

return camera