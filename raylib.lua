local ffi = require("ffi")

local lib = assert(ffi.load("libraylib"))

local header = assert(io.open("raylib.h", "rb"))
local contents = header:read("*all")

ffi.cdef(contents)
header:close()

local rl = setmetatable({}, {
    __index = lib
})
rl.PI = 3.14159265358979323846
rl.LIGHTGRAY  = { 200, 200, 200, 255 }   -- Light Gray
rl.GRAY       = { 130, 130, 130, 255 }   -- Gray
rl.DARKGRAY   = { 80, 80, 80, 255 }      -- Dark Gray
rl.YELLOW     = { 253, 249, 0, 255 }     -- Yellow
rl.GOLD       = { 255, 203, 0, 255 }     -- Gold
rl.ORANGE     = { 255, 161, 0, 255 }     -- Orange
rl.PINK       = { 255, 109, 194, 255 }   -- Pink
rl.RED        = { 230, 41, 55, 255 }     -- Red
rl.MAROON     = { 190, 33, 55, 255 }     -- Maroon
rl.GREEN      = { 0, 228, 48, 255 }      -- Green
rl.LIME       = { 0, 158, 47, 255 }      -- Lime
rl.DARKGREEN  = { 0, 117, 44, 255 }      -- Dark Green
rl.SKYBLUE    = { 102, 191, 255, 255 }   -- Sky Blue
rl.BLUE       = { 0, 121, 241, 255 }     -- Blue
rl.DARKBLUE   = { 0, 82, 172, 255 }      -- Dark Blue
rl.PURPLE     = { 200, 122, 255, 255 }   -- Purple
rl.VIOLET     = { 135, 60, 190, 255 }    -- Violet
rl.DARKPURPLE = { 112, 31, 126, 255 }    -- Dark Purple
rl.BEIGE      = { 211, 176, 131, 255 }   -- Beige
rl.BROWN      = { 127, 106, 79, 255 }    -- Brown
rl.DARKBROWN  = { 76, 63, 47, 255 }      -- Dark Brown

rl.WHITE      = { 255, 255, 255, 255 }   -- White
rl.BLACK      = { 0, 0, 0, 255 }         -- Black
rl.BLANK      = { 0, 0, 0, 0 }           -- Blank (Transparent)
rl.MAGENTA    = { 255, 0, 255, 255 }     -- Magenta
rl.RAYWHITE   = { 245, 245, 245, 255 }   -- My own White (raylib logo)

for struct in string.gmatch(contents, "typedef struct (%w+)") do
    rl[struct] = ffi.metatype(struct, {})
end

return rl