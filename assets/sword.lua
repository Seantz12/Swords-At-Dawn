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
end

function newSword(player, opponent)
    local sword = {
        x = player.x + PLAYER_WIDTH + swordWidth * SWORD_SCALE_FACTOR,
        y = player.y - swordHeight * SWORD_SCALE_FACTOR * 0.5,
        opponent = opponent, -- for collision purposes
        draw = drawSword,
        attack = swordAttack,
        active = false -- being active means it can hurt
    };
    return sword;
end