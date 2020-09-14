--[[
    Legend of Zelda

    Author: Mike Pieratt

]]

PlayerCarryState = Class{__includes = EntityWalkState}

function PlayerCarryState:init(entity, dungeon)
    self.entity = entity
    self.dungeon = dungeon

    self.room = self.dungeon.currentRoom

    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0


    self.entity:changeAnimation('carry-' .. self.entity.direction)
end

function PlayerCarryState:enter(params)
    self.entity.currentAnimation:refresh()
end

function PlayerCarryState:update(dt)
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('carry-left')
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('carry-right')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('carry-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('carry-down')
    else
        self.entity:changeState('carry-idle')
    end

    --fire selection logic for pot 
    if love.keyboard.isDown('kp0') then 
        for k, object in pairs(self.room.objects) do 
            if object.type == 'pot' then 
                if self.entity.direction == 'left' then 
                    object:fire(-object.projectileSpeed, 0, dt)
                elseif self.entity.direction == 'right' then
                    object:fire(object.projectileSpeed, 0, dt)
                elseif self.entity.direction == 'up' then
                    object:fire(0, -object.projectileSpeed, dt)
                else
                    object:fire(0, object.projectileSpeed, dt)
                end
                
                self.entity:changeState('idle')
            end
        end
    end

    
    -- perform base collision detection against walls
    EntityWalkState.update(self, dt)
    
    for k, object in pairs(self.room.objects) do 
        if object.type == 'pot' then 
            object.x = self.entity.x
            object.y = self.entity.y - 8
            --object.solid = false
        end
    end
end



function PlayerCarryState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end