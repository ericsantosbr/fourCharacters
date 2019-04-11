character = {}

p = love.physics
g = love.graphics

-- color = {r, g, b, a}
function character.newCharacter(x, y, width, height, color)
	local newCharacter = {}

	newCharacter.x = x or 0
	newCharacter.y = y or 0
	newCharacter.width = width or 20
	newCharacter.height = height or 20
	newCharacter.color = color or {0.8, 0.8, 0.8, 1}

	newCharacter.body = p.newBody(world, x, y, "dynamic")
	newCharacter.shape = p.newRectangleShape(width, height)
	newCharacter.fixture = p.newFixture(newCharacter.body, newCharacter.shape)

	newCharacter.draw = function(self)
		g.setColor(self.color)
		g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	newCharacter.update = function(self, keys)
		if(keys.up) then self.body:applyForce(0, -200) end
		if(keys.left) then self.body:applyForce(-200, 0) end
		if(keys.right) then self.body:applyForce(200, 0) end
	end
	return newCharacter
end

return character