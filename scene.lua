local camera = require("camera")
local newCamera = camera.newCamera()

local scene = {}

g = love.graphics

function scene.newScene(drawableElements, n)
	local newScene = {}

	newScene.number = n

	if drawableElements == nil then
		love.event.quit()
		print("Error! No drawable elements detected!")
	end

	newScene.drawableElements = drawableElements
	newScene.sceneCanvas = love.graphics.newCanvas()


	newScene.update = function(self)
		g.setCanvas(self.sceneCanvas)
		g.clear()
		for k, v in pairs(self.drawableElements) do
			for v, j in pairs(v) do
				j:draw()
			end
		end
		g.setCanvas()
	end

	newScene.draw = function(self)
	end

	return newScene
end

return scene