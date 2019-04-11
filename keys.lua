keys = {
	up = false,
	down = false,
	left = false,
	right = false,
	escape = false,
	r = false
}

function love.keypressed(key)
	if key == "escape" then keys.escape = true end
	if key == "up" then keys.up = true end
	if key == "down" then keys.down = true end
	if key == "left" then keys.left = true end
	if key == "right" then keys.right = true end
	if key == "r" then keys.r = true end
end

function love.keyreleased(key)
	if key == "escape" then keys.escape = false end
	if key == "up" then keys.up = false end
	if key == "down" then keys.down = false end
	if key == "left" then keys.left = false end
	if key == "right" then keys.right = false end
	if key == "r" then keys.r = false end
end