require('assets.background');
require('assets.constants');

function love.load()
    love.graphics.setBackgroundColor(1, 153/255, 0);
end

function love.draw()
    drawBackground();
end