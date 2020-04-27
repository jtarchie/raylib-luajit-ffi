local lib = require("../../raylib")
local screenWidth = 800
local screenHeight = 450

lib.InitWindow(screenWidth, screenHeight,
               "raylib [core] example - 3d camera free")

-- Define the camera to look into our 3d world
local camera = lib.Camera3D()
camera.position = lib.Vector3(10.0, 10.0, 10.0) -- Camera position
camera.target = lib.Vector3(0.0, 0.0, 0.0) -- Camera looking at point
camera.up = lib.Vector3(0.0, 1.0, 0.0) -- Camera up vector (rotation towards target)
camera.fovy = 45.0 -- Camera field-of-view Y

local cubePosition = lib.Vector3(0.0, 0.0, 0.0)

lib.SetCameraMode(camera, lib.CAMERA_FREE) -- Set a free camera mode

lib.SetTargetFPS(60) -- Set our game to run at 60 frames-per-second
-------------------------------------------------------------------------------------------

-- Main game loop
while not lib.WindowShouldClose() do -- Detect window close button or ESC key
    -- Update
    ---------------------------------------------------------------------------------------
    lib.UpdateCamera(camera) -- Update camera
    ---------------------------------------------------------------------------------------

    -- Draw
    ---------------------------------------------------------------------------------------
    lib.BeginDrawing()

        lib.ClearBackground(lib.RAYWHITE)

        lib.BeginMode3D(camera)

        lib.DrawCube(cubePosition, 2.0, 2.0, 2.0, lib.RED)
        lib.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, lib.MAROON)

        lib.DrawGrid(10, 1.0)

        lib.EndMode3D()

        lib.DrawRectangle(10, 10, 320, 133, lib.Fade(lib.SKYBLUE, 0.5))
        lib.DrawRectangleLines(10, 10, 320, 133, lib.BLUE)

        lib.DrawText("Free camera default controls:", 20, 20, 10, lib.BLACK)
        lib.DrawText("- Mouse Wheel to Zoom in-out", 40, 40, 10, lib.DARKGRAY)
        lib.DrawText("- Mouse Wheel Pressed to Pan", 40, 60, 10, lib.DARKGRAY)
        lib.DrawText("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10,
                    lib.DARKGRAY)
        lib.DrawText("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom", 40, 100,
                    10, lib.DARKGRAY)
        lib.DrawText("- Z to zoom to (0, 0, 0)", 40, 120, 10, lib.DARKGRAY)

    lib.EndDrawing()
    ---------------------------------------------------------------------------------------
end

-- De-Initialization
-------------------------------------------------------------------------------------------
lib.CloseWindow() -- Close window and OpenGL context
-------------------------------------------------------------------------------------------
