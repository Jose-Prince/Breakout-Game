Player = Object.extend(Object)

function Player:new(x, y, speed)
    local screen_width = love.graphics.getWidth()

    self.width = screen_width/5
    self.height = screen_width/28

    self.x = x
    self.y = y
    self.speed = speed or 75
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
    if love.keyboard.isDown("left") and self.x > 0 then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") and self.x < love.graphics.getWidth() - self.width then
        self.x = self.x + self.speed * dt
    end
end
