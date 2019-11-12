require("assets.constants");
require("assets.sword");

local playerDraw = function(self)
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
    self.sword:attack();
    self.attacking = true;
end

local playerReset = function(self)
    self.attacking = false;
    self.sword:reset();
end

function newPlayer()
    local Player = {
        x = 30,
        y = WINDOW_HEIGHT-150,
        draw = playerDraw,
        move = playerMove,
        attacking = false,
        attack = playerAttack,
        reset = playerReset
    };
    local sword = newSword(Player, nil);
    Player.sword = sword;
    return Player;
end