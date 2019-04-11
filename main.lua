scene = require("scene")
character = require("character")
camera = require("camera")

myCamera = camera.newCamera(0, 0, 1, 1, 0)

require("keys")

g = love.graphics
p = love.physics

-- contain subtables with elements to be drawn and updated
drawableElements = {}
characters = {}
worldElements = {}

updateableElements = {}

scenes = {}

table.insert(drawableElements, characters)
table.insert(drawableElements, worldElements)

table.insert(updateableElements, characters)


function love.load()
	world = p.newWorld(0, 9.8 * 64)

	p.setMeter(64)

	-- test character
	table.insert(characters, character.newCharacter(400, 300, 20, 20, {1, 0, 0, 1}))

	ground = {}
	ground.body = p.newBody(world, g.getWidth() / 2, 550, "static")
	ground.shape = p.newRectangleShape(800, 100)
	ground.fixture = p.newFixture(ground.body, ground.shape)
	ground.color = {0.4, 0.86, 0.2, 1}

	-- test wall objects
	wall1 = {}
	wall1.body = p.newBody(world, 2, g.getHeight() / 2, "static")
	wall1.shape = p.newRectangleShape(4, g.getHeight())
	wall1.fixture = p.newFixture(wall1.body, wall1.shape)
	wall1.draw = function(self)
		-- g.setColor(0, 0, 1, 1)
		-- g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	table.insert(worldElements, wall1)

	wall2 = {}
	wall2.body = p.newBody(world, g.getWidth() / 2, 2, "static")
	wall2.shape = p.newRectangleShape(g.getWidth(), 4)
	wall2.fixture = p.newFixture(wall2.body, wall2.shape)
	wall2.draw = function(self)
		-- g.setColor(0, 0, 1, 1)
		-- g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	table.insert(worldElements, wall2)


	wall3 = {}
	wall3.body = p.newBody(world, g.getWidth() - 2, g.getHeight() / 2)
	wall3.shape = p.newRectangleShape(4, g.getHeight())
	wall3.fixture = p.newFixture(wall3.body, wall3.shape)
	wall3.draw = function(self)
		-- g.setColor(0, 0, 1, 1)
		-- g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	table.insert(worldElements, wall3)


	-- test ground object
	ground.draw = function(self)
		g.setColor(self.color)
		g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	end

	table.insert(worldElements, ground)

	for i = 1, 4 do
		local newScene = g.newCanvas()
		table.insert(scenes, scene.newScene(drawableElements, i))
	end
end

function love.update(dt)
	if keys.escape then love.event.quit() end
	if keys.r then love.event.quit("restart") end
	world:update(dt)

	for i, j in pairs(updateableElements) do
		for k, v in pairs(j) do
			v:update(keys)
		end
	end

	-- updates the scene canvases
	for i in pairs(scenes) do
		scenes[i]:update()
	end
end

function love.draw()
	for i, v in pairs(scenes) do
		g.setBackgroundColor(0.5, 0.7, 0.67)

		if scenes[i].number == 1 then
			g.draw(scenes[i].sceneCanvas, 0, 0, 0, .5, .5)
		end

		if scenes[i].number == 2 then
			g.draw(scenes[i].sceneCanvas, g.getWidth() / 2, 0, 0, .5, .5)
		end

		if scenes[i].number == 3 then
			g.draw(scenes[i].sceneCanvas, 0, g.getHeight() / 2, 0, .5, .5)
		end

		if scenes[i].number == 4 then
			g.draw(scenes[i].sceneCanvas, g.getWidth() / 2, g.getHeight() / 2, 0, .5, .5)
		end
	end
end