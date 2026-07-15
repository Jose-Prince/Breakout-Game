Object = require "classic"
require "player"
require "ball"

local player
local ball

function love.load()
    -- Screen dimensions
    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()

    local speed = 5 * screen_width / 8
    player = Player(screen_width/2, screen_height - screen_height/12, speed)
    ball = Ball(screen_width/2, 3*screen_height/4, screen_height/64, 270, speed)
end

function love.draw()
    player:draw()
    ball:draw()
end

function love.update(dt)
    player:move(dt)
    ball:move(dt)
end
