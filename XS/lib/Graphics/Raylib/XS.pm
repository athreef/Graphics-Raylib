package Graphics::Raylib::XS;

use 5.008000;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Graphics::Raylib::XS ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	BLEND_ADDITIVE
	BLEND_ALPHA
	BLEND_MULTIPLIED
	CAMERA_CUSTOM
	CAMERA_FIRST_PERSON
	CAMERA_FREE
	CAMERA_ORBITAL
	CAMERA_ORTHOGRAPHIC
	CAMERA_PERSPECTIVE
	CAMERA_THIRD_PERSON
	COMPRESSED_ASTC_4x4_RGBA
	COMPRESSED_ASTC_8x8_RGBA
	COMPRESSED_DXT1_RGB
	COMPRESSED_DXT1_RGBA
	COMPRESSED_DXT3_RGBA
	COMPRESSED_DXT5_RGBA
	COMPRESSED_ETC1_RGB
	COMPRESSED_ETC2_EAC_RGBA
	COMPRESSED_ETC2_RGB
	COMPRESSED_PVRT_RGB
	COMPRESSED_PVRT_RGBA
	DEG2RAD
	FILTER_ANISOTROPIC_16X
	FILTER_ANISOTROPIC_4X
	FILTER_ANISOTROPIC_8X
	FILTER_BILINEAR
	FILTER_POINT
	FILTER_TRILINEAR
	FLAG_FULLSCREEN_MODE
	FLAG_MSAA_4X_HINT
	FLAG_SHOW_LOGO
	FLAG_VSYNC_HINT
	FLAG_WINDOW_HIDDEN
	FLAG_WINDOW_RESIZABLE
	FLAG_WINDOW_TRANSPARENT
	FLAG_WINDOW_UNDECORATED
	FONT_BITMAP
	FONT_DEFAULT
	FONT_SDF
	FormatText
	GAMEPAD_ANDROID_BUTTON_A
	GAMEPAD_ANDROID_BUTTON_B
	GAMEPAD_ANDROID_BUTTON_C
	GAMEPAD_ANDROID_BUTTON_L1
	GAMEPAD_ANDROID_BUTTON_L2
	GAMEPAD_ANDROID_BUTTON_R1
	GAMEPAD_ANDROID_BUTTON_R2
	GAMEPAD_ANDROID_BUTTON_X
	GAMEPAD_ANDROID_BUTTON_Y
	GAMEPAD_ANDROID_BUTTON_Z
	GAMEPAD_ANDROID_DPAD_CENTER
	GAMEPAD_ANDROID_DPAD_DOWN
	GAMEPAD_ANDROID_DPAD_LEFT
	GAMEPAD_ANDROID_DPAD_RIGHT
	GAMEPAD_ANDROID_DPAD_UP
	GAMEPAD_PLAYER1
	GAMEPAD_PLAYER2
	GAMEPAD_PLAYER3
	GAMEPAD_PLAYER4
	GAMEPAD_PS3_AXIS_L2
	GAMEPAD_PS3_AXIS_LEFT_X
	GAMEPAD_PS3_AXIS_LEFT_Y
	GAMEPAD_PS3_AXIS_R2
	GAMEPAD_PS3_AXIS_RIGHT_X
	GAMEPAD_PS3_AXIS_RIGHT_Y
	GAMEPAD_PS3_BUTTON_CIRCLE
	GAMEPAD_PS3_BUTTON_CROSS
	GAMEPAD_PS3_BUTTON_DOWN
	GAMEPAD_PS3_BUTTON_L1
	GAMEPAD_PS3_BUTTON_L2
	GAMEPAD_PS3_BUTTON_LEFT
	GAMEPAD_PS3_BUTTON_PS
	GAMEPAD_PS3_BUTTON_R1
	GAMEPAD_PS3_BUTTON_R2
	GAMEPAD_PS3_BUTTON_RIGHT
	GAMEPAD_PS3_BUTTON_SELECT
	GAMEPAD_PS3_BUTTON_SQUARE
	GAMEPAD_PS3_BUTTON_START
	GAMEPAD_PS3_BUTTON_TRIANGLE
	GAMEPAD_PS3_BUTTON_UP
	GAMEPAD_XBOX_AXIS_LEFT_X
	GAMEPAD_XBOX_AXIS_LEFT_Y
	GAMEPAD_XBOX_AXIS_LT
	GAMEPAD_XBOX_AXIS_RIGHT_X
	GAMEPAD_XBOX_AXIS_RIGHT_Y
	GAMEPAD_XBOX_AXIS_RT
	GAMEPAD_XBOX_BUTTON_A
	GAMEPAD_XBOX_BUTTON_B
	GAMEPAD_XBOX_BUTTON_DOWN
	GAMEPAD_XBOX_BUTTON_HOME
	GAMEPAD_XBOX_BUTTON_LB
	GAMEPAD_XBOX_BUTTON_LEFT
	GAMEPAD_XBOX_BUTTON_RB
	GAMEPAD_XBOX_BUTTON_RIGHT
	GAMEPAD_XBOX_BUTTON_SELECT
	GAMEPAD_XBOX_BUTTON_START
	GAMEPAD_XBOX_BUTTON_UP
	GAMEPAD_XBOX_BUTTON_X
	GAMEPAD_XBOX_BUTTON_Y
	GESTURE_DOUBLETAP
	GESTURE_DRAG
	GESTURE_HOLD
	GESTURE_NONE
	GESTURE_PINCH_IN
	GESTURE_PINCH_OUT
	GESTURE_SWIPE_DOWN
	GESTURE_SWIPE_LEFT
	GESTURE_SWIPE_RIGHT
	GESTURE_SWIPE_UP
	GESTURE_TAP
	HMD_DEFAULT_DEVICE
	HMD_OCULUS_GO
	HMD_OCULUS_RIFT_CV1
	HMD_OCULUS_RIFT_DK2
	HMD_SONY_PSVR
	HMD_VALVE_HTC_VIVE
	KEY_A
	KEY_APOSTROPHE
	KEY_B
	KEY_BACK
	KEY_BACKSLASH
	KEY_BACKSPACE
	KEY_C
	KEY_CAPS_LOCK
	KEY_COMMA
	KEY_D
	KEY_DELETE
	KEY_DOWN
	KEY_E
	KEY_EIGHT
	KEY_END
	KEY_ENTER
	KEY_EQUAL
	KEY_ESCAPE
	KEY_F
	KEY_F1
	KEY_F10
	KEY_F11
	KEY_F12
	KEY_F2
	KEY_F3
	KEY_F4
	KEY_F5
	KEY_F6
	KEY_F7
	KEY_F8
	KEY_F9
	KEY_FIVE
	KEY_FOUR
	KEY_G
	KEY_GRAVE
	KEY_H
	KEY_HOME
	KEY_I
	KEY_INSERT
	KEY_J
	KEY_K
	KEY_KB_MENU
	KEY_KP_0
	KEY_KP_1
	KEY_KP_2
	KEY_KP_3
	KEY_KP_4
	KEY_KP_5
	KEY_KP_6
	KEY_KP_7
	KEY_KP_8
	KEY_KP_9
	KEY_KP_ADD
	KEY_KP_DECIMAL
	KEY_KP_DIVIDE
	KEY_KP_ENTER
	KEY_KP_EQUAL
	KEY_KP_MULTIPLY
	KEY_KP_SUBTRACT
	KEY_L
	KEY_LEFT
	KEY_LEFT_ALT
	KEY_LEFT_BRACKET
	KEY_LEFT_CONTROL
	KEY_LEFT_SHIFT
	KEY_LEFT_SUPER
	KEY_M
	KEY_MENU
	KEY_MINUS
	KEY_N
	KEY_NINE
	KEY_NUM_LOCK
	KEY_O
	KEY_ONE
	KEY_P
	KEY_PAGE_DOWN
	KEY_PAGE_UP
	KEY_PAUSE
	KEY_PERIOD
	KEY_PRINT_SCREEN
	KEY_Q
	KEY_R
	KEY_RIGHT
	KEY_RIGHT_ALT
	KEY_RIGHT_BRACKET
	KEY_RIGHT_CONTROL
	KEY_RIGHT_SHIFT
	KEY_RIGHT_SUPER
	KEY_S
	KEY_SCROLL_LOCK
	KEY_SEMICOLON
	KEY_SEVEN
	KEY_SIX
	KEY_SLASH
	KEY_SPACE
	KEY_T
	KEY_TAB
	KEY_THREE
	KEY_TWO
	KEY_U
	KEY_UP
	KEY_V
	KEY_VOLUME_DOWN
	KEY_VOLUME_UP
	KEY_W
	KEY_X
	KEY_Y
	KEY_Z
	KEY_ZERO
	LOC_COLOR_AMBIENT
	LOC_COLOR_DIFFUSE
	LOC_COLOR_SPECULAR
	LOC_MAP_ALBEDO
	LOC_MAP_BRDF
	LOC_MAP_CUBEMAP
	LOC_MAP_DIFFUSE
	LOC_MAP_EMISSION
	LOC_MAP_HEIGHT
	LOC_MAP_IRRADIANCE
	LOC_MAP_METALNESS
	LOC_MAP_NORMAL
	LOC_MAP_OCCLUSION
	LOC_MAP_PREFILTER
	LOC_MAP_ROUGHNESS
	LOC_MAP_SPECULAR
	LOC_MATRIX_MODEL
	LOC_MATRIX_MVP
	LOC_MATRIX_PROJECTION
	LOC_MATRIX_VIEW
	LOC_VECTOR_VIEW
	LOC_VERTEX_COLOR
	LOC_VERTEX_NORMAL
	LOC_VERTEX_POSITION
	LOC_VERTEX_TANGENT
	LOC_VERTEX_TEXCOORD01
	LOC_VERTEX_TEXCOORD02
	LOG_DEBUG
	LOG_ERROR
	LOG_INFO
	LOG_OTHER
	LOG_WARNING
	MAP_ALBEDO
	MAP_BRDF
	MAP_CUBEMAP
	MAP_DIFFUSE
	MAP_EMISSION
	MAP_HEIGHT
	MAP_IRRADIANCE
	MAP_METALNESS
	MAP_NORMAL
	MAP_OCCLUSION
	MAP_PREFILTER
	MAP_ROUGHNESS
	MAP_SPECULAR
	MAX_MATERIAL_MAPS
	MAX_SHADER_LOCATIONS
	MAX_TOUCH_POINTS
	MOUSE_LEFT_BUTTON
	MOUSE_MIDDLE_BUTTON
	MOUSE_RIGHT_BUTTON
	NPT_3PATCH_HORIZONTAL
	NPT_3PATCH_VERTICAL
	NPT_9PATCH
	RAD2DEG
	ShowWindow
	SubText
	UNCOMPRESSED_GRAYSCALE
	UNCOMPRESSED_GRAY_ALPHA
	UNCOMPRESSED_R32
	UNCOMPRESSED_R32G32B32
	UNCOMPRESSED_R32G32B32A32
	UNCOMPRESSED_R4G4B4A4
	UNCOMPRESSED_R5G5B5A1
	UNCOMPRESSED_R5G6B5
	UNCOMPRESSED_R8G8B8
	UNCOMPRESSED_R8G8B8A8
	UNIFORM_FLOAT
	UNIFORM_INT
	UNIFORM_IVEC2
	UNIFORM_IVEC3
	UNIFORM_IVEC4
	UNIFORM_SAMPLER2D
	UNIFORM_VEC2
	UNIFORM_VEC3
	UNIFORM_VEC4
	WRAP_CLAMP
	WRAP_MIRROR_CLAMP
	WRAP_MIRROR_REPEAT
	WRAP_REPEAT
	false
	true
	BeginBlendMode
	BeginDrawing
	BeginMode2D
	BeginMode3D
	BeginScissorMode
	BeginShaderMode
	BeginTextureMode
	BeginVrDrawing
	ChangeDirectory
	CheckCollisionBoxSphere
	CheckCollisionBoxes
	CheckCollisionCircleRec
	CheckCollisionCircles
	CheckCollisionPointCircle
	CheckCollisionPointRec
	CheckCollisionPointTriangle
	CheckCollisionRayBox
	CheckCollisionRaySphere
	CheckCollisionRaySphereEx
	CheckCollisionRecs
	CheckCollisionSpheres
	ClearBackground
	ClearDirectoryFiles
	ClearDroppedFiles
	CloseAudioDevice
	CloseAudioStream
	CloseVrSimulator
	CloseWindow
	ColorFromHSV
	ColorNormalize
	ColorToHSV
	ColorToInt
	DisableCursor
	DrawBillboard
	DrawBillboardRec
	DrawBoundingBox
	DrawCircle
	DrawCircle3D
	DrawCircleGradient
	DrawCircleLines
	DrawCircleV
	DrawCube
	DrawCubeTexture
	DrawCubeV
	DrawCubeWires
	DrawCylinder
	DrawCylinderWires
	DrawFPS
	DrawGizmo
	DrawGrid
	DrawLine
	DrawLine3D
	DrawLineBezier
	DrawLineEx
	DrawLineV
	DrawModel
	DrawModelEx
	DrawModelWires
	DrawModelWiresEx
	DrawPixel
	DrawPixelV
	DrawPlane
	DrawPoly
	DrawPolyEx
	DrawPolyExLines
	DrawRay
	DrawRectangle
	DrawRectangleGradientEx
	DrawRectangleGradientH
	DrawRectangleGradientV
	DrawRectangleLines
	DrawRectangleLinesEx
	DrawRectanglePro
	DrawRectangleRec
	DrawRectangleV
	DrawSphere
	DrawSphereEx
	DrawSphereWires
	DrawText
	DrawTextEx
	DrawTextRec
	DrawTexture
	DrawTextureEx
	DrawTextureNPatch
	DrawTexturePro
	DrawTextureQuad
	DrawTextureRec
	DrawTextureV
	DrawTriangle
	DrawTriangleLines
	EnableCursor
	EndBlendMode
	EndDrawing
	EndMode2D
	EndMode3D
	EndScissorMode
	EndShaderMode
	EndTextureMode
	EndVrDrawing
	ExportImage
	ExportImageAsCode
	ExportMesh
	ExportWave
	ExportWaveAsCode
	Fade
	FileExists
	GenImageCellular
	GenImageChecked
	GenImageColor
	GenImageFontAtlas
	GenImageGradientH
	GenImageGradientRadial
	GenImageGradientV
	GenImagePerlinNoise
	GenImageWhiteNoise
	GenMeshCube
	GenMeshCubicmap
	GenMeshCylinder
	GenMeshHeightmap
	GenMeshHemiSphere
	GenMeshKnot
	GenMeshPlane
	GenMeshPoly
	GenMeshSphere
	GenMeshTorus
	GenTextureBRDF
	GenTextureCubemap
	GenTextureIrradiance
	GenTextureMipmaps
	GenTexturePrefilter
	GetCameraMatrix
	GetCollisionRayGround
	GetCollisionRayModel
	GetCollisionRayTriangle
	GetCollisionRec
	GetColor
	GetDirectoryFiles
	GetDirectoryPath
	GetExtension
	GetFPS
	GetFileModTime
	GetFileName
	GetFileNameWithoutExt
	GetFontDefault
	GetFrameTime
	GetGamepadAxisCount
	GetGamepadAxisMovement
	GetGamepadButtonPressed
	GetGamepadName
	GetGestureDetected
	GetGestureDragAngle
	GetGestureDragVector
	GetGestureHoldDuration
	GetGesturePinchAngle
	GetGesturePinchVector
	GetGlyphIndex
	GetImageData
	GetImageDataNormalized
	GetKeyPressed
	GetMatrixModelview
	GetMonitorCount
	GetMonitorHeight
	GetMonitorName
	GetMonitorPhysicalHeight
	GetMonitorPhysicalWidth
	GetMonitorWidth
	GetMousePosition
	GetMouseRay
	GetMouseWheelMove
	GetMouseX
	GetMouseY
	GetMusicTimeLength
	GetMusicTimePlayed
	GetPixelDataSize
	GetRandomValue
	GetScreenHeight
	GetScreenWidth
	GetShaderDefault
	GetShaderLocation
	GetTextureData
	GetTextureDefault
	GetTime
	GetTouchPointsCount
	GetTouchPosition
	GetTouchX
	GetTouchY
	GetVrDeviceInfo
	GetWaveData
	GetWindowHandle
	GetWorkingDirectory
	GetWorldToScreen
	HideCursor
	HideWindow
	ImageAlphaClear
	ImageAlphaCrop
	ImageAlphaMask
	ImageAlphaPremultiply
	ImageColorBrightness
	ImageColorContrast
	ImageColorGrayscale
	ImageColorInvert
	ImageColorReplace
	ImageColorTint
	ImageCopy
	ImageCrop
	ImageDither
	ImageDraw
	ImageDrawRectangle
	ImageDrawRectangleLines
	ImageDrawText
	ImageDrawTextEx
	ImageExtractPalette
	ImageFlipHorizontal
	ImageFlipVertical
	ImageFormat
	ImageMipmaps
	ImageResize
	ImageResizeCanvas
	ImageResizeNN
	ImageRotateCCW
	ImageRotateCW
	ImageText
	ImageTextEx
	ImageToPOT
	InitAudioDevice
	InitAudioStream
	InitVrSimulator
	InitWindow
	IsAudioBufferProcessed
	IsAudioDeviceReady
	IsAudioStreamPlaying
	IsCursorHidden
	IsFileDropped
	IsFileExtension
	IsGamepadAvailable
	IsGamepadButtonDown
	IsGamepadButtonPressed
	IsGamepadButtonReleased
	IsGamepadButtonUp
	IsGamepadName
	IsGestureDetected
	IsKeyDown
	IsKeyPressed
	IsKeyReleased
	IsKeyUp
	IsMouseButtonDown
	IsMouseButtonPressed
	IsMouseButtonReleased
	IsMouseButtonUp
	IsMusicPlaying
	IsSoundPlaying
	IsVrSimulatorReady
	IsWindowHidden
	IsWindowMinimized
	IsWindowReady
	LoadFont
	LoadFontData
	LoadFontEx
	LoadFontFromImage
	LoadImage
	LoadImageEx
	LoadImagePro
	LoadImageRaw
	LoadImageFromAV
	LoadImageFromAV_uninitialized_mem
	LoadImageFromAV_transposed
	LoadImageFromAV_transposed_uninitialized_mem
	LoadMaterial
	LoadMaterialDefault
	LoadMesh
	LoadModel
	LoadModelFromMesh
	LoadMusicStream
	LoadRenderTexture
	LoadShader
	LoadShaderCode
	LoadSound
	LoadSoundFromWave
	LoadText
	LoadTexture
	LoadTextureFromImage
	LoadWave
	LoadWaveEx
	MeasureText
	MeasureTextEx
	MeshBinormals
	MeshBoundingBox
	MeshTangents
	OpenURL
	PauseAudioStream
	PauseMusicStream
	PauseSound
	PlayAudioStream
	PlayMusicStream
	PlaySound
	ResumeAudioStream
	ResumeMusicStream
	ResumeSound
	SetAudioStreamPitch
	SetAudioStreamVolume
	SetCameraAltControl
	SetCameraMode
	SetCameraMoveControls
	SetCameraPanControl
	SetCameraSmoothZoomControl
	SetConfigFlags
	SetExitKey
	SetGesturesEnabled
	SetMasterVolume
	SetMatrixModelview
	SetMatrixProjection
	SetMouseOffset
	SetMousePosition
	SetMouseScale
	SetMusicLoopCount
	SetMusicPitch
	SetMusicVolume
	SetShaderValue
	SetShaderValueMatrix
	SetShaderValueV
	SetShapesTexture
	SetSoundPitch
	SetSoundVolume
	SetTargetFPS
	SetTextureFilter
	SetTextureWrap
	SetTraceLog
	SetTraceLogCallback
	SetVrDistortionShader
	SetWindowIcon
	SetWindowMinSize
	SetWindowMonitor
	SetWindowPosition
	SetWindowSize
	SetWindowTitle
	ShowCursor
	StopAudioStream
	StopMusicStream
	StopSound
	StorageLoadValue
	StorageSaveValue
	TakeScreenshot
	ToggleFullscreen
	ToggleVrMode
	TraceLog
	UnhideWindow
	UnloadFont
	UnloadImage
	UnloadMaterial
	UnloadMesh
	UnloadModel
	UnloadMusicStream
	UnloadRenderTexture
	UnloadShader
	UnloadSound
	UnloadTexture
	UnloadWave
	UpdateAudioStream
	UpdateCamera
	UpdateMusicStream
	UpdateSound
	UpdateTexture
	UpdateTextureFromImage
	UpdateVrTracking
	WaveCopy
	WaveCrop
	WaveFormat
	WindowShouldClose
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	BLEND_ADDITIVE
	BLEND_ALPHA
	BLEND_MULTIPLIED
	CAMERA_CUSTOM
	CAMERA_FIRST_PERSON
	CAMERA_FREE
	CAMERA_ORBITAL
	CAMERA_ORTHOGRAPHIC
	CAMERA_PERSPECTIVE
	CAMERA_THIRD_PERSON
	COMPRESSED_ASTC_4x4_RGBA
	COMPRESSED_ASTC_8x8_RGBA
	COMPRESSED_DXT1_RGB
	COMPRESSED_DXT1_RGBA
	COMPRESSED_DXT3_RGBA
	COMPRESSED_DXT5_RGBA
	COMPRESSED_ETC1_RGB
	COMPRESSED_ETC2_EAC_RGBA
	COMPRESSED_ETC2_RGB
	COMPRESSED_PVRT_RGB
	COMPRESSED_PVRT_RGBA
	DEG2RAD
	FILTER_ANISOTROPIC_16X
	FILTER_ANISOTROPIC_4X
	FILTER_ANISOTROPIC_8X
	FILTER_BILINEAR
	FILTER_POINT
	FILTER_TRILINEAR
	FLAG_FULLSCREEN_MODE
	FLAG_MSAA_4X_HINT
	FLAG_SHOW_LOGO
	FLAG_VSYNC_HINT
	FLAG_WINDOW_HIDDEN
	FLAG_WINDOW_RESIZABLE
	FLAG_WINDOW_TRANSPARENT
	FLAG_WINDOW_UNDECORATED
	FONT_BITMAP
	FONT_DEFAULT
	FONT_SDF
	FormatText
	GAMEPAD_ANDROID_BUTTON_A
	GAMEPAD_ANDROID_BUTTON_B
	GAMEPAD_ANDROID_BUTTON_C
	GAMEPAD_ANDROID_BUTTON_L1
	GAMEPAD_ANDROID_BUTTON_L2
	GAMEPAD_ANDROID_BUTTON_R1
	GAMEPAD_ANDROID_BUTTON_R2
	GAMEPAD_ANDROID_BUTTON_X
	GAMEPAD_ANDROID_BUTTON_Y
	GAMEPAD_ANDROID_BUTTON_Z
	GAMEPAD_ANDROID_DPAD_CENTER
	GAMEPAD_ANDROID_DPAD_DOWN
	GAMEPAD_ANDROID_DPAD_LEFT
	GAMEPAD_ANDROID_DPAD_RIGHT
	GAMEPAD_ANDROID_DPAD_UP
	GAMEPAD_PLAYER1
	GAMEPAD_PLAYER2
	GAMEPAD_PLAYER3
	GAMEPAD_PLAYER4
	GAMEPAD_PS3_AXIS_L2
	GAMEPAD_PS3_AXIS_LEFT_X
	GAMEPAD_PS3_AXIS_LEFT_Y
	GAMEPAD_PS3_AXIS_R2
	GAMEPAD_PS3_AXIS_RIGHT_X
	GAMEPAD_PS3_AXIS_RIGHT_Y
	GAMEPAD_PS3_BUTTON_CIRCLE
	GAMEPAD_PS3_BUTTON_CROSS
	GAMEPAD_PS3_BUTTON_DOWN
	GAMEPAD_PS3_BUTTON_L1
	GAMEPAD_PS3_BUTTON_L2
	GAMEPAD_PS3_BUTTON_LEFT
	GAMEPAD_PS3_BUTTON_PS
	GAMEPAD_PS3_BUTTON_R1
	GAMEPAD_PS3_BUTTON_R2
	GAMEPAD_PS3_BUTTON_RIGHT
	GAMEPAD_PS3_BUTTON_SELECT
	GAMEPAD_PS3_BUTTON_SQUARE
	GAMEPAD_PS3_BUTTON_START
	GAMEPAD_PS3_BUTTON_TRIANGLE
	GAMEPAD_PS3_BUTTON_UP
	GAMEPAD_XBOX_AXIS_LEFT_X
	GAMEPAD_XBOX_AXIS_LEFT_Y
	GAMEPAD_XBOX_AXIS_LT
	GAMEPAD_XBOX_AXIS_RIGHT_X
	GAMEPAD_XBOX_AXIS_RIGHT_Y
	GAMEPAD_XBOX_AXIS_RT
	GAMEPAD_XBOX_BUTTON_A
	GAMEPAD_XBOX_BUTTON_B
	GAMEPAD_XBOX_BUTTON_DOWN
	GAMEPAD_XBOX_BUTTON_HOME
	GAMEPAD_XBOX_BUTTON_LB
	GAMEPAD_XBOX_BUTTON_LEFT
	GAMEPAD_XBOX_BUTTON_RB
	GAMEPAD_XBOX_BUTTON_RIGHT
	GAMEPAD_XBOX_BUTTON_SELECT
	GAMEPAD_XBOX_BUTTON_START
	GAMEPAD_XBOX_BUTTON_UP
	GAMEPAD_XBOX_BUTTON_X
	GAMEPAD_XBOX_BUTTON_Y
	GESTURE_DOUBLETAP
	GESTURE_DRAG
	GESTURE_HOLD
	GESTURE_NONE
	GESTURE_PINCH_IN
	GESTURE_PINCH_OUT
	GESTURE_SWIPE_DOWN
	GESTURE_SWIPE_LEFT
	GESTURE_SWIPE_RIGHT
	GESTURE_SWIPE_UP
	GESTURE_TAP
	HMD_DEFAULT_DEVICE
	HMD_OCULUS_GO
	HMD_OCULUS_RIFT_CV1
	HMD_OCULUS_RIFT_DK2
	HMD_SONY_PSVR
	HMD_VALVE_HTC_VIVE
	KEY_A
	KEY_APOSTROPHE
	KEY_B
	KEY_BACK
	KEY_BACKSLASH
	KEY_BACKSPACE
	KEY_C
	KEY_CAPS_LOCK
	KEY_COMMA
	KEY_D
	KEY_DELETE
	KEY_DOWN
	KEY_E
	KEY_EIGHT
	KEY_END
	KEY_ENTER
	KEY_EQUAL
	KEY_ESCAPE
	KEY_F
	KEY_F1
	KEY_F10
	KEY_F11
	KEY_F12
	KEY_F2
	KEY_F3
	KEY_F4
	KEY_F5
	KEY_F6
	KEY_F7
	KEY_F8
	KEY_F9
	KEY_FIVE
	KEY_FOUR
	KEY_G
	KEY_GRAVE
	KEY_H
	KEY_HOME
	KEY_I
	KEY_INSERT
	KEY_J
	KEY_K
	KEY_KB_MENU
	KEY_KP_0
	KEY_KP_1
	KEY_KP_2
	KEY_KP_3
	KEY_KP_4
	KEY_KP_5
	KEY_KP_6
	KEY_KP_7
	KEY_KP_8
	KEY_KP_9
	KEY_KP_ADD
	KEY_KP_DECIMAL
	KEY_KP_DIVIDE
	KEY_KP_ENTER
	KEY_KP_EQUAL
	KEY_KP_MULTIPLY
	KEY_KP_SUBTRACT
	KEY_L
	KEY_LEFT
	KEY_LEFT_ALT
	KEY_LEFT_BRACKET
	KEY_LEFT_CONTROL
	KEY_LEFT_SHIFT
	KEY_LEFT_SUPER
	KEY_M
	KEY_MENU
	KEY_MINUS
	KEY_N
	KEY_NINE
	KEY_NUM_LOCK
	KEY_O
	KEY_ONE
	KEY_P
	KEY_PAGE_DOWN
	KEY_PAGE_UP
	KEY_PAUSE
	KEY_PERIOD
	KEY_PRINT_SCREEN
	KEY_Q
	KEY_R
	KEY_RIGHT
	KEY_RIGHT_ALT
	KEY_RIGHT_BRACKET
	KEY_RIGHT_CONTROL
	KEY_RIGHT_SHIFT
	KEY_RIGHT_SUPER
	KEY_S
	KEY_SCROLL_LOCK
	KEY_SEMICOLON
	KEY_SEVEN
	KEY_SIX
	KEY_SLASH
	KEY_SPACE
	KEY_T
	KEY_TAB
	KEY_THREE
	KEY_TWO
	KEY_U
	KEY_UP
	KEY_V
	KEY_VOLUME_DOWN
	KEY_VOLUME_UP
	KEY_W
	KEY_X
	KEY_Y
	KEY_Z
	KEY_ZERO
	LOC_COLOR_AMBIENT
	LOC_COLOR_DIFFUSE
	LOC_COLOR_SPECULAR
	LOC_MAP_ALBEDO
	LOC_MAP_BRDF
	LOC_MAP_CUBEMAP
	LOC_MAP_DIFFUSE
	LOC_MAP_EMISSION
	LOC_MAP_HEIGHT
	LOC_MAP_IRRADIANCE
	LOC_MAP_METALNESS
	LOC_MAP_NORMAL
	LOC_MAP_OCCLUSION
	LOC_MAP_PREFILTER
	LOC_MAP_ROUGHNESS
	LOC_MAP_SPECULAR
	LOC_MATRIX_MODEL
	LOC_MATRIX_MVP
	LOC_MATRIX_PROJECTION
	LOC_MATRIX_VIEW
	LOC_VECTOR_VIEW
	LOC_VERTEX_COLOR
	LOC_VERTEX_NORMAL
	LOC_VERTEX_POSITION
	LOC_VERTEX_TANGENT
	LOC_VERTEX_TEXCOORD01
	LOC_VERTEX_TEXCOORD02
	LOG_DEBUG
	LOG_ERROR
	LOG_INFO
	LOG_OTHER
	LOG_WARNING
	MAP_ALBEDO
	MAP_BRDF
	MAP_CUBEMAP
	MAP_DIFFUSE
	MAP_EMISSION
	MAP_HEIGHT
	MAP_IRRADIANCE
	MAP_METALNESS
	MAP_NORMAL
	MAP_OCCLUSION
	MAP_PREFILTER
	MAP_ROUGHNESS
	MAP_SPECULAR
	MAX_MATERIAL_MAPS
	MAX_SHADER_LOCATIONS
	MAX_TOUCH_POINTS
	MOUSE_LEFT_BUTTON
	MOUSE_MIDDLE_BUTTON
	MOUSE_RIGHT_BUTTON
	NPT_3PATCH_HORIZONTAL
	NPT_3PATCH_VERTICAL
	NPT_9PATCH
	RAD2DEG
	ShowWindow
	SubText
	UNCOMPRESSED_GRAYSCALE
	UNCOMPRESSED_GRAY_ALPHA
	UNCOMPRESSED_R32
	UNCOMPRESSED_R32G32B32
	UNCOMPRESSED_R32G32B32A32
	UNCOMPRESSED_R4G4B4A4
	UNCOMPRESSED_R5G5B5A1
	UNCOMPRESSED_R5G6B5
	UNCOMPRESSED_R8G8B8
	UNCOMPRESSED_R8G8B8A8
	UNIFORM_FLOAT
	UNIFORM_INT
	UNIFORM_IVEC2
	UNIFORM_IVEC3
	UNIFORM_IVEC4
	UNIFORM_SAMPLER2D
	UNIFORM_VEC2
	UNIFORM_VEC3
	UNIFORM_VEC4
	WRAP_CLAMP
	WRAP_MIRROR_CLAMP
	WRAP_MIRROR_REPEAT
	WRAP_REPEAT
	false
	true
);

