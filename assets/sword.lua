require("assets.constants");

local swordImage = love.graphics.newImage("assets/images/katana.png")
local SWORD_SCALE_FACTOR = 0.1;
local swordWidth = swordImage:getWidth() * SWORD_SCALE_FACTOR;
local swordHeight = swordImage:getHeight() * SWORD_SCALE_FACTOR;

local drawSword = function(self)
    if not self.active then
        love.graphics.draw(
            swordImage,
            self.x,
            self.y,
            math.rad(90), -- rotation
            SWORD_SCALE_FACTOR,
            SWORD_SCALE_FACTOR,
            0,
            0
        );
        -- DEBUG HITBOX --
        love.graphics.setColor(0.5, 0.5, 0.5);
        love.graphics.rectangle("fill", self.x, self.y, 10, 10);
        resetColor();
    else
        love.graphics.draw(
            swordImage,
            self.x,
            self.y + 30,
            math.rad(125), -- rotation
            SWORD_SCALE_FACTOR,
            SWORD_SCALE_FACTOR,
            0,
            0
        );
        -- DEBUG HITBOX --
        love.graphics.setColor(0.5, 0.5, 0.5);
        love.graphics.rectangle("fill", self.x, self.y+30, 10, 10);
        resetColor();
    end
end

local swordAttack = function(self)
    self.active = true;
    if not self.opponent == nil then
        if self.x > self.opponent.x and
        self.x < (self.opponent.x + self.opponent.width) and
        (self.y + 30) > self.opponent.y and
        (self.y + 30) < (self.opponent.y + self.opponent.height) then
            print("hello i hit");
        else
            print("i missed");
        end
    end
end

local swordReset = function(self)
    self.active = false;
end

local swordAttachOpponent = function(self, opponent)
    self.opponent = opponent
end

function newSword(player)
    local sword = {
        x = player.x + PLAYER_WIDTH + swordWidth,
        y = player.y - swordHeight * 0.5,
        draw = drawSword,
        attack = swordAttack,
        active = false, -- being active means it can hurt
        attachOpponent = swordAttachOpponent,
        reset = swordReset
    };
    return sword;
end