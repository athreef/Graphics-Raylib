# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Graphics-Raylib-XS.t'

#########################

# change 'tests => 2' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Graphics::Raylib::XS') };


my $fail = 0;
foreach my $constname (qw(
	BLEND_ADDITIVE BLEND_ALPHA BLEND_MULTIPLIED CAMERA_CUSTOM
	CAMERA_FIRST_PERSON CAMERA_FREE CAMERA_ORBITAL CAMERA_ORTHOGRAPHIC
	CAMERA_PERSPECTIVE CAMERA_THIRD_PERSON COMPRESSED_ASTC_4x4_RGBA
	COMPRESSED_ASTC_8x8_RGBA COMPRESSED_DXT1_RGB COMPRESSED_DXT1_RGBA
	COMPRESSED_DXT3_RGBA COMPRESSED_DXT5_RGBA COMPRESSED_ETC1_RGB
	COMPRESSED_ETC2_EAC_RGBA COMPRESSED_ETC2_RGB COMPRESSED_PVRT_RGB
	COMPRESSED_PVRT_RGBA DEG2RAD FILTER_ANISOTROPIC_16X
	FILTER_ANISOTROPIC_4X FILTER_ANISOTROPIC_8X FILTER_BILINEAR
	FILTER_POINT FILTER_TRILINEAR FLAG_FULLSCREEN_MODE FLAG_MSAA_4X_HINT
	FLAG_SHOW_LOGO FLAG_VSYNC_HINT FLAG_WINDOW_RESIZABLE
	FLAG_WINDOW_TRANSPARENT FLAG_WINDOW_UNDECORATED FONT_BITMAP
	FONT_DEFAULT FONT_SDF GAMEPAD_ANDROID_BUTTON_A GAMEPAD_ANDROID_BUTTON_B
	GAMEPAD_ANDROID_BUTTON_C GAMEPAD_ANDROID_BUTTON_L1
	GAMEPAD_ANDROID_BUTTON_L2 GAMEPAD_ANDROID_BUTTON_R1
	GAMEPAD_ANDROID_BUTTON_R2 GAMEPAD_ANDROID_BUTTON_X
	GAMEPAD_ANDROID_BUTTON_Y GAMEPAD_ANDROID_BUTTON_Z
	GAMEPAD_ANDROID_DPAD_CENTER GAMEPAD_ANDROID_DPAD_DOWN
	GAMEPAD_ANDROID_DPAD_LEFT GAMEPAD_ANDROID_DPAD_RIGHT
	GAMEPAD_ANDROID_DPAD_UP GAMEPAD_PLAYER1 GAMEPAD_PLAYER2 GAMEPAD_PLAYER3
	GAMEPAD_PLAYER4 GAMEPAD_PS3_AXIS_L2 GAMEPAD_PS3_AXIS_LEFT_X
	GAMEPAD_PS3_AXIS_LEFT_Y GAMEPAD_PS3_AXIS_R2 GAMEPAD_PS3_AXIS_RIGHT_X
	GAMEPAD_PS3_AXIS_RIGHT_Y GAMEPAD_PS3_BUTTON_CIRCLE
	GAMEPAD_PS3_BUTTON_CROSS GAMEPAD_PS3_BUTTON_DOWN GAMEPAD_PS3_BUTTON_L1
	GAMEPAD_PS3_BUTTON_L2 GAMEPAD_PS3_BUTTON_LEFT GAMEPAD_PS3_BUTTON_PS
	GAMEPAD_PS3_BUTTON_R1 GAMEPAD_PS3_BUTTON_R2 GAMEPAD_PS3_BUTTON_RIGHT
	GAMEPAD_PS3_BUTTON_SELECT GAMEPAD_PS3_BUTTON_SQUARE
	GAMEPAD_PS3_BUTTON_START GAMEPAD_PS3_BUTTON_TRIANGLE
	GAMEPAD_PS3_BUTTON_UP GAMEPAD_XBOX_AXIS_LEFT_X GAMEPAD_XBOX_AXIS_LEFT_Y
	GAMEPAD_XBOX_AXIS_LT GAMEPAD_XBOX_AXIS_RIGHT_X
	GAMEPAD_XBOX_AXIS_RIGHT_Y GAMEPAD_XBOX_AXIS_RT GAMEPAD_XBOX_BUTTON_A
	GAMEPAD_XBOX_BUTTON_B GAMEPAD_XBOX_BUTTON_DOWN GAMEPAD_XBOX_BUTTON_HOME
	GAMEPAD_XBOX_BUTTON_LB GAMEPAD_XBOX_BUTTON_LEFT GAMEPAD_XBOX_BUTTON_RB
	GAMEPAD_XBOX_BUTTON_RIGHT GAMEPAD_XBOX_BUTTON_SELECT
	GAMEPAD_XBOX_BUTTON_START GAMEPAD_XBOX_BUTTON_UP GAMEPAD_XBOX_BUTTON_X
	GAMEPAD_XBOX_BUTTON_Y GESTURE_DOUBLETAP GESTURE_DRAG GESTURE_HOLD
	GESTURE_NONE GESTURE_PINCH_IN GESTURE_PINCH_OUT GESTURE_SWIPE_DOWN
	GESTURE_SWIPE_LEFT GESTURE_SWIPE_RIGHT GESTURE_SWIPE_UP GESTURE_TAP
	HMD_DEFAULT_DEVICE HMD_OCULUS_GO HMD_OCULUS_RIFT_CV1
	HMD_OCULUS_RIFT_DK2 HMD_SONY_PSVR HMD_VALVE_HTC_VIVE KEY_A
	KEY_APOSTROPHE KEY_B KEY_BACK KEY_BACKSLASH KEY_BACKSPACE KEY_C
	KEY_CAPS_LOCK KEY_COMMA KEY_D KEY_DELETE KEY_DOWN KEY_E KEY_EIGHT
	KEY_END KEY_ENTER KEY_EQUAL KEY_ESCAPE KEY_F KEY_F1 KEY_F10 KEY_F11
	KEY_F12 KEY_F2 KEY_F3 KEY_F4 KEY_F5 KEY_F6 KEY_F7 KEY_F8 KEY_F9
	KEY_FIVE KEY_FOUR KEY_G KEY_GRAVE KEY_H KEY_HOME KEY_I KEY_INSERT KEY_J
	KEY_K KEY_KB_MENU KEY_KP_0 KEY_KP_1 KEY_KP_2 KEY_KP_3 KEY_KP_4 KEY_KP_5
	KEY_KP_6 KEY_KP_7 KEY_KP_8 KEY_KP_9 KEY_KP_ADD KEY_KP_DECIMAL
	KEY_KP_DIVIDE KEY_KP_ENTER KEY_KP_EQUAL KEY_KP_MULTIPLY KEY_KP_SUBTRACT
	KEY_L KEY_LEFT KEY_LEFT_ALT KEY_LEFT_BRACKET KEY_LEFT_CONTROL
	KEY_LEFT_SHIFT KEY_LEFT_SUPER KEY_M KEY_MENU KEY_MINUS KEY_N KEY_NINE
	KEY_NUM_LOCK KEY_O KEY_ONE KEY_P KEY_PAGE_DOWN KEY_PAGE_UP KEY_PAUSE
	KEY_PERIOD KEY_PRINT_SCREEN KEY_Q KEY_R KEY_RIGHT KEY_RIGHT_ALT
	KEY_RIGHT_BRACKET KEY_RIGHT_CONTROL KEY_RIGHT_SHIFT KEY_RIGHT_SUPER
	KEY_S KEY_SCROLL_LOCK KEY_SEMICOLON KEY_SEVEN KEY_SIX KEY_SLASH
	KEY_SPACE KEY_T KEY_TAB KEY_THREE KEY_TWO KEY_U KEY_UP KEY_V
	KEY_VOLUME_DOWN KEY_VOLUME_UP KEY_W KEY_X KEY_Y KEY_Z KEY_ZERO
	LOC_COLOR_AMBIENT LOC_COLOR_DIFFUSE LOC_COLOR_SPECULAR LOC_MAP_ALBEDO
	LOC_MAP_BRDF LOC_MAP_CUBEMAP LOC_MAP_DIFFUSE LOC_MAP_EMISSION
	LOC_MAP_HEIGHT LOC_MAP_IRRADIANCE LOC_MAP_METALNESS LOC_MAP_NORMAL
	LOC_MAP_OCCLUSION LOC_MAP_PREFILTER LOC_MAP_ROUGHNESS LOC_MAP_SPECULAR
	LOC_MATRIX_MODEL LOC_MATRIX_MVP LOC_MATRIX_PROJECTION LOC_MATRIX_VIEW
	LOC_VECTOR_VIEW LOC_VERTEX_COLOR LOC_VERTEX_NORMAL LOC_VERTEX_POSITION
	LOC_VERTEX_TANGENT LOC_VERTEX_TEXCOORD01 LOC_VERTEX_TEXCOORD02
	LOG_DEBUG LOG_ERROR LOG_INFO LOG_OTHER LOG_WARNING MAP_ALBEDO MAP_BRDF
	MAP_CUBEMAP MAP_DIFFUSE MAP_EMISSION MAP_HEIGHT MAP_IRRADIANCE
	MAP_METALNESS MAP_NORMAL MAP_OCCLUSION MAP_PREFILTER MAP_ROUGHNESS
	MAP_SPECULAR MAX_MATERIAL_MAPS MAX_SHADER_LOCATIONS MAX_TOUCH_POINTS
	MOUSE_LEFT_BUTTON MOUSE_MIDDLE_BUTTON MOUSE_RIGHT_BUTTON
	NPT_3PATCH_HORIZONTAL NPT_3PATCH_VERTICAL NPT_9PATCH RAD2DEG
	UNCOMPRESSED_GRAYSCALE UNCOMPRESSED_GRAY_ALPHA UNCOMPRESSED_R32
	UNCOMPRESSED_R32G32B32 UNCOMPRESSED_R32G32B32A32 UNCOMPRESSED_R4G4B4A4
	UNCOMPRESSED_R5G5B5A1 UNCOMPRESSED_R5G6B5 UNCOMPRESSED_R8G8B8
	UNCOMPRESSED_R8G8B8A8 WRAP_CLAMP WRAP_MIRROR WRAP_REPEAT false true)) {
  next if (eval "my \$a = $constname; 1");
  if ($@ =~ /^Your vendor has not defined Graphics::Raylib::XS macro $constname/) {
    print "# pass: $@";
  } else {
    print "# fail: $@";
    $fail = 1;
  }

}

ok( $fail == 0 , 'Constants' );
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

