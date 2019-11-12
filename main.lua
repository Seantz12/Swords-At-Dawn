require("assets.background");
require("assets.constants");
require("assets.player")

local p1;

function love.load()
    love.graphics.setBackgroundColor(1, 153/255, 0);
    p1 = newPlayer();
end

function handlePlayerInput(player)
    if not player.attacking then
        if love.keyboard.isDown('r') then
            player:attack();
            player.attackStartTime = love.timer.getTime();
        elseif love.keyboard.isDown('d') then
            player:move("right");
        elseif love.keyboard.isDown('a') then
            player:move("left");
        end
    elseif player.attacking then
        local timeSinceAttack = love.timer.getTime() - player.attackStartTime;
        if timeSinceAttack > 0.2 and timeSinceAttack < 0.3 then
            player:activeAttack();
        elseif timeSinceAttack > 0.3 and timeSinceAttack < 0.5 then
            player:inactiveAttack();
        elseif timeSinceAttack > 0.5 then
            player:reset();
        end
    end
end

function love.update(dt)
    handlePlayerInput(p1);
end

function love.draw()
    drawBackground();
    p1:draw();
end