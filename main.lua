require("assets.background");
require("assets.constants");
require("assets.player")

local p1;

function love.load()
    love.graphics.setBackgroundColor(1, 153/255, 0);
    p1 = newPlayer();
end

function love.update(dt)
    if love.keyboard.isDown('d') then
        p1:move("right");
    elseif love.keyboard.isDown('a') then
        p1:move("left");
    elseif love.keyboard.isDown('r') then
        p1:attack();
    end
end

function love.draw()
    drawBackground();
    p1:draw();
end