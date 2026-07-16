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

    if checkCollision(player, ball) and math.sin(ball.direction) > 0 then
        ball:bounceOff(player)
    end
end

function checkCollision(object, ball)
    local object_left = object.x
    local object_right = object.x + object.width
    local object_top = object.y
    local object_bottom = object.y + object.height

    local ball_left = ball.x - ball.radius
    local ball_right = ball.x + ball.radius
    local ball_top = ball.y - ball.radius
    local ball_bottom = ball.y + ball.radius

    return object_right > ball_left
        and object_left < ball_right
        and object_bottom > ball_top
        and object_top < ball_bottom
end
