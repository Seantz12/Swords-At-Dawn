require("assets.constants");

function drawBackground()
    love.graphics.setColor(0, 0, 0);
    love.graphics.rectangle(
        "fill", 
        0, -- x 
        WINDOW_HEIGHT-BACKGROUND_HEIGHT, -- y
        WINDOW_WIDTH,
        BACKGROUND_HEIGHT
    );
    resetColor();
end