require("assets.constants");

local playerDraw = function(self)
    love.graphics.setColor(0, 0, 0);
    love.graphics.rectangle("fill", self.x, self.y, 30, 50);
    resetColor();
end

local playerMove = function(self, direction)
    if direction == "right" then
        self.x = self.x + 0.3;
    elseif direction == "left" then
        self.x = self.x - 0.3;
    end
end

function newPlayer()
    local Player = {
        x = 30,
        y = WINDOW_HEIGHT-150,
        draw = playerDraw,
        move = playerMove
    };
    return Player;
end