require("assets.constants");

function drawBackground()
    love.graphics.setColor(0, 0, 0);
    love.graphics.rectangle("fill", 0, WINDOW_HEIGHT-100, WINDOW_WIDTH, 100);
    resetColor();
end