our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Graphics::Raylib::XS::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Graphics::Raylib::XS', $VERSION);

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Graphics::Raylib::XS - XS wrapper around raylib

=head1 SYNOPSIS

  use Graphics::Raylib::XS ':all';

=head1 DESCRIPTION

See L<Graphics::Raylib> for a Perlish wrapper. This XS wrapper wrap the raylib packaged by L<Alien::raylib>. raylib adds new features and breaks ABI often as well, therefore use with system raylib isn't recommended.

=head2 EXPORT

None by default.

=head2 Exportable constants

  BLEND_ADDITIVE
  BLEND_ALPHA
  BLEND_MULTIPLIED
  CAMERA_CUSTOM
  CAMERA_FIRST_PERSON
  CAMERA_FREE
  CAMERA_ORBITAL
  CAMERA_ORTHOGRAPHIC
  CAMERA_PERSPECTIVE
  CAMERA_THIRD_PERSON
  COMPRESSED_ASTC_4x4_RGBA
  COMPRESSED_ASTC_8x8_RGBA
  COMPRESSED_DXT1_RGB
  COMPRESSED_DXT1_RGBA
  COMPRESSED_DXT3_RGBA
  COMPRESSED_DXT5_RGBA
  COMPRESSED_ETC1_RGB
  COMPRESSED_ETC2_EAC_RGBA
  COMPRESSED_ETC2_RGB
  COMPRESSED_PVRT_RGB
  COMPRESSED_PVRT_RGBA
  DEG2RAD
  FILTER_ANISOTROPIC_16X
  FILTER_ANISOTROPIC_4X
  FILTER_ANISOTROPIC_8X
  FILTER_BILINEAR
  FILTER_POINT
  FILTER_TRILINEAR
  FLAG_FULLSCREEN_MODE
  FLAG_MSAA_4X_HINT
  FLAG_SHOW_LOGO
  FLAG_VSYNC_HINT
  FLAG_WINDOW_HIDDEN
  FLAG_WINDOW_RESIZABLE
  FLAG_WINDOW_TRANSPARENT
  FLAG_WINDOW_UNDECORATED
  FONT_BITMAP
  FONT_DEFAULT
  FONT_SDF
  FormatText
  GAMEPAD_ANDROID_BUTTON_A
  GAMEPAD_ANDROID_BUTTON_B
  GAMEPAD_ANDROID_BUTTON_C
  GAMEPAD_ANDROID_BUTTON_L1
  GAMEPAD_ANDROID_BUTTON_L2
  GAMEPAD_ANDROID_BUTTON_R1
  GAMEPAD_ANDROID_BUTTON_R2
  GAMEPAD_ANDROID_BUTTON_X
  GAMEPAD_ANDROID_BUTTON_Y
  GAMEPAD_ANDROID_BUTTON_Z
  GAMEPAD_ANDROID_DPAD_CENTER
  GAMEPAD_ANDROID_DPAD_DOWN
  GAMEPAD_ANDROID_DPAD_LEFT
  GAMEPAD_ANDROID_DPAD_RIGHT
  GAMEPAD_ANDROID_DPAD_UP
  GAMEPAD_PLAYER1
  GAMEPAD_PLAYER2
  GAMEPAD_PLAYER3
  GAMEPAD_PLAYER4
  GAMEPAD_PS3_AXIS_L2
  GAMEPAD_PS3_AXIS_LEFT_X
  GAMEPAD_PS3_AXIS_LEFT_Y
  GAMEPAD_PS3_AXIS_R2
  GAMEPAD_PS3_AXIS_RIGHT_X
  GAMEPAD_PS3_AXIS_RIGHT_Y
  GAMEPAD_PS3_BUTTON_CIRCLE
  GAMEPAD_PS3_BUTTON_CROSS
  GAMEPAD_PS3_BUTTON_DOWN
  GAMEPAD_PS3_BUTTON_L1
  GAMEPAD_PS3_BUTTON_L2
  GAMEPAD_PS3_BUTTON_LEFT
  GAMEPAD_PS3_BUTTON_PS
  GAMEPAD_PS3_BUTTON_R1
  GAMEPAD_PS3_BUTTON_R2
  GAMEPAD_PS3_BUTTON_RIGHT
  GAMEPAD_PS3_BUTTON_SELECT
  GAMEPAD_PS3_BUTTON_SQUARE
  GAMEPAD_PS3_BUTTON_START
  GAMEPAD_PS3_BUTTON_TRIANGLE
  GAMEPAD_PS3_BUTTON_UP
  GAMEPAD_XBOX_AXIS_LEFT_X
  GAMEPAD_XBOX_AXIS_LEFT_Y
  GAMEPAD_XBOX_AXIS_LT
  GAMEPAD_XBOX_AXIS_RIGHT_X
  GAMEPAD_XBOX_AXIS_RIGHT_Y
  GAMEPAD_XBOX_AXIS_RT
  GAMEPAD_XBOX_BUTTON_A
  GAMEPAD_XBOX_BUTTON_B
  GAMEPAD_XBOX_BUTTON_DOWN
  GAMEPAD_XBOX_BUTTON_HOME
  GAMEPAD_XBOX_BUTTON_LB
  GAMEPAD_XBOX_BUTTON_LEFT
  GAMEPAD_XBOX_BUTTON_RB
  GAMEPAD_XBOX_BUTTON_RIGHT
  GAMEPAD_XBOX_BUTTON_SELECT
  GAMEPAD_XBOX_BUTTON_START
  GAMEPAD_XBOX_BUTTON_UP
  GAMEPAD_XBOX_BUTTON_X
  GAMEPAD_XBOX_BUTTON_Y
  GESTURE_DOUBLETAP
  GESTURE_DRAG
  GESTURE_HOLD
  GESTURE_NONE
  GESTURE_PINCH_IN
  GESTURE_PINCH_OUT
  GESTURE_SWIPE_DOWN
  GESTURE_SWIPE_LEFT
  GESTURE_SWIPE_RIGHT
  GESTURE_SWIPE_UP
  GESTURE_TAP
  HMD_DEFAULT_DEVICE
  HMD_OCULUS_GO
  HMD_OCULUS_RIFT_CV1
  HMD_OCULUS_RIFT_DK2
  HMD_SONY_PSVR
  HMD_VALVE_HTC_VIVE
  KEY_A
  KEY_APOSTROPHE
  KEY_B
  KEY_BACK
  KEY_BACKSLASH
  KEY_BACKSPACE
  KEY_C
  KEY_CAPS_LOCK
  KEY_COMMA
  KEY_D
  KEY_DELETE
  KEY_DOWN
  KEY_E
  KEY_EIGHT
  KEY_END
  KEY_ENTER
  KEY_EQUAL
  KEY_ESCAPE
  KEY_F
  KEY_F1
  KEY_F10
  KEY_F11
  KEY_F12
  KEY_F2
  KEY_F3
  KEY_F4
  KEY_F5
  KEY_F6
  KEY_F7
  KEY_F8
  KEY_F9
  KEY_FIVE
  KEY_FOUR
  KEY_G
  KEY_GRAVE
  KEY_H
  KEY_HOME
  KEY_I
  KEY_INSERT
  KEY_J
  KEY_K
  KEY_KB_MENU
  KEY_KP_0
  KEY_KP_1
  KEY_KP_2
  KEY_KP_3
  KEY_KP_4
  KEY_KP_5
  KEY_KP_6
  KEY_KP_7
  KEY_KP_8
  KEY_KP_9
  KEY_KP_ADD
  KEY_KP_DECIMAL
  KEY_KP_DIVIDE
  KEY_KP_ENTER
  KEY_KP_EQUAL
  KEY_KP_MULTIPLY
  KEY_KP_SUBTRACT
  KEY_L
  KEY_LEFT
  KEY_LEFT_ALT
  KEY_LEFT_BRACKET
  KEY_LEFT_CONTROL
  KEY_LEFT_SHIFT
  KEY_LEFT_SUPER
  KEY_M
  KEY_MENU
  KEY_MINUS
  KEY_N
  KEY_NINE
  KEY_NUM_LOCK
  KEY_O
  KEY_ONE
  KEY_P
  KEY_PAGE_DOWN
  KEY_PAGE_UP
  KEY_PAUSE
  KEY_PERIOD
  KEY_PRINT_SCREEN
  KEY_Q
  KEY_R
  KEY_RIGHT
  KEY_RIGHT_ALT
  KEY_RIGHT_BRACKET
  KEY_RIGHT_CONTROL
  KEY_RIGHT_SHIFT
  KEY_RIGHT_SUPER
  KEY_S
  KEY_SCROLL_LOCK
  KEY_SEMICOLON
  KEY_SEVEN
  KEY_SIX
  KEY_SLASH
  KEY_SPACE
  KEY_T
  KEY_TAB
  KEY_THREE
  KEY_TWO
  KEY_U
  KEY_UP
  KEY_V
  KEY_VOLUME_DOWN
  KEY_VOLUME_UP
  KEY_W
  KEY_X
  KEY_Y
  KEY_Z
  KEY_ZERO
  LOC_COLOR_AMBIENT
  LOC_COLOR_DIFFUSE
  LOC_COLOR_SPECULAR
  LOC_MAP_ALBEDO
  LOC_MAP_BRDF
  LOC_MAP_CUBEMAP
  LOC_MAP_DIFFUSE
  LOC_MAP_EMISSION
  LOC_MAP_HEIGHT
  LOC_MAP_IRRADIANCE
  LOC_MAP_METALNESS
  LOC_MAP_NORMAL
  LOC_MAP_OCCLUSION
  LOC_MAP_PREFILTER
  LOC_MAP_ROUGHNESS
  LOC_MAP_SPECULAR
  LOC_MATRIX_MODEL
  LOC_MATRIX_MVP
  LOC_MATRIX_PROJECTION
  LOC_MATRIX_VIEW
  LOC_VECTOR_VIEW
  LOC_VERTEX_COLOR
  LOC_VERTEX_NORMAL
  LOC_VERTEX_POSITION
  LOC_VERTEX_TANGENT
  LOC_VERTEX_TEXCOORD01
  LOC_VERTEX_TEXCOORD02
  LOG_DEBUG
  LOG_ERROR
  LOG_INFO
  LOG_OTHER
  LOG_WARNING
  MAP_ALBEDO
  MAP_BRDF
  MAP_CUBEMAP
  MAP_DIFFUSE
  MAP_EMISSION
  MAP_HEIGHT
  MAP_IRRADIANCE
  MAP_METALNESS
  MAP_NORMAL
  MAP_OCCLUSION
  MAP_PREFILTER
  MAP_ROUGHNESS
  MAP_SPECULAR
  MAX_MATERIAL_MAPS
  MAX_SHADER_LOCATIONS
  MAX_TOUCH_POINTS
  MOUSE_LEFT_BUTTON
  MOUSE_MIDDLE_BUTTON
  MOUSE_RIGHT_BUTTON
  NPT_3PATCH_HORIZONTAL
  NPT_3PATCH_VERTICAL
  NPT_9PATCH
  RAD2DEG
  ShowWindow
  SubText
  UNCOMPRESSED_GRAYSCALE
  UNCOMPRESSED_GRAY_ALPHA
  UNCOMPRESSED_R32
  UNCOMPRESSED_R32G32B32
  UNCOMPRESSED_R32G32B32A32
  UNCOMPRESSED_R4G4B4A4
  UNCOMPRESSED_R5G5B5A1
  UNCOMPRESSED_R5G6B5
  UNCOMPRESSED_R8G8B8
  UNCOMPRESSED_R8G8B8A8
  UNIFORM_FLOAT
  UNIFORM_INT
  UNIFORM_IVEC2
  UNIFORM_IVEC3
  UNIFORM_IVEC4
  UNIFORM_SAMPLER2D
  UNIFORM_VEC2
  UNIFORM_VEC3
  UNIFORM_VEC4
  WRAP_CLAMP
  WRAP_MIRROR_CLAMP
  WRAP_MIRROR_REPEAT
  WRAP_REPEAT
  false
  true

