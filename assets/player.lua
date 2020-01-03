require("assets.constants");
require("assets.sword");

local playerDraw = function(self)
    if self.alive == true then
        love.graphics.setColor(0, 0, 0);
        love.graphics.rectangle(
            "fill", 
            self.x, 
            self.y, 
            PLAYER_WIDTH, 
            PLAYER_HEIGHT
        );
        resetColor();
        self.sword:draw();
    end
end

local playerMove = function(self, direction)
    if direction == "right" then
        self.x = self.x + MOVEMENT_SPEED;
        self.sword.x = self.sword.x + MOVEMENT_SPEED;
    elseif direction == "left" then
        self.x = self.x - MOVEMENT_SPEED;
        self.sword.x = self.sword.x - MOVEMENT_SPEED;
    end
end

local playerAttack = function(self)
    self.attacking = true;
end

local playerActiveAttack = function(self)
    self.sword:attack();
end

local playerInactiveAttack = function(self)
    self.sword:reset();
end

local playerReset = function(self)
    self.attacking = false;
end

local playerAttachSwordOpponent = function(self, opponent)
    self.sword:attachOpponent(opponent)
end

local playerDie = function(self)
    self.alive = false
end

function newPlayer(side)
    local x = 0;
    if side == 'left' then
        x = 30;
    else
        x = WINDOW_WIDTH - 30*2;
    end
    local Player = {
        x = x,
        y = WINDOW_HEIGHT-150,
        draw = playerDraw,
        move = playerMove,
        attacking = false,
        attack = playerAttack,
        attackStartTime = 0,
        alive = true,
        activeAttack = playerActiveAttack,
        inactiveAttack = playerInactiveAttack,
        attachSwordOpponent = playerAttachSwordOpponent,
        die = playerDie,
        reset = playerReset,
        side = side
    };
    local sword = newSword(Player);
    Player.sword = sword;
    return Player;
end