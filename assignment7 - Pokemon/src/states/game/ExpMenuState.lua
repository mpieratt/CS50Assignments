--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

ExpMenuState = Class{__includes = BaseState}

function ExpMenuState:init(def)
    
    self.ExpMenu = Menu {
        x = VIRTUAL_WIDTH - 280,
        y = VIRTUAL_HEIGHT - 180,
        width = 200,
        height = 120,
        cursorFlag = false,
        items = def.statItems
    }
end

function ExpMenuState:update(dt)
    self.ExpMenu:update(dt)
end

function ExpMenuState:render()
    self.ExpMenu:render()
end