class_name SokoAccessibilityModal
extends CanvasLayer

signal high_contrast_changed(enabled: bool)
signal large_text_changed(enabled: bool)
signal virtual_dpad_changed(enabled: bool)
signal swipe_gestures_changed(enabled: bool)
signal reduced_motion_changed(enabled: bool)
signal closed

@onready var close_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CloseBtn

# Toggles
@onready var high_contrast_check: CheckButton = $CenterContainer/PanelContainer/Margin/VBox/Content/Grid/ContrastCheck
@onready var large_text_check: CheckButton = $CenterContainer/PanelContainer/Margin/VBox/Content/Grid/TextScaleCheck
@onready var virtual_dpad_check: CheckButton = $CenterContainer/PanelContainer/Margin/VBox/Content/Grid/DpadCheck
@onready var swipe_check: CheckButton = $CenterContainer/PanelContainer/Margin/VBox/Content/Grid/SwipeCheck
@onready var reduced_motion_check: CheckButton = $CenterContainer/PanelContainer/Margin/VBox/Content/Grid/MotionCheck

# Audio Sliders
@onready var music_slider: HSlider = $CenterContainer/PanelContainer/Margin/VBox/Content/AudioSection/MusicRow/MusicSlider
@onready var sfx_slider: HSlider = $CenterContainer/PanelContainer/Margin/VBox/Content/AudioSection/SfxRow/SfxSlider
@onready var music_val_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Content/AudioSection/MusicRow/MusicVal
@onready var sfx_val_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Content/AudioSection/SfxRow/SfxVal
@onready var test_sfx_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Content/AudioSection/TestSfxBtn

# State
var is_high_contrast: bool = false
var is_large_text: bool = false
var is_virtual_dpad_enabled: bool = true
var is_swipe_enabled: bool = true
var is_reduced_motion: bool = false

func _ready() -> void:
	visible = false

	if close_btn:
		close_btn.focus_mode = Control.FOCUS_NONE
		close_btn.pressed.connect(func():
			SoundManager.play("click")
			close()
		)

	# Setup initial check states
	if high_contrast_check:
		high_contrast_check.toggled.connect(func(toggled: bool):
			is_high_contrast = toggled
			SoundManager.play("click")
			high_contrast_changed.emit(toggled)
		)

	if large_text_check:
		large_text_check.toggled.connect(func(toggled: bool):
			is_large_text = toggled
			SoundManager.play("click")
			large_text_changed.emit(toggled)
		)

	if virtual_dpad_check:
		virtual_dpad_check.button_pressed = is_virtual_dpad_enabled
		virtual_dpad_check.toggled.connect(func(toggled: bool):
			is_virtual_dpad_enabled = toggled
			SoundManager.play("click")
			virtual_dpad_changed.emit(toggled)
		)

	if swipe_check:
		swipe_check.button_pressed = is_swipe_enabled
		swipe_check.toggled.connect(func(toggled: bool):
			is_swipe_enabled = toggled
			SoundManager.play("click")
			swipe_gestures_changed.emit(toggled)
		)

	if reduced_motion_check:
		reduced_motion_check.toggled.connect(func(toggled: bool):
			is_reduced_motion = toggled
			SoundManager.play("click")
			reduced_motion_changed.emit(toggled)
		)

	# Audio setup
	if music_slider:
		music_slider.value = 80
		music_slider.value_changed.connect(func(val: float):
			if music_val_label:
				music_val_label.text = "%d%%" % int(val)
			if SoundManager.instance:
				var db := linear_to_db(maxf(val / 100.0, 0.001))
				SoundManager.instance.music_volume_db = db
				if SoundManager.instance._bgm_player:
					SoundManager.instance._bgm_player.volume_db = db
		)

	if sfx_slider:
		sfx_slider.value = 90
		sfx_slider.value_changed.connect(func(val: float):
			if sfx_val_label:
				sfx_val_label.text = "%d%%" % int(val)
			if SoundManager.instance:
				var db := linear_to_db(maxf(val / 100.0, 0.001))
				SoundManager.instance.sfx_volume_db = db
		)

	if test_sfx_btn:
		test_sfx_btn.focus_mode = Control.FOCUS_NONE
		test_sfx_btn.pressed.connect(func():
			SoundManager.play("win")
		)

func open() -> void:
	visible = true

func close() -> void:
	visible = false
	closed.emit()
