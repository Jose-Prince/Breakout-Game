Ball = Object.extend(Object)

function Ball:new(x, y, radius, direction, speed)
    self.x = x
    self.y = y
    self.radius = radius
    self.direction = direction
    self.speed = speed or 101
    self.inc = speed * 1.05
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Ball:move(dt)
    self.y = self.y + (self.speed * math.sin(self.direction) * dt)
    self.x = self.x + (self.speed * math.cos(self.direction)  *dt)
    self:redirection()
end

function Ball:redirection()
    local top = 1
    local left_border = 1
    local right_border = love.graphics.getWidth()

    if self.x - self.radius < left_border then
        self.x = left_border + self.radius
        self.direction = math.pi - self.direction
    end

    if self.x + self.radius > right_border then
        self.x = right_border - self.radius
        self.direction = math.pi - self.direction
    end

    if self.y - self.radius < top then
        self.y = top + self.radius
        self.direction = -self.direction
    end
end
