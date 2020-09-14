--[[
    Legend of Zelda

    Author: Mike Pieratt

]]

PlayerLiftState = Class{__includes = BaseState}

function PlayerLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.room = self.dungeon.currentRoom

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 0

    local direction = self.player.direction

    self.player:changeAnimation('lift-' .. self.player.direction)
end

function PlayerLiftState:enter(params)
    -- restart lift animation
    self.player.currentAnimation:refresh()
end

function PlayerLiftState:update(dt)
    if self.player.currentAnimation.timesPlayed > 0 then 
        self.player.currentAnimation.timesPlayed = 0 
        self.player:changeState('carry-idle') 
    end
end

function PlayerLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))


end