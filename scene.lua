local camera = require("camera")

local scene = {}

g = love.graphics

function scene.newScene(drawableElements, n, centerElement)
	local newScene = {}

	newScene.number = n
	newScene.centerElement = centerElement
	newScene.camera = camera.newCamera()

	if drawableElements == nil then
		love.event.quit()
		print("Error! No drawable elements detected!")
	end

	newScene.drawableElements = drawableElements
	newScene.sceneCanvas = love.graphics.newCanvas()


	newScene.update = function(self)
		g.setCanvas(self.sceneCanvas)
		g.clear()
		if self.centerElement then
			local x, y = centerElement.body:getWorldCenter()
			self.camera:setPosition(x - g.getWidth() / 2, y - g.getHeight() / 2)
			self.camera:set()
			for k, v in pairs(self.drawableElements) do
				for v, j in pairs(v) do
					j:draw()
				end
			end
			self.camera:unset()

		else
			for k, v in pairs(self.drawableElements) do
				for v, j in pairs(v) do
					j:draw()
				end
			end
		end
		g.setCanvas()
	end

	newScene.draw = function(self)
	end

	return newScene
end

return scene