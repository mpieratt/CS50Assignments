--[[
    Legend of Zelda

    Author: Mike Pieratt

]]

PlayerCarryIdleState = Class{__includes = BaseState}

function PlayerCarryIdleState:init(entity, dungeon)
    self.entity = entity
    self.dungeon = dungeon

    self.room = self.dungeon.currentRoom

    self.entity:changeAnimation('carry-idle-' .. self.entity.direction)
end

function PlayerCarryIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerCarryIdleState:update(dt)
    for k, object in pairs(self.room.objects) do 
        if object.type == 'pot' then 
            object.x = self.entity.x
            object.y = self.entity.y - 8
            object.solid = false
        end
    end

    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('carry')
    end
end



function PlayerCarryIdleState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end