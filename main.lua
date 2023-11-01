require('vector')
require('particle')
require('particlesystem')
require('repeller')
require('rectangle')

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    rectangles = {}

    ps = ParticleSystem:create(Particle)

    rectangles[1] = Rectangle:create(Vector:create(300, 250), 25, 75)
    rectangles[2] = Rectangle:create(Vector:create(400, 400), 50, 75)
    rectangles[3] = Rectangle:create(Vector:create(500, 500), 50, 40)
    rectangles[4] = Rectangle:create(Vector:create(100, 400), 20, 35)
    rectangles[5] = Rectangle:create(Vector:create(500, 100), 100, 80)
end

function love.update()
    ps:update(repeller)
end

function love.draw()
    ps:draw()
    for v, r in pairs(rectangles) do
        r:draw()
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    for k, r in pairs(rectangles) do
        if r:onClick(ps, x, y) then 
            table.remove(rectangles, k)
        end
    end
end