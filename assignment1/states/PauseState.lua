--[[
    PauseState Class
    Author: Mike Pieratt
    mike.pieratt@gmail.com

    A simple state used to pause the game. Trasitions from PlayState and back. 
]]

PauseState = Class{__includes = BaseState}

function PauseState:update(dt)

    scrolling = false
    sounds['music']:pause()
    
    -- go back to play if p is pressed 
    if love.keyboard.wasPressed('p') then
        scrolling = true 
        sounds['music']:play()
        gStateMachine:change('play')
    end
end


function PauseState:render()
    pauseButton = love.graphics.newImage('pauseButton.png')
    love.graphics.draw(pauseButton, VIRTUAL_WIDTH / 2 - pauseButton:getWidth()/2, VIRTUAL_HEIGHT /2 - pauseButton:getHeight()/2)
end