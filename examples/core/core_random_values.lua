local lib = require("../../raylib")
local screenWidth = 800
local screenHeight = 450

lib.InitWindow(screenWidth, screenWidth,
               "raylib [core] example - generate random values")
lib.SetTargetFPS(60)

local framesCounter = 0
local randValue = lib.GetRandomValue(-8, 5)

while not lib.WindowShouldClose() do
    framesCounter = framesCounter + 1

    if (((framesCounter / 120) % 2) == 1) then
        randValue = lib.GetRandomValue(-8, 5)
        framesCounter = 0
    end
    lib.BeginDrawing()
        lib.ClearBackground(lib.RAYWHITE)
        lib.DrawText("Every 2 seconds a new random value is generated:", 130, 100,
                    20, lib.MAROON)
        lib.DrawText(string.format("%i", randValue), 360, 180, 80, lib.LIGHTGRAY)
    lib.EndDrawing()
end

lib.CloseWindow()
