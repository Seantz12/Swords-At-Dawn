require("assets.background");
require("assets.constants");
require("assets.player");

local p1;
local p2;
local gameActive = true;

local test_dummy = {
    x = WINDOW_WIDTH-30,
    y = WINDOW_HEIGHT-150,
    width = PLAYER_WIDTH,
    height = PLAYER_HEIGHT,
    draw = function (self)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height);
    end
}

function love.load()
    love.graphics.setBackgroundColor(1, 153/255, 0);
    p1 = newPlayer('left');
    p2 = newPlayer('right');
    p1.attackHighButton = 'r';
    p1.left = 'a';
    p1.right = 'd';
    p2.attackHighButton = 'u';
    p2.left = 'j';
    p2.right = 'l';
    p1:attachSwordOpponent(p2);
    p2:attachSwordOpponent(p1);
end

function handlePlayerInput(player)
    if not player.attacking then
        if love.keyboard.isDown(player.attackHighButton) then
            player:attack();
            player.attackStartTime = love.timer.getTime();
        elseif love.keyboard.isDown(player.right) then
            player:move("right");
        elseif love.keyboard.isDown(player.left) then
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

function checkPlayerDead(player)
    if player.alive == false then
        print("game over bucko");
        gameActive = false;
    end
end

function love.update(dt)
    if gameActive then
        checkPlayerDead(p1);
        checkPlayerDead(p2);
        handlePlayerInput(p1);
        handlePlayerInput(p2);
    end
end

function love.draw()
    drawBackground();
    p1:draw();
    p2:draw();
end