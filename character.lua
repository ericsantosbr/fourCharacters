character = {}

p = love.physics
g = love.graphics

--[[
commandSet = {
	up = "up",
	down = "down",
	left = "left",
	right = "right"
}

for k, v in pairs(self.commandSet) do
	if keys[commandSet.up] then
		self.body:applyForce(0, -250)
	end
end
]]
function character.newCharacter(x, y, width, height, color, commandSet)
	local newCharacter = {}

	newCharacter.x = x or 0
	newCharacter.y = y or 0
	newCharacter.width = width or 20
	newCharacter.height = height or 20
	newCharacter.color = color or {1, 0, 0, 1}
	newCharacter.commandSet = commandSet or {
		up = "up",
		down = "down",
		left = "left",
		right = "right"
	}

	newCharacter.body = p.newBody(world, x, y, "dynamic")
	newCharacter.shape = p.newRectangleShape(width, height)
	newCharacter.fixture = p.newFixture(newCharacter.body, newCharacter.shape)

	newCharacter.draw = function(self)
		g.setColor(self.color)
		g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	newCharacter.update = function(self, keys)
		if(keys[self.commandSet["up"]]) then self.body:applyForce(0, -200) end
		if(keys[self.commandSet["left"]]) then self.body:applyForce(-200, 0) end
		if(keys[self.commandSet["right"]]) then self.body:applyForce(200, 0) end
	end
	return newCharacter
end

return character