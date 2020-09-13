--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end

    -- protectile shit
    self.projectileSpeed = def.projectileSpeed or 0
    self.projectileRange = def.projectileRange or 0
    self.distance = 0
end

function GameObject:update(dt)
    
    if self.dx then 
        self.x = self.x + self.dx * dt
        self.distance = self.distance + math.abs(self.dx * dt)
    end

    if self.dy then 
        self.y = self.y + self.dy * dt
        self.distance = self.distance + math.abs(self.dy * dt)
    end

    if self.distance > self.projectileRange then 
        Event.dispatch('despawn')
    end

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        math.floor(self.x + adjacentOffsetX), math.floor(self.y + adjacentOffsetY))
end

function GameObject:fire(dx, dy, dt)
    self.dx = dx
    self.dy = dy


end