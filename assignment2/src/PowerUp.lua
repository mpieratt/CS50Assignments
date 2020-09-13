--[[
    GD50
    Breakout Remake

    -- PowerUp Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Adds a powerup class, etc 
]]

PowerUp = Class{}

function PowerUp:init(x,y,key)
    self.x = x
    self.y = y
    self.key = key
   
    -- start us off with no velocity
    self.dy = -20

end

function PowerUp:update(dt)

    if self.y < VIRTUAL_HEIGHT then 
        self.y = self.y + self.y * dt
    end

end

function PowerUp:render()
    if self.key  then
        love.graphics.draw(gTextures['main'], gFrames['powerupkey'],
            self.x, self.y) 
    else
        love.graphics.draw(gTextures['main'], gFrames['powerup'],
            self.x, self.y)
    --love.graphics.rectangle('fill',self.x, self.y, 5,5)
    end
end