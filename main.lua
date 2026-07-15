Object = require "classic"
require "player"

local player

function love.load()
    -- Screen dimensions
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()

    local speed = 5 * screen_width / 8
    player = Player(screen_width/2, screen_height - screen_height/12, speed)
end

function love.draw()
    player:draw()
end

function love.update(dt)
    player:move(dt)
end