=head2 Exportable functions

  void BeginBlendMode(int mode)
  void BeginDrawing(void)
  void BeginMode2D(Camera2D camera)
  void BeginMode3D(Camera3D camera)
  void BeginScissorMode(int x, int y, int width, int height)
  void BeginShaderMode(Shader shader)
  void BeginTextureMode(RenderTexture2D target)
  void BeginVrDrawing(void)
  bool ChangeDirectory(char *dir)
  bool CheckCollisionBoxSphere(BoundingBox box, Vector3 centerSphere, float radiusSphere)
  bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2)
  bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec)
  bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2)
  bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius)
  bool CheckCollisionPointRec(Vector2 point, Rectangle rec)
  bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3)
  bool CheckCollisionRayBox(Ray ray, BoundingBox box)
  bool CheckCollisionRaySphere(Ray ray, Vector3 spherePosition, float sphereRadius)
  bool CheckCollisionRaySphereEx(Ray ray, Vector3 spherePosition, float sphereRadius, Vector3 *collisionPoint)
  bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2)
  bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB)
  void ClearBackground(Color color)
  void ClearDirectoryFiles(void)
  void ClearDroppedFiles(void)
  void CloseAudioDevice(void)
  void CloseAudioStream(AudioStream stream)
  void CloseVrSimulator(void)
  void CloseWindow(void)
  Color ColorFromHSV(Vector3 hsv)
  Vector4 ColorNormalize(Color color)
  Vector3 ColorToHSV(Color color)
  int ColorToInt(Color color)
  void DisableCursor(void)
  void DrawBillboard(Camera3D camera, Texture2D texture, Vector3 center, float size, Color tint)
  void DrawBillboardRec(Camera3D camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint)
  void DrawBoundingBox(BoundingBox box, Color color)
  void DrawCircle(int centerX, int centerY, float radius, Color color)
  void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color)
  void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2)
  void DrawCircleLines(int centerX, int centerY, float radius, Color color)
  void DrawCircleV(Vector2 center, float radius, Color color)
  void DrawCube(Vector3 position, float width, float height, float length, Color color)
  void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color)
  void DrawCubeV(Vector3 position, Vector3 size, Color color)
  void DrawCubeWires(Vector3 position, float width, float height, float length, Color color)
  void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)
  void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)
  void DrawFPS(int posX, int posY)
  void DrawGizmo(Vector3 position)
  void DrawGrid(int slices, float spacing)
  void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color)
  void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color)
  void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color)
  void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color)
  void DrawLineV(Vector2 startPos, Vector2 endPos, Color color)
  void DrawModel(Model model, Vector3 position, float scale, Color tint)
  void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
  void DrawModelWires(Model model, Vector3 position, float scale, Color tint)
  void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
  void DrawPixel(int posX, int posY, Color color)
  void DrawPixelV(Vector2 position, Color color)
  void DrawPlane(Vector3 centerPos, Vector2 size, Color color)
  void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color)
  void DrawPolyEx(Vector2 *points, int numPoints, Color color)
  void DrawPolyExLines(Vector2 *points, int numPoints, Color color)
  void DrawRay(Ray ray, Color color)
  void DrawRectangle(int posX, int posY, int width, int height, Color color)
  void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4)
  void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2)
  void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2)
  void DrawRectangleLines(int posX, int posY, int width, int height, Color color)
  void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color)
  void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color)
  void DrawRectangleRec(Rectangle rec, Color color)
  void DrawRectangleV(Vector2 position, Vector2 size, Color color)
  void DrawSphere(Vector3 centerPos, float radius, Color color)
  void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color)
  void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color)
  void DrawText(char *text, int posX, int posY, int fontSize, Color color)
  void DrawTextEx(Font font, char *text, Vector2 position, float fontSize, float spacing, Color tint)
  void DrawTextRec(Font font, char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint)
  void DrawTexture(Texture2D texture, int posX, int posY, Color tint)
  void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint)
  void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint)
  void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint)
  void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint)
  void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint)
  void DrawTextureV(Texture2D texture, Vector2 position, Color tint)
  void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
  void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
  void EnableCursor(void)
  void EndBlendMode(void)
  void EndDrawing(void)
  void EndMode2D(void)
  void EndMode3D(void)
  void EndScissorMode(void)
  void EndShaderMode(void)
  void EndTextureMode(void)
  void EndVrDrawing(void)
  void ExportImage(Image image, char *fileName)
  void ExportImageAsCode(Image image, char *fileName)
  void ExportMesh(Mesh mesh, char *fileName)
  void ExportWave(Wave wave, char *fileName)
  void ExportWaveAsCode(Wave wave, char *fileName)
  Color Fade(Color color, float alpha)
  bool FileExists(char *fileName)
  Image GenImageCellular(int width, int height, int tileSize)
  Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2)
  Image GenImageColor(int width, int height, Color color)
  Image GenImageFontAtlas(CharInfo *chars, int charsCount, int fontSize, int padding, int packMethod)
  Image GenImageGradientH(int width, int height, Color left, Color right)
  Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer)
  Image GenImageGradientV(int width, int height, Color top, Color bottom)
  Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale)
  Image GenImageWhiteNoise(int width, int height, float factor)
  Mesh GenMeshCube(float width, float height, float length)
  Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize)
  Mesh GenMeshCylinder(float radius, float height, int slices)
  Mesh GenMeshHeightmap(Image heightmap, Vector3 size)
  Mesh GenMeshHemiSphere(float radius, int rings, int slices)
  Mesh GenMeshKnot(float radius, float size, int radSeg, int sides)
  Mesh GenMeshPlane(float width, float length, int resX, int resZ)
  Mesh GenMeshPoly(int sides, float radius)
  Mesh GenMeshSphere(float radius, int rings, int slices)
  Mesh GenMeshTorus(float radius, float size, int radSeg, int sides)
  Texture2D GenTextureBRDF(Shader shader, int size)
  Texture2D GenTextureCubemap(Shader shader, Texture2D skyHDR, int size)
  Texture2D GenTextureIrradiance(Shader shader, Texture2D cubemap, int size)
  void GenTextureMipmaps(Texture2D *texture)
  Texture2D GenTexturePrefilter(Shader shader, Texture2D cubemap, int size)
  Matrix GetCameraMatrix(Camera3D camera)
  RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight)
  RayHitInfo GetCollisionRayModel(Ray ray, Model *model)
  RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3)
  Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2)
  Color GetColor(int hexValue)
  char **GetDirectoryFiles(char *dirPath, int *count)
  const char *GetDirectoryPath(char *fileName)
  const char *GetExtension(char *fileName)
  int GetFPS(void)
  long GetFileModTime(char *fileName)
  const char *GetFileName(char *filePath)
  const char *GetFileNameWithoutExt(char *filePath)
  Font GetFontDefault(void)
  float GetFrameTime(void)
  int GetGamepadAxisCount(int gamepad)
  float GetGamepadAxisMovement(int gamepad, int axis)
  int GetGamepadButtonPressed(void)
  const char *GetGamepadName(int gamepad)
  int GetGestureDetected(void)
  float GetGestureDragAngle(void)
  Vector2 GetGestureDragVector(void)
  float GetGestureHoldDuration(void)
  float GetGesturePinchAngle(void)
  Vector2 GetGesturePinchVector(void)
  int GetGlyphIndex(Font font, int character)
  Color *GetImageData(Image image)
  Vector4 *GetImageDataNormalized(Image image)
  int GetKeyPressed(void)
  Matrix GetMatrixModelview()
  int GetMonitorCount(void)
  int GetMonitorHeight(int monitor)
  const char *GetMonitorName(int monitor)
  int GetMonitorPhysicalHeight(int monitor)
  int GetMonitorPhysicalWidth(int monitor)
  int GetMonitorWidth(int monitor)
  Vector2 GetMousePosition(void)
  Ray GetMouseRay(Vector2 mousePosition, Camera3D camera)
  int GetMouseWheelMove(void)
  int GetMouseX(void)
  int GetMouseY(void)
  float GetMusicTimeLength(Music music)
  float GetMusicTimePlayed(Music music)
  int GetPixelDataSize(int width, int height, int format)
  int GetRandomValue(int min, int max)
  int GetScreenHeight(void)
  int GetScreenWidth(void)
  Shader GetShaderDefault(void)
  int GetShaderLocation(Shader shader, char *uniformName)
  Image GetTextureData(Texture2D texture)
  Texture2D GetTextureDefault(void)
  double GetTime(void)
  int GetTouchPointsCount(void)
  Vector2 GetTouchPosition(int index)
  int GetTouchX(void)
  int GetTouchY(void)
  VrDeviceInfo GetVrDeviceInfo(int vrDeviceType)
  float *GetWaveData(Wave wave)
  void *GetWindowHandle(void)
  const char *GetWorkingDirectory(void)
  Vector2 GetWorldToScreen(Vector3 position, Camera3D camera)
  void HideCursor(void)
  void HideWindow(void)
  void ImageAlphaClear(Image *image, Color color, float threshold)
  void ImageAlphaCrop(Image *image, float threshold)
  void ImageAlphaMask(Image *image, Image alphaMask)
  void ImageAlphaPremultiply(Image *image)
  void ImageColorBrightness(Image *image, int brightness)
  void ImageColorContrast(Image *image, float contrast)
  void ImageColorGrayscale(Image *image)
  void ImageColorInvert(Image *image)
  void ImageColorReplace(Image *image, Color color, Color replace)
  void ImageColorTint(Image *image, Color color)
  Image ImageCopy(Image image)
  void ImageCrop(Image *image, Rectangle crop)
  void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp)
  void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec)
  void ImageDrawRectangle(Image *dst, Rectangle rec, Color color)
  void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color)
  void ImageDrawText(Image *dst, Vector2 position, char *text, int fontSize, Color color)
  void ImageDrawTextEx(Image *dst, Vector2 position, Font font, char *text, float fontSize, float spacing, Color color)
  Color *ImageExtractPalette(Image image, int maxPaletteSize, int *extractCount)
  void ImageFlipHorizontal(Image *image)
  void ImageFlipVertical(Image *image)
  void ImageFormat(Image *image, int newFormat)
  void ImageMipmaps(Image *image)
  void ImageResize(Image *image, int newWidth, int newHeight)
  void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color color)
  void ImageResizeNN(Image *image, int newWidth,int newHeight)
  void ImageRotateCCW(Image *image)
  void ImageRotateCW(Image *image)
  Image ImageText(char *text, int fontSize, Color color)
  Image ImageTextEx(Font font, char *text, float fontSize, float spacing, Color tint)
  void ImageToPOT(Image *image, Color fillColor)
  void InitAudioDevice(void)
  AudioStream InitAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels)
  void InitVrSimulator(VrDeviceInfo info)
  void InitWindow(int width, int height, char *title)
  bool IsAudioBufferProcessed(AudioStream stream)
  bool IsAudioDeviceReady(void)
  bool IsAudioStreamPlaying(AudioStream stream)
  bool IsCursorHidden(void)
  bool IsFileDropped(void)
  bool IsFileExtension(char *fileName, char *ext)
  bool IsGamepadAvailable(int gamepad)
  bool IsGamepadButtonDown(int gamepad, int button)
  bool IsGamepadButtonPressed(int gamepad, int button)
  bool IsGamepadButtonReleased(int gamepad, int button)
  bool IsGamepadButtonUp(int gamepad, int button)
  bool IsGamepadName(int gamepad, char *name)
  bool IsGestureDetected(int gesture)
  bool IsKeyDown(int key)
  bool IsKeyPressed(int key)
  bool IsKeyReleased(int key)
  bool IsKeyUp(int key)
  bool IsMouseButtonDown(int button)
  bool IsMouseButtonPressed(int button)
  bool IsMouseButtonReleased(int button)
  bool IsMouseButtonUp(int button)
  bool IsMusicPlaying(Music music)
  bool IsSoundPlaying(Sound sound)
  bool IsVrSimulatorReady(void)
  bool IsWindowHidden(void)
  bool IsWindowMinimized(void)
  bool IsWindowReady(void)
  Font LoadFont(char *fileName)
  CharInfo *LoadFontData(char *fileName, int fontSize, int *fontChars, int charsCount, int type)
  Font LoadFontEx(char *fileName, int fontSize, int *fontChars, int charsCount)
  Font LoadFontFromImage(Image image, Color key, int firstChar)
  Image LoadImage(char *fileName)
  Image LoadImageEx(Color *pixels, int width, int height)
  Image LoadImagePro(void *data, int width, int height, int format)
  Image LoadImageRaw(char *fileName, int width, int height, int format, int headerSize)
  Material LoadMaterial(char *fileName)
  Material LoadMaterialDefault(void)
  Mesh LoadMesh(char *fileName)
  Model LoadModel(char *fileName)
  Model LoadModelFromMesh(Mesh mesh)
  Music LoadMusicStream(char *fileName)
  RenderTexture2D LoadRenderTexture(int width, int height)
  Shader LoadShader(char *vsFileName, char *fsFileName)
  Shader LoadShaderCode(char *vsCode, char *fsCode)
  Sound LoadSound(char *fileName)
  Sound LoadSoundFromWave(Wave wave)
  char *LoadText(char *fileName)
  Texture2D LoadTexture(char *fileName)
  Texture2D LoadTextureFromImage(Image image)
  Wave LoadWave(char *fileName)
  Wave LoadWaveEx(void *data, int sampleCount, int sampleRate, int sampleSize, int channels)
  int MeasureText(char *text, int fontSize)
  Vector2 MeasureTextEx(Font font, char *text, float fontSize, float spacing)
  void MeshBinormals(Mesh *mesh)
  BoundingBox MeshBoundingBox(Mesh mesh)
  void MeshTangents(Mesh *mesh)
  void OpenURL(char *url)
  void PauseAudioStream(AudioStream stream)
  void PauseMusicStream(Music music)
  void PauseSound(Sound sound)
  void PlayAudioStream(AudioStream stream)
  void PlayMusicStream(Music music)
  void PlaySound(Sound sound)
  void ResumeAudioStream(AudioStream stream)
  void ResumeMusicStream(Music music)
  void ResumeSound(Sound sound)
  void SetAudioStreamPitch(AudioStream stream, float pitch)
  void SetAudioStreamVolume(AudioStream stream, float volume)
  void SetCameraAltControl(int altKey)
  void SetCameraMode(Camera3D camera, int mode)
  void SetCameraMoveControls(int frontKey, int backKey, int rightKey, int leftKey, int upKey, int downKey)
  void SetCameraPanControl(int panKey)
  void SetCameraSmoothZoomControl(int szKey)
  void SetConfigFlags(unsigned char flags)
  void SetExitKey(int key)
  void SetGesturesEnabled(unsigned int gestureFlags)
  void SetMasterVolume(float volume)
  void SetMatrixModelview(Matrix view)
  void SetMatrixProjection(Matrix proj)
  void SetMouseOffset(int offsetX, int offsetY)
  void SetMousePosition(int x, int y)
  void SetMouseScale(float scaleX, float scaleY)
  void SetMusicLoopCount(Music music, int count)
  void SetMusicPitch(Music music, float pitch)
  void SetMusicVolume(Music music, float volume)
  void SetShaderValue(Shader shader, int uniformLoc, const void *value, int uniformType)
  void SetShaderValueMatrix(Shader shader, int uniformLoc, Matrix mat)
  void SetShaderValueV(Shader shader, int uniformLoc, const void *value, int uniformType, int count)
  void SetShapesTexture(Texture2D texture, Rectangle source)
  void SetSoundPitch(Sound sound, float pitch)
  void SetSoundVolume(Sound sound, float volume)
  void SetTargetFPS(int fps)
  void SetTextureFilter(Texture2D texture, int filterMode)
  void SetTextureWrap(Texture2D texture, int wrapMode)
  void SetTraceLog(unsigned char types)
  void SetTraceLogCallback(TraceLogCallback callback)
  void SetVrDistortionShader(Shader shader)
  void SetWindowIcon(Image image)
  void SetWindowMinSize(int width, int height)
  void SetWindowMonitor(int monitor)
  void SetWindowPosition(int x, int y)
  void SetWindowSize(int width, int height)
  void SetWindowTitle(char *title)
  void ShowCursor(void)
  void StopAudioStream(AudioStream stream)
  void StopMusicStream(Music music)
  void StopSound(Sound sound)
  int StorageLoadValue(int position)
  void StorageSaveValue(int position, int value)
  void TakeScreenshot(char *fileName)
  void ToggleFullscreen(void)
  void ToggleVrMode(void)
  void TraceLog(int logType, char *text, ...)
  void UnhideWindow(void)
  void UnloadFont(Font font)
  void UnloadImage(Image image)
  void UnloadMaterial(Material material)
  void UnloadMesh(Mesh *mesh)
  void UnloadModel(Model model)
  void UnloadMusicStream(Music music)
  void UnloadRenderTexture(RenderTexture2D target)
  void UnloadShader(Shader shader)
  void UnloadSound(Sound sound)
  void UnloadTexture(Texture2D texture)
  void UnloadWave(Wave wave)
  void UpdateAudioStream(AudioStream stream, const void *data, int samplesCount)
  void UpdateCamera(Camera3D *camera)
  void UpdateMusicStream(Music music)
  void UpdateSound(Sound sound, const void *data, int samplesCount)
  void UpdateTexture(Texture2D texture, const void *pixels)
  void UpdateVrTracking(Camera3D *camera)
  Wave WaveCopy(Wave wave)
  void WaveCrop(Wave *wave, int initSample, int finalSample)
  void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels)
  bool WindowShouldClose(void)



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Ahmad Fatoum, E<lt>a3f@localE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019 by Ahmad Fatoum

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.28.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
