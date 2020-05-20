local lib = require("../../raylib")
local screenWidth = 800
local screenHeight = 450

lib.InitWindow(screenWidth, screenHeight, "raylib [shapes] example - basic shapes drawing")

lib.SetTargetFPS(60)       -- Set target frames-per-second
-------------------------------------------------------------------------------------------

-- Main game loop
while not lib.WindowShouldClose() do            -- Detect window close button or ESC key
    -- Update
    ---------------------------------------------------------------------------------------
    -- TODO: Update your variables here
    ---------------------------------------------------------------------------------------

    -- Draw
    ---------------------------------------------------------------------------------------
    lib.BeginDrawing()

    lib.ClearBackground(lib.RAYWHITE)

    lib.DrawText("some basic shapes available on raylib", 20, 20, 20, lib.DARKGRAY)

    lib.DrawLine(18, 42, screenWidth - 18, 42, lib.BLACK)

        lib.DrawCircle(screenWidth/4, 120, 35, lib.DARKBLUE)
        lib.DrawCircleGradient(screenWidth/4, 220, 60, lib.GREEN, lib.SKYBLUE)
        lib.DrawCircleLines(screenWidth/4, 340, 80, lib.DARKBLUE)

        lib.DrawRectangle(screenWidth/4*2 - 60, 100, 120, 60, lib.RED)
        lib.DrawRectangleGradientV(screenWidth/4*2 - 90, 170, 180, 130, lib.MAROON, lib.GOLD)
        lib.DrawRectangleLines(screenWidth/4*2 - 40, 320, 80, 60, lib.ORANGE)

        lib.DrawTriangle(lib.Vector2(screenWidth/4*3, 80),
        lib.Vector2(screenWidth/4*3 - 60, 150),
        lib.Vector2(screenWidth/4*3 + 60, 150), lib.VIOLET)

        lib.DrawTriangleLines(lib.Vector2(screenWidth/4*3, 160),
        lib.Vector2(screenWidth/4*3 - 20, 230),
        lib.Vector2(screenWidth/4*3 + 20, 230), lib.DARKBLUE)

        lib.DrawPoly(lib.Vector2(screenWidth/4*3, 320), 6, 80, 0, lib.BROWN)

        lib.EndDrawing()
    ---------------------------------------------------------------------------------------
end

-- De-Initialization
-------------------------------------------------------------------------------------------
lib.CloseWindow()        -- Close window and OpenGL context
-------------------------------------------------------------------------------------------