local ffi = require("ffi")
local lib = assert(ffi.load("libraylib"))

ffi.cdef([[
# 1 "raylib/src/raylib.h"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 362 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "raylib/src/raylib.h" 2
# 77 "raylib/src/raylib.h"
# 1 "/Library/Developer/CommandLineTools/usr/lib/clang/11.0.0/include/stdarg.h" 1 3 4
# 30 "/Library/Developer/CommandLineTools/usr/lib/clang/11.0.0/include/stdarg.h" 3 4
typedef __builtin_va_list va_list;
# 48 "/Library/Developer/CommandLineTools/usr/lib/clang/11.0.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 78 "raylib/src/raylib.h" 2
# 168 "raylib/src/raylib.h"
# 1 "/Library/Developer/CommandLineTools/usr/lib/clang/11.0.0/include/stdbool.h" 1 3 4
# 169 "raylib/src/raylib.h" 2





typedef struct Vector2 {
    float x;
    float y;
} Vector2;


typedef struct Vector3 {
    float x;
    float y;
    float z;
} Vector3;


typedef struct Vector4 {
    float x;
    float y;
    float z;
    float w;
} Vector4;


typedef Vector4 Quaternion;


typedef struct Matrix {
    float m0, m4, m8, m12;
    float m1, m5, m9, m13;
    float m2, m6, m10, m14;
    float m3, m7, m11, m15;
} Matrix;


typedef struct Color {
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;


typedef struct Rectangle {
    float x;
    float y;
    float width;
    float height;
} Rectangle;



typedef struct Image {
    void *data;
    int width;
    int height;
    int mipmaps;
    int format;
} Image;



typedef struct Texture2D {
    unsigned int id;
    int width;
    int height;
    int mipmaps;
    int format;
} Texture2D;


typedef Texture2D Texture;


typedef Texture2D TextureCubemap;


typedef struct RenderTexture2D {
    unsigned int id;
    Texture2D texture;
    Texture2D depth;
    _Bool depthTexture;
} RenderTexture2D;


typedef RenderTexture2D RenderTexture;


typedef struct NPatchInfo {
    Rectangle sourceRec;
    int left;
    int top;
    int right;
    int bottom;
    int type;
} NPatchInfo;


typedef struct CharInfo {
    int value;
    int offsetX;
    int offsetY;
    int advanceX;
    Image image;
} CharInfo;


typedef struct Font {
    int baseSize;
    int charsCount;
    Texture2D texture;
    Rectangle *recs;
    CharInfo *chars;
} Font;




typedef struct Camera3D {
    Vector3 position;
    Vector3 target;
    Vector3 up;
    float fovy;
    int type;
} Camera3D;

typedef Camera3D Camera;


typedef struct Camera2D {
    Vector2 offset;
    Vector2 target;
    float rotation;
    float zoom;
} Camera2D;



typedef struct Mesh {
    int vertexCount;
    int triangleCount;


    float *vertices;
    float *texcoords;
    float *texcoords2;
    float *normals;
    float *tangents;
    unsigned char *colors;
    unsigned short *indices;


    float *animVertices;
    float *animNormals;
    int *boneIds;
    float *boneWeights;


    unsigned int vaoId;
    unsigned int *vboId;
} Mesh;


typedef struct Shader {
    unsigned int id;
    int *locs;
} Shader;


typedef struct MaterialMap {
    Texture2D texture;
    Color color;
    float value;
} MaterialMap;


typedef struct Material {
    Shader shader;
    MaterialMap *maps;
    float *params;
} Material;


typedef struct Transform {
    Vector3 translation;
    Quaternion rotation;
    Vector3 scale;
} Transform;


typedef struct BoneInfo {
    char name[32];
    int parent;
} BoneInfo;


typedef struct Model {
    Matrix transform;

    int meshCount;
    Mesh *meshes;

    int materialCount;
    Material *materials;
    int *meshMaterial;


    int boneCount;
    BoneInfo *bones;
    Transform *bindPose;
} Model;


typedef struct ModelAnimation {
    int boneCount;
    BoneInfo *bones;

    int frameCount;
    Transform **framePoses;
} ModelAnimation;


typedef struct Ray {
    Vector3 position;
    Vector3 direction;
} Ray;


typedef struct RayHitInfo {
    _Bool hit;
    float distance;
    Vector3 position;
    Vector3 normal;
} RayHitInfo;


typedef struct BoundingBox {
    Vector3 min;
    Vector3 max;
} BoundingBox;


typedef struct Wave {
    unsigned int sampleCount;
    unsigned int sampleRate;
    unsigned int sampleSize;
    unsigned int channels;
    void *data;
} Wave;

typedef struct rAudioBuffer rAudioBuffer;



typedef struct AudioStream {
    unsigned int sampleRate;
    unsigned int sampleSize;
    unsigned int channels;

    rAudioBuffer *buffer;
} AudioStream;


typedef struct Sound {
    unsigned int sampleCount;
    AudioStream stream;
} Sound;



typedef struct Music {
    int ctxType;
    void *ctxData;

    unsigned int sampleCount;
    unsigned int loopCount;

    AudioStream stream;
} Music;


typedef struct VrDeviceInfo {
    int hResolution;
    int vResolution;
    float hScreenSize;
    float vScreenSize;
    float vScreenCenter;
    float eyeToScreenDistance;
    float lensSeparationDistance;
    float interpupillaryDistance;
    float lensDistortionValues[4];
    float chromaAbCorrection[4];
} VrDeviceInfo;






typedef enum {
    FLAG_RESERVED = 1,
    FLAG_FULLSCREEN_MODE = 2,
    FLAG_WINDOW_RESIZABLE = 4,
    FLAG_WINDOW_UNDECORATED = 8,
    FLAG_WINDOW_TRANSPARENT = 16,
    FLAG_WINDOW_HIDDEN = 128,
    FLAG_WINDOW_ALWAYS_RUN = 256,
    FLAG_MSAA_4X_HINT = 32,
    FLAG_VSYNC_HINT = 64
} ConfigFlag;


typedef enum {
    LOG_ALL = 0,
    LOG_TRACE,
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
    LOG_NONE
} TraceLogType;


typedef enum {

    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,


    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,


    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336
} KeyboardKey;


typedef enum {
    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25
} AndroidButton;


typedef enum {
    MOUSE_LEFT_BUTTON = 0,
    MOUSE_RIGHT_BUTTON = 1,
    MOUSE_MIDDLE_BUTTON = 2
} MouseButton;


typedef enum {
    GAMEPAD_PLAYER1 = 0,
    GAMEPAD_PLAYER2 = 1,
    GAMEPAD_PLAYER3 = 2,
    GAMEPAD_PLAYER4 = 3
} GamepadNumber;


typedef enum {

    GAMEPAD_BUTTON_UNKNOWN = 0,


    GAMEPAD_BUTTON_LEFT_FACE_UP,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,





    GAMEPAD_BUTTON_RIGHT_FACE_UP,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,


    GAMEPAD_BUTTON_LEFT_TRIGGER_1,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,


    GAMEPAD_BUTTON_MIDDLE_LEFT,
    GAMEPAD_BUTTON_MIDDLE,
    GAMEPAD_BUTTON_MIDDLE_RIGHT,


    GAMEPAD_BUTTON_LEFT_THUMB,
    GAMEPAD_BUTTON_RIGHT_THUMB
} GamepadButton;

typedef enum {

    GAMEPAD_AXIS_UNKNOWN = 0,


    GAMEPAD_AXIS_LEFT_X,
    GAMEPAD_AXIS_LEFT_Y,


    GAMEPAD_AXIS_RIGHT_X,
    GAMEPAD_AXIS_RIGHT_Y,


    GAMEPAD_AXIS_LEFT_TRIGGER,
    GAMEPAD_AXIS_RIGHT_TRIGGER
} GamepadAxis;


typedef enum {
    LOC_VERTEX_POSITION = 0,
    LOC_VERTEX_TEXCOORD01,
    LOC_VERTEX_TEXCOORD02,
    LOC_VERTEX_NORMAL,
    LOC_VERTEX_TANGENT,
    LOC_VERTEX_COLOR,
    LOC_MATRIX_MVP,
    LOC_MATRIX_MODEL,
    LOC_MATRIX_VIEW,
    LOC_MATRIX_PROJECTION,
    LOC_VECTOR_VIEW,
    LOC_COLOR_DIFFUSE,
    LOC_COLOR_SPECULAR,
    LOC_COLOR_AMBIENT,
    LOC_MAP_ALBEDO,
    LOC_MAP_METALNESS,
    LOC_MAP_NORMAL,
    LOC_MAP_ROUGHNESS,
    LOC_MAP_OCCLUSION,
    LOC_MAP_EMISSION,
    LOC_MAP_HEIGHT,
    LOC_MAP_CUBEMAP,
    LOC_MAP_IRRADIANCE,
    LOC_MAP_PREFILTER,
    LOC_MAP_BRDF
} ShaderLocationIndex;





typedef enum {
    UNIFORM_FLOAT = 0,
    UNIFORM_VEC2,
    UNIFORM_VEC3,
    UNIFORM_VEC4,
    UNIFORM_INT,
    UNIFORM_IVEC2,
    UNIFORM_IVEC3,
    UNIFORM_IVEC4,
    UNIFORM_SAMPLER2D
} ShaderUniformDataType;


typedef enum {
    MAP_ALBEDO = 0,
    MAP_METALNESS = 1,
    MAP_NORMAL = 2,
    MAP_ROUGHNESS = 3,
    MAP_OCCLUSION,
    MAP_EMISSION,
    MAP_HEIGHT,
    MAP_CUBEMAP,
    MAP_IRRADIANCE,
    MAP_PREFILTER,
    MAP_BRDF
} MaterialMapType;






typedef enum {
    UNCOMPRESSED_GRAYSCALE = 1,
    UNCOMPRESSED_GRAY_ALPHA,
    UNCOMPRESSED_R5G6B5,
    UNCOMPRESSED_R8G8B8,
    UNCOMPRESSED_R5G5B5A1,
    UNCOMPRESSED_R4G4B4A4,
    UNCOMPRESSED_R8G8B8A8,
    UNCOMPRESSED_R32,
    UNCOMPRESSED_R32G32B32,
    UNCOMPRESSED_R32G32B32A32,
    COMPRESSED_DXT1_RGB,
    COMPRESSED_DXT1_RGBA,
    COMPRESSED_DXT3_RGBA,
    COMPRESSED_DXT5_RGBA,
    COMPRESSED_ETC1_RGB,
    COMPRESSED_ETC2_RGB,
    COMPRESSED_ETC2_EAC_RGBA,
    COMPRESSED_PVRT_RGB,
    COMPRESSED_PVRT_RGBA,
    COMPRESSED_ASTC_4x4_RGBA,
    COMPRESSED_ASTC_8x8_RGBA
} PixelFormat;




typedef enum {
    FILTER_POINT = 0,
    FILTER_BILINEAR,
    FILTER_TRILINEAR,
    FILTER_ANISOTROPIC_4X,
    FILTER_ANISOTROPIC_8X,
    FILTER_ANISOTROPIC_16X,
} TextureFilterMode;


typedef enum {
    CUBEMAP_AUTO_DETECT = 0,
    CUBEMAP_LINE_VERTICAL,
    CUBEMAP_LINE_HORIZONTAL,
    CUBEMAP_CROSS_THREE_BY_FOUR,
    CUBEMAP_CROSS_FOUR_BY_THREE,
    CUBEMAP_PANORAMA
} CubemapLayoutType;


typedef enum {
    WRAP_REPEAT = 0,
    WRAP_CLAMP,
    WRAP_MIRROR_REPEAT,
    WRAP_MIRROR_CLAMP
} TextureWrapMode;


typedef enum {
    FONT_DEFAULT = 0,
    FONT_BITMAP,
    FONT_SDF
} FontType;


typedef enum {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE,
    BLEND_MULTIPLIED
} BlendMode;



typedef enum {
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512
} GestureType;


typedef enum {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE,
    CAMERA_ORBITAL,
    CAMERA_FIRST_PERSON,
    CAMERA_THIRD_PERSON
} CameraMode;


typedef enum {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC
} CameraType;


typedef enum {
    NPT_9PATCH = 0,
    NPT_3PATCH_VERTICAL,
    NPT_3PATCH_HORIZONTAL
} NPatchType;


typedef void (*TraceLogCallback)(int logType, const char *text, va_list args);
# 872 "raylib/src/raylib.h"
      void InitWindow(int width, int height, const char *title);
      _Bool WindowShouldClose(void);
      void CloseWindow(void);
      _Bool IsWindowReady(void);
      _Bool IsWindowMinimized(void);
      _Bool IsWindowResized(void);
      _Bool IsWindowHidden(void);
      _Bool IsWindowFullscreen(void);
      void ToggleFullscreen(void);
      void UnhideWindow(void);
      void HideWindow(void);
      void SetWindowIcon(Image image);
      void SetWindowTitle(const char *title);
      void SetWindowPosition(int x, int y);
      void SetWindowMonitor(int monitor);
      void SetWindowMinSize(int width, int height);
      void SetWindowSize(int width, int height);
      void *GetWindowHandle(void);
      int GetScreenWidth(void);
      int GetScreenHeight(void);
      int GetMonitorCount(void);
      int GetMonitorWidth(int monitor);
      int GetMonitorHeight(int monitor);
      int GetMonitorPhysicalWidth(int monitor);
      int GetMonitorPhysicalHeight(int monitor);
      Vector2 GetWindowPosition(void);
      Vector2 GetWindowScaleDPI(void);
      const char *GetMonitorName(int monitor);
      const char *GetClipboardText(void);
      void SetClipboardText(const char *text);


      void ShowCursor(void);
      void HideCursor(void);
      _Bool IsCursorHidden(void);
      void EnableCursor(void);
      void DisableCursor(void);


      void ClearBackground(Color color);
      void BeginDrawing(void);
      void EndDrawing(void);
      void BeginMode2D(Camera2D camera);
      void EndMode2D(void);
      void BeginMode3D(Camera3D camera);
      void EndMode3D(void);
      void BeginTextureMode(RenderTexture2D target);
      void EndTextureMode(void);
      void BeginScissorMode(int x, int y, int width, int height);
      void EndScissorMode(void);


      Ray GetMouseRay(Vector2 mousePosition, Camera camera);
      Matrix GetCameraMatrix(Camera camera);
      Matrix GetCameraMatrix2D(Camera2D camera);
      Vector2 GetWorldToScreen(Vector3 position, Camera camera);
      Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height);
      Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);
      Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);


      void SetTargetFPS(int fps);
      int GetFPS(void);
      float GetFrameTime(void);
      double GetTime(void);


      int ColorToInt(Color color);
      Vector4 ColorNormalize(Color color);
      Color ColorFromNormalized(Vector4 normalized);
      Vector3 ColorToHSV(Color color);
      Color ColorFromHSV(Vector3 hsv);
      Color GetColor(int hexValue);
      Color Fade(Color color, float alpha);


      void SetConfigFlags(unsigned int flags);
      void SetTraceLogLevel(int logType);
      void SetTraceLogExit(int logType);
      void SetTraceLogCallback(TraceLogCallback callback);
      void TraceLog(int logType, const char *text, ...);
      void TakeScreenshot(const char *fileName);
      int GetRandomValue(int min, int max);


      unsigned char *LoadFileData(const char *fileName, unsigned int *bytesRead);
      void SaveFileData(const char *fileName, void *data, unsigned int bytesToWrite);
      char *LoadFileText(const char *fileName);
      void SaveFileText(const char *fileName, char *text);
      _Bool FileExists(const char *fileName);
      _Bool IsFileExtension(const char *fileName, const char *ext);
      _Bool DirectoryExists(const char *dirPath);
      const char *GetExtension(const char *fileName);
      const char *GetFileName(const char *filePath);
      const char *GetFileNameWithoutExt(const char *filePath);
      const char *GetDirectoryPath(const char *filePath);
      const char *GetPrevDirectoryPath(const char *dirPath);
      const char *GetWorkingDirectory(void);
      char **GetDirectoryFiles(const char *dirPath, int *count);
      void ClearDirectoryFiles(void);
      _Bool ChangeDirectory(const char *dir);
      _Bool IsFileDropped(void);
      char **GetDroppedFiles(int *count);
      void ClearDroppedFiles(void);
      long GetFileModTime(const char *fileName);

      unsigned char *CompressData(unsigned char *data, int dataLength, int *compDataLength);
      unsigned char *DecompressData(unsigned char *compData, int compDataLength, int *dataLength);


      void SaveStorageValue(unsigned int position, int value);
      int LoadStorageValue(unsigned int position);

      void OpenURL(const char *url);






      _Bool IsKeyPressed(int key);
      _Bool IsKeyDown(int key);
      _Bool IsKeyReleased(int key);
      _Bool IsKeyUp(int key);
      void SetExitKey(int key);
      int GetKeyPressed(void);


      _Bool IsGamepadAvailable(int gamepad);
      _Bool IsGamepadName(int gamepad, const char *name);
      const char *GetGamepadName(int gamepad);
      _Bool IsGamepadButtonPressed(int gamepad, int button);
      _Bool IsGamepadButtonDown(int gamepad, int button);
      _Bool IsGamepadButtonReleased(int gamepad, int button);
      _Bool IsGamepadButtonUp(int gamepad, int button);
      int GetGamepadButtonPressed(void);
      int GetGamepadAxisCount(int gamepad);
      float GetGamepadAxisMovement(int gamepad, int axis);


      _Bool IsMouseButtonPressed(int button);
      _Bool IsMouseButtonDown(int button);
      _Bool IsMouseButtonReleased(int button);
      _Bool IsMouseButtonUp(int button);
      int GetMouseX(void);
      int GetMouseY(void);
      Vector2 GetMousePosition(void);
      void SetMousePosition(int x, int y);
      void SetMouseOffset(int offsetX, int offsetY);
      void SetMouseScale(float scaleX, float scaleY);
      int GetMouseWheelMove(void);


      int GetTouchX(void);
      int GetTouchY(void);
      Vector2 GetTouchPosition(int index);




      void SetGesturesEnabled(unsigned int gestureFlags);
      _Bool IsGestureDetected(int gesture);
      int GetGestureDetected(void);
      int GetTouchPointsCount(void);
      float GetGestureHoldDuration(void);
      Vector2 GetGestureDragVector(void);
      float GetGestureDragAngle(void);
      Vector2 GetGesturePinchVector(void);
      float GetGesturePinchAngle(void);




      void SetCameraMode(Camera camera, int mode);
      void UpdateCamera(Camera *camera);

      void SetCameraPanControl(int panKey);
      void SetCameraAltControl(int altKey);
      void SetCameraSmoothZoomControl(int szKey);
      void SetCameraMoveControls(int frontKey, int backKey, int rightKey, int leftKey, int upKey, int downKey);






      void DrawPixel(int posX, int posY, Color color);
      void DrawPixelV(Vector2 position, Color color);
      void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
      void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
      void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
      void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
      void DrawLineStrip(Vector2 *points, int numPoints, Color color);
      void DrawCircle(int centerX, int centerY, float radius, Color color);
      void DrawCircleSector(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
      void DrawCircleSectorLines(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
      void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
      void DrawCircleV(Vector2 center, float radius, Color color);
      void DrawCircleLines(int centerX, int centerY, float radius, Color color);
      void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
      void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
      void DrawRing(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
      void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
      void DrawRectangle(int posX, int posY, int width, int height, Color color);
      void DrawRectangleV(Vector2 position, Vector2 size, Color color);
      void DrawRectangleRec(Rectangle rec, Color color);
      void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
      void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
      void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
      void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
      void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
      void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);
      void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
      void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color);
      void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
      void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
      void DrawTriangleFan(Vector2 *points, int numPoints, Color color);
      void DrawTriangleStrip(Vector2 *points, int pointsCount, Color color);
      void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
      void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);


      _Bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
      _Bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
      _Bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
      Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);
      _Bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
      _Bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
      _Bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);







      Image LoadImage(const char *fileName);
      Image LoadImageEx(Color *pixels, int width, int height);
      Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);
      void UnloadImage(Image image);
      void ExportImage(Image image, const char *fileName);
      void ExportImageAsCode(Image image, const char *fileName);
      Color *GetImageData(Image image);
      Vector4 *GetImageDataNormalized(Image image);


      Image GenImageColor(int width, int height, Color color);
      Image GenImageGradientV(int width, int height, Color top, Color bottom);
      Image GenImageGradientH(int width, int height, Color left, Color right);
      Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
      Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
      Image GenImageWhiteNoise(int width, int height, float factor);
      Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);
      Image GenImageCellular(int width, int height, int tileSize);


      Image ImageCopy(Image image);
      Image ImageFromImage(Image image, Rectangle rec);
      Image ImageText(const char *text, int fontSize, Color color);
      Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);
      void ImageToPOT(Image *image, Color fillColor);
      void ImageFormat(Image *image, int newFormat);
      void ImageAlphaMask(Image *image, Image alphaMask);
      void ImageAlphaClear(Image *image, Color color, float threshold);
      void ImageAlphaCrop(Image *image, float threshold);
      void ImageAlphaPremultiply(Image *image);
      void ImageCrop(Image *image, Rectangle crop);
      void ImageResize(Image *image, int newWidth, int newHeight);
      void ImageResizeNN(Image *image, int newWidth,int newHeight);
      void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);
      void ImageMipmaps(Image *image);
      void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);
      void ImageFlipVertical(Image *image);
      void ImageFlipHorizontal(Image *image);
      void ImageRotateCW(Image *image);
      void ImageRotateCCW(Image *image);
      void ImageColorTint(Image *image, Color color);
      void ImageColorInvert(Image *image);
      void ImageColorGrayscale(Image *image);
      void ImageColorContrast(Image *image, float contrast);
      void ImageColorBrightness(Image *image, int brightness);
      void ImageColorReplace(Image *image, Color color, Color replace);
      Color *ImageExtractPalette(Image image, int maxPaletteSize, int *extractCount);
      Rectangle GetImageAlphaBorder(Image image, float threshold);



      void ImageClearBackground(Image *dst, Color color);
      void ImageDrawPixel(Image *dst, int posX, int posY, Color color);
      void ImageDrawPixelV(Image *dst, Vector2 position, Color color);
      void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color);
      void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);
      void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);
      void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);
      void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);
      void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);
      void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);
      void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);
      void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
      void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color);
      void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);



      Texture2D LoadTexture(const char *fileName);
      Texture2D LoadTextureFromImage(Image image);
      TextureCubemap LoadTextureCubemap(Image image, int layoutType);
      RenderTexture2D LoadRenderTexture(int width, int height);
      void UnloadTexture(Texture2D texture);
      void UnloadRenderTexture(RenderTexture2D target);
      void UpdateTexture(Texture2D texture, const void *pixels);
      Image GetTextureData(Texture2D texture);
      Image GetScreenData(void);


      void GenTextureMipmaps(Texture2D *texture);
      void SetTextureFilter(Texture2D texture, int filterMode);
      void SetTextureWrap(Texture2D texture, int wrapMode);


      void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
      void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
      void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
      void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);
      void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);
      void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);
      void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);


      int GetPixelDataSize(int width, int height, int format);






      Font GetFontDefault(void);
      Font LoadFont(const char *fileName);
      Font LoadFontEx(const char *fileName, int fontSize, int *fontChars, int charsCount);
      Font LoadFontFromImage(Image image, Color key, int firstChar);
      CharInfo *LoadFontData(const char *fileName, int fontSize, int *fontChars, int charsCount, int type);
      Image GenImageFontAtlas(const CharInfo *chars, Rectangle **recs, int charsCount, int fontSize, int padding, int packMethod);
      void UnloadFont(Font font);


      void DrawFPS(int posX, int posY);
      void DrawText(const char *text, int posX, int posY, int fontSize, Color color);
      void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);
      void DrawTextRec(Font font, const char *text, Rectangle rec, float fontSize, float spacing, _Bool wordWrap, Color tint);
      void DrawTextRecEx(Font font, const char *text, Rectangle rec, float fontSize, float spacing, _Bool wordWrap, Color tint,
                         int selectStart, int selectLength, Color selectTint, Color selectBackTint);
      void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float scale, Color tint);


      int MeasureText(const char *text, int fontSize);
      Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);
      int GetGlyphIndex(Font font, int codepoint);



      int TextCopy(char *dst, const char *src);
      _Bool TextIsEqual(const char *text1, const char *text2);
      unsigned int TextLength(const char *text);
      const char *TextFormat(const char *text, ...);
      const char *TextSubtext(const char *text, int position, int length);
      char *TextReplace(char *text, const char *replace, const char *by);
      char *TextInsert(const char *text, const char *insert, int position);
      const char *TextJoin(const char **textList, int count, const char *delimiter);
      const char **TextSplit(const char *text, char delimiter, int *count);
      void TextAppend(char *text, const char *append, int *position);
      int TextFindIndex(const char *text, const char *find);
      const char *TextToUpper(const char *text);
      const char *TextToLower(const char *text);
      const char *TextToPascal(const char *text);
      int TextToInteger(const char *text);
      char *TextToUtf8(int *codepoints, int length);


      int *GetCodepoints(const char *text, int *count);
      int GetCodepointsCount(const char *text);
      int GetNextCodepoint(const char *text, int *bytesProcessed);
      const char *CodepointToUtf8(int codepoint, int *byteLength);






      void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
      void DrawPoint3D(Vector3 position, Color color);
      void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
      void DrawCube(Vector3 position, float width, float height, float length, Color color);
      void DrawCubeV(Vector3 position, Vector3 size, Color color);
      void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
      void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
      void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);
      void DrawSphere(Vector3 centerPos, float radius, Color color);
      void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);
      void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);
      void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
      void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
      void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
      void DrawRay(Ray ray, Color color);
      void DrawGrid(int slices, float spacing);
      void DrawGizmo(Vector3 position);







      Model LoadModel(const char *fileName);
      Model LoadModelFromMesh(Mesh mesh);
      void UnloadModel(Model model);


      Mesh *LoadMeshes(const char *fileName, int *meshCount);
      void ExportMesh(Mesh mesh, const char *fileName);
      void UnloadMesh(Mesh mesh);


      Material *LoadMaterials(const char *fileName, int *materialCount);
      Material LoadMaterialDefault(void);
      void UnloadMaterial(Material material);
      void SetMaterialTexture(Material *material, int mapType, Texture2D texture);
      void SetModelMeshMaterial(Model *model, int meshId, int materialId);


      ModelAnimation *LoadModelAnimations(const char *fileName, int *animsCount);
      void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);
      void UnloadModelAnimation(ModelAnimation anim);
      _Bool IsModelAnimationValid(Model model, ModelAnimation anim);


      Mesh GenMeshPoly(int sides, float radius);
      Mesh GenMeshPlane(float width, float length, int resX, int resZ);
      Mesh GenMeshCube(float width, float height, float length);
      Mesh GenMeshSphere(float radius, int rings, int slices);
      Mesh GenMeshHemiSphere(float radius, int rings, int slices);
      Mesh GenMeshCylinder(float radius, float height, int slices);
      Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);
      Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);
      Mesh GenMeshHeightmap(Image heightmap, Vector3 size);
      Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);


      BoundingBox MeshBoundingBox(Mesh mesh);
      void MeshTangents(Mesh *mesh);
      void MeshBinormals(Mesh *mesh);


      void DrawModel(Model model, Vector3 position, float scale, Color tint);
      void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
      void DrawModelWires(Model model, Vector3 position, float scale, Color tint);
      void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
      void DrawBoundingBox(BoundingBox box, Color color);
      void DrawBillboard(Camera camera, Texture2D texture, Vector3 center, float size, Color tint);
      void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint);


      _Bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);
      _Bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);
      _Bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);
      _Bool CheckCollisionRaySphere(Ray ray, Vector3 center, float radius);
      _Bool CheckCollisionRaySphereEx(Ray ray, Vector3 center, float radius, Vector3 *collisionPoint);
      _Bool CheckCollisionRayBox(Ray ray, BoundingBox box);
      RayHitInfo GetCollisionRayModel(Ray ray, Model model);
      RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
      RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight);







      Shader LoadShader(const char *vsFileName, const char *fsFileName);
      Shader LoadShaderCode(const char *vsCode, const char *fsCode);
      void UnloadShader(Shader shader);

      Shader GetShaderDefault(void);
      Texture2D GetTextureDefault(void);
      Texture2D GetShapesTexture(void);
      Rectangle GetShapesTextureRec(void);
      void SetShapesTexture(Texture2D texture, Rectangle source);


      int GetShaderLocation(Shader shader, const char *uniformName);
      void SetShaderValue(Shader shader, int uniformLoc, const void *value, int uniformType);
      void SetShaderValueV(Shader shader, int uniformLoc, const void *value, int uniformType, int count);
      void SetShaderValueMatrix(Shader shader, int uniformLoc, Matrix mat);
      void SetShaderValueTexture(Shader shader, int uniformLoc, Texture2D texture);
      void SetMatrixProjection(Matrix proj);
      void SetMatrixModelview(Matrix view);
      Matrix GetMatrixModelview(void);
      Matrix GetMatrixProjection(void);



      Texture2D GenTextureCubemap(Shader shader, Texture2D map, int size);
      Texture2D GenTextureIrradiance(Shader shader, Texture2D cubemap, int size);
      Texture2D GenTexturePrefilter(Shader shader, Texture2D cubemap, int size);
      Texture2D GenTextureBRDF(Shader shader, int size);


      void BeginShaderMode(Shader shader);
      void EndShaderMode(void);
      void BeginBlendMode(int mode);
      void EndBlendMode(void);


      void InitVrSimulator(void);
      void CloseVrSimulator(void);
      void UpdateVrTracking(Camera *camera);
      void SetVrConfiguration(VrDeviceInfo info, Shader distortion);
      _Bool IsVrSimulatorReady(void);
      void ToggleVrMode(void);
      void BeginVrDrawing(void);
      void EndVrDrawing(void);






      void InitAudioDevice(void);
      void CloseAudioDevice(void);
      _Bool IsAudioDeviceReady(void);
      void SetMasterVolume(float volume);


      Wave LoadWave(const char *fileName);
      Sound LoadSound(const char *fileName);
      Sound LoadSoundFromWave(Wave wave);
      void UpdateSound(Sound sound, const void *data, int samplesCount);
      void UnloadWave(Wave wave);
      void UnloadSound(Sound sound);
      void ExportWave(Wave wave, const char *fileName);
      void ExportWaveAsCode(Wave wave, const char *fileName);


      void PlaySound(Sound sound);
      void StopSound(Sound sound);
      void PauseSound(Sound sound);
      void ResumeSound(Sound sound);
      void PlaySoundMulti(Sound sound);
      void StopSoundMulti(void);
      int GetSoundsPlaying(void);
      _Bool IsSoundPlaying(Sound sound);
      void SetSoundVolume(Sound sound, float volume);
      void SetSoundPitch(Sound sound, float pitch);
      void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels);
      Wave WaveCopy(Wave wave);
      void WaveCrop(Wave *wave, int initSample, int finalSample);
      float *GetWaveData(Wave wave);


      Music LoadMusicStream(const char *fileName);
      void UnloadMusicStream(Music music);
      void PlayMusicStream(Music music);
      void UpdateMusicStream(Music music);
      void StopMusicStream(Music music);
      void PauseMusicStream(Music music);
      void ResumeMusicStream(Music music);
      _Bool IsMusicPlaying(Music music);
      void SetMusicVolume(Music music, float volume);
      void SetMusicPitch(Music music, float pitch);
      void SetMusicLoopCount(Music music, int count);
      float GetMusicTimeLength(Music music);
      float GetMusicTimePlayed(Music music);


      AudioStream InitAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels);
      void UpdateAudioStream(AudioStream stream, const void *data, int samplesCount);
      void CloseAudioStream(AudioStream stream);
      _Bool IsAudioStreamProcessed(AudioStream stream);
      void PlayAudioStream(AudioStream stream);
      void PauseAudioStream(AudioStream stream);
      void ResumeAudioStream(AudioStream stream);
      _Bool IsAudioStreamPlaying(AudioStream stream);
      void StopAudioStream(AudioStream stream);
      void SetAudioStreamVolume(AudioStream stream, float volume);
      void SetAudioStreamPitch(AudioStream stream, float pitch);
      void SetAudioStreamBufferSizeDefault(int size);

]])

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

rl["Vector2"] = ffi.metatype("Vector2",{})
rl["Vector3"] = ffi.metatype("Vector3",{})
rl["Vector4"] = ffi.metatype("Vector4",{})
rl["Matrix"] = ffi.metatype("Matrix",{})
rl["Color"] = ffi.metatype("Color",{})
rl["Rectangle"] = ffi.metatype("Rectangle",{})
rl["Image"] = ffi.metatype("Image",{})
rl["Texture2D"] = ffi.metatype("Texture2D",{})
rl["RenderTexture2D"] = ffi.metatype("RenderTexture2D",{})
rl["NPatchInfo"] = ffi.metatype("NPatchInfo",{})
rl["CharInfo"] = ffi.metatype("CharInfo",{})
rl["Font"] = ffi.metatype("Font",{})
rl["Camera3D"] = ffi.metatype("Camera3D",{})
rl["Camera2D"] = ffi.metatype("Camera2D",{})
rl["Mesh"] = ffi.metatype("Mesh",{})
rl["Shader"] = ffi.metatype("Shader",{})
rl["MaterialMap"] = ffi.metatype("MaterialMap",{})
rl["Material"] = ffi.metatype("Material",{})
rl["Transform"] = ffi.metatype("Transform",{})
rl["BoneInfo"] = ffi.metatype("BoneInfo",{})
rl["Model"] = ffi.metatype("Model",{})
rl["ModelAnimation"] = ffi.metatype("ModelAnimation",{})
rl["Ray"] = ffi.metatype("Ray",{})
rl["RayHitInfo"] = ffi.metatype("RayHitInfo",{})
rl["BoundingBox"] = ffi.metatype("BoundingBox",{})
rl["Wave"] = ffi.metatype("Wave",{})
rl["rAudioBuffer"] = ffi.metatype("rAudioBuffer",{})
rl["AudioStream"] = ffi.metatype("AudioStream",{})
rl["Sound"] = ffi.metatype("Sound",{})
rl["Music"] = ffi.metatype("Music",{})
rl["VrDeviceInfo"] = ffi.metatype("VrDeviceInfo",{})
    return rl

