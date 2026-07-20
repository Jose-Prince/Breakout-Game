Block = Object.extend(Object)

function Block:new(width, height, x, y)
    self.width = width
    self.height = height
    self.x = x
    self.y = y
end

function Block:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Block:destroy()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end
