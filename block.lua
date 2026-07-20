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
