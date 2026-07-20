Ball = Object.extend(Object)

function Ball:new(x, y, radius, direction, speed)
    self.x = x
    self.y = y
    self.radius = radius
    self.direction = direction
    self.speed = speed or 101
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
    local bottom = love.graphics.getHeight()
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

    if self.y + self.radius > bottom then
        print("GAME OVER")
        love.event.quit()
    end
end

function Ball:bounceOff(object)
    local overlapLeft = (self.x + self.radius) - object.x
    local overlapRight = (object.x + object.width) - (self.x - self.radius)
    local overlapTop = (self.y + self.radius) - object.y
    local overlapBottom = (object.y + object.height) - (self.y - self.radius)

    local minOverlap = math.min(overlapLeft, overlapRight, overlapTop, overlapBottom)

    if minOverlap == overlapTop then
        local center = object.x + object.width / 2
        local offset = (self.x - center) / (object.width / 2)
        
        offset = math.max(-1, math.min(1, offset))

        local MAX_BOUNCE_ANGLE = math.rad(60)

        self.direction = -math.pi / 2 + offset * MAX_BOUNCE_ANGLE
        self.y = object.y - self.radius
    elseif minOverlap == overlapBottom then
        self.direction = -self.direction
        self.y = object.y + object.height + self.radius
    elseif minOverlap == overlapLeft then
        self.direction = math.pi - self.direction
        self.x = object.x - self.radius
    else
        self.direction = math.pi - self.direction
        self.x = object.x + object.width + self.radius
    end

    self.speed = self.speed * 1.02
end
