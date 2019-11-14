require("assets.constants");

local swordImage = love.graphics.newImage("assets/images/katana.png")
local SWORD_SCALE_FACTOR = 0.1;
local swordWidth = swordImage:getWidth();
local swordHeight = swordImage:getHeight();

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
    else
        love.graphics.draw(
            swordImage,
            self.x,
            self.y + 20,
            math.rad(125), -- rotation
            SWORD_SCALE_FACTOR,
            SWORD_SCALE_FACTOR,
            0,
            0
        );
    end
end

local swordAttack = function(self)
    self.active = true;
    if (self.x + swordWidth) > self.opponent.x and
       (self.x + swordWidth) < (self.opponent.x + self.opponent.width) and
       (self.y + swordHeight) > self.opponent.y and
       (self.y + swordHeight) < (self.opponent.y + self.opponent.height) then
        print("hello i hit");
    else
        print("i missed");
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
        x = player.x + PLAYER_WIDTH + swordWidth * SWORD_SCALE_FACTOR,
        y = player.y - swordHeight * SWORD_SCALE_FACTOR * 0.5,
        draw = drawSword,
        attack = swordAttack,
        active = false, -- being active means it can hurt
        attachOpponent = swordAttachOpponent,
        reset = swordReset
    };
    return sword;
end