class_name SokoHUD
extends CanvasLayer

signal undo_pressed
signal restart_pressed
signal prev_level_pressed
signal next_level_pressed
signal change_grade_pressed
signal pedagogical_pressed
signal accessibility_pressed
signal dpad_direction_pressed(dir: Vector2i)

@onready var title_label: Label = $TopBar/MarginContainer/HBoxContainer/Title
@onready var steps_label: Label = $TopBar/MarginContainer/HBoxContainer/StepsLabel

# Action Buttons in TopBar
@onready var grade_button: Button = $TopBar/MarginContainer/HBoxContainer/GradeBtn
@onready var undo_button: Button = $TopBar/MarginContainer/HBoxContainer/UndoBtn
@onready var restart_button: Button = $TopBar/MarginContainer/HBoxContainer/RestartBtn
@onready var prev_button: Button = $TopBar/MarginContainer/HBoxContainer/PrevBtn
@onready var next_button: Button = $TopBar/MarginContainer/HBoxContainer/NextBtn
@onready var owl_button: Button = $TopBar/MarginContainer/HBoxContainer/OwlBtn
@onready var access_button: Button = $TopBar/MarginContainer/HBoxContainer/AccessBtn
@onready var toggle_bncc_button: Button = $TopBar/MarginContainer/HBoxContainer/ToggleBNCCBtn
@onready var music_button: Button = $TopBar/MarginContainer/HBoxContainer/MusicBtn
@onready var sfx_button: Button = $TopBar/MarginContainer/HBoxContainer/SfxBtn

# Objective Panel
@onready var objective_label: Label = $ObjectivePanel/Margin/VBox/ObjectiveText
@onready var math_status_label: Label = $ObjectivePanel/Margin/VBox/MathStatus

# Floating Didactic / BNCC Dialogue Modal
@onready var bncc_modal: Control = $BNCCFloatingModal
@onready var bncc_card: PanelContainer = $BNCCFloatingModal/Card
@onready var bncc_code_label: Label = $BNCCFloatingModal/Card/Margin/VBox/Header/BNCCCode
@onready var bncc_desc_label: Label = $BNCCFloatingModal/Card/Margin/VBox/BNCCDesc
@onready var close_bncc_btn: Button = $BNCCFloatingModal/Card/Margin/VBox/Header/CloseBtn
@onready var dismiss_bncc_btn: Button = $BNCCFloatingModal/Card/Margin/VBox/DismissBtn

# Virtual D-Pad (Touch / Mobile)
@onready var virtual_dpad: Control = $VirtualDPad
@onready var up_btn: Button = $VirtualDPad/UpBtn
@onready var down_btn: Button = $VirtualDPad/DownBtn
@onready var left_btn: Button = $VirtualDPad/LeftBtn
@onready var right_btn: Button = $VirtualDPad/RightBtn
@onready var quick_undo_btn: Button = $VirtualDPad/QuickActionContainer/QuickUndoBtn
@onready var quick_restart_btn: Button = $VirtualDPad/QuickActionContainer/QuickRestartBtn

var _float_tween: Tween
var _base_card_y: float = 80.0
var _is_bncc_open: bool = false

func _ready() -> void:
	var all_btns: Array[Button] = [
		grade_button, undo_button, restart_button, prev_button, next_button,
		owl_button, access_button, toggle_bncc_button, music_button, sfx_button,
		close_bncc_btn, dismiss_bncc_btn,
		up_btn, down_btn, left_btn, right_btn, quick_undo_btn, quick_restart_btn
	]
	for btn in all_btns:
		if btn:
			btn.focus_mode = Control.FOCUS_NONE

	if grade_button:
		grade_button.pressed.connect(func():
			SoundManager.play("click")
			change_grade_pressed.emit()
		)

	if undo_button:
		undo_button.pressed.connect(func():
			SoundManager.play("click")
			undo_pressed.emit()
		)
	if restart_button:
		restart_button.pressed.connect(func():
			SoundManager.play("click")
			restart_pressed.emit()
		)
	if prev_button:
		prev_button.pressed.connect(func():
			SoundManager.play("click")
			prev_level_pressed.emit()
		)
	if next_button:
		next_button.pressed.connect(func():
			SoundManager.play("click")
			next_level_pressed.emit()
		)

	if owl_button:
		owl_button.pressed.connect(func():
			SoundManager.play("click")
			pedagogical_pressed.emit()
		)

	if access_button:
		access_button.pressed.connect(func():
			SoundManager.play("click")
			accessibility_pressed.emit()
		)

	if toggle_bncc_button:
		toggle_bncc_button.pressed.connect(func():
			SoundManager.play("click")
			toggle_bncc_modal()
		)

	if music_button:
		music_button.pressed.connect(func():
			SoundManager.play("click")
			if SoundManager.instance:
				SoundManager.instance.toggle_music()
		)

	if sfx_button:
		sfx_button.pressed.connect(func():
			SoundManager.play("click")
			if SoundManager.instance:
				SoundManager.instance.toggle_sfx()
		)

	# Virtual DPad connections
	if up_btn:
		up_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.UP))
	if down_btn:
		down_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.DOWN))
	if left_btn:
		left_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.LEFT))
	if right_btn:
		right_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.RIGHT))
	if quick_undo_btn:
		quick_undo_btn.pressed.connect(func():
			SoundManager.play("click")
			undo_pressed.emit()
		)
	if quick_restart_btn:
		quick_restart_btn.pressed.connect(func():
			SoundManager.play("click")
			restart_pressed.emit()
		)

	if SoundManager.instance:
		SoundManager.instance.music_toggled.connect(func(_enabled: bool): _update_audio_buttons())
		SoundManager.instance.sfx_toggled.connect(func(_enabled: bool): _update_audio_buttons())
	_update_audio_buttons()

	if close_bncc_btn:
		close_bncc_btn.pressed.connect(func():
			SoundManager.play("click")
			close_bncc_modal()
		)
	if dismiss_bncc_btn:
		dismiss_bncc_btn.pressed.connect(func():
			SoundManager.play("click")
			close_bncc_modal()
		)

	if bncc_modal:
		bncc_modal.visible = false
	if bncc_card:
		_base_card_y = bncc_card.position.y

func set_virtual_dpad_visible(is_vis: bool) -> void:
	if virtual_dpad:
		virtual_dpad.visible = is_vis

func set_large_text_mode(is_large: bool) -> void:
	var scale_factor := 1.2 if is_large else 1.0
	if title_label and title_label.label_settings:
		title_label.label_settings.font_size = int(17 * scale_factor)
	if steps_label and steps_label.label_settings:
		steps_label.label_settings.font_size = int(15 * scale_factor)
	if objective_label and objective_label.label_settings:
		objective_label.label_settings.font_size = int(15 * scale_factor)
	if math_status_label and math_status_label.label_settings:
		math_status_label.label_settings.font_size = int(14 * scale_factor)

func _update_audio_buttons() -> void:
	if not SoundManager.instance:
		return
	var music_on := SoundManager.instance.is_music_enabled()
	var sfx_on := SoundManager.instance.is_sfx_enabled()

	if music_button:
		music_button.modulate = Color(1.0, 1.0, 1.0, 1.0) if music_on else Color(1.0, 1.0, 1.0, 0.35)
		music_button.tooltip_text = "Música: " + ("Ligada" if music_on else "Desligada")

	if sfx_button:
		sfx_button.modulate = Color(1.0, 1.0, 1.0, 1.0) if sfx_on else Color(1.0, 1.0, 1.0, 0.35)
		sfx_button.tooltip_text = "Efeitos Sonoros: " + ("Ligados" if sfx_on else "Desligados")

func update_level_info(level_dict: Dictionary) -> void:
	var g: int = level_dict.get("grade", 1)
	if grade_button:
		grade_button.text = "🎒 %dº Ano ▼" % g
	if title_label:
		title_label.text = "SokoMath | " + level_dict.get("title", "Fase")
	if objective_label:
		objective_label.text = "🎯 " + level_dict.get("rule_description", "")
	if bncc_code_label:
		bncc_code_label.text = "📚 " + level_dict.get("bncc_code", "BNCC Computação")
	if bncc_desc_label:
		bncc_desc_label.text = level_dict.get("bncc_desc", "")

func update_steps(steps: int, optimal: int) -> void:
	if steps_label:
		steps_label.text = "Passos: %d (Meta: %d)" % [steps, optimal]

func update_math_status(status_text: String, is_satisfied: bool) -> void:
	if math_status_label:
		math_status_label.text = status_text
		if is_satisfied:
			math_status_label.modulate = Color(0.35, 1.0, 0.45)
		else:
			math_status_label.modulate = Color(1.0, 0.88, 0.35)

func toggle_bncc_modal() -> void:
	if _is_bncc_open:
		close_bncc_modal()
	else:
		open_bncc_modal()

func open_bncc_modal() -> void:
	if not bncc_modal or not bncc_card:
		return
	_is_bncc_open = true
	bncc_modal.visible = true
	if toggle_bncc_button:
		toggle_bncc_button.text = "📖 Fechar"

	bncc_card.scale = Vector2(0.85, 0.85)
	bncc_card.modulate.a = 0.0

	var open_tween := create_tween().set_parallel(true).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	open_tween.tween_property(bncc_card, "scale", Vector2.ONE, 0.25)
	open_tween.tween_property(bncc_card, "modulate:a", 1.0, 0.2)
	open_tween.chain().tween_callback(Callable(self, "_start_floating_animation"))

func close_bncc_modal() -> void:
	if not bncc_modal or not bncc_card:
		return
	_is_bncc_open = false
	_stop_floating_animation()
	if toggle_bncc_button:
		toggle_bncc_button.text = "💡 Dica"

	var close_tween := create_tween().set_parallel(true).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	close_tween.tween_property(bncc_card, "scale", Vector2(0.85, 0.85), 0.18)
	close_tween.tween_property(bncc_card, "modulate:a", 0.0, 0.15)
	close_tween.chain().tween_callback(func():
		if not _is_bncc_open:
			bncc_modal.visible = false
	)

func _start_floating_animation() -> void:
	_stop_floating_animation()
	if not bncc_card or not _is_bncc_open:
		return

	_float_tween = create_tween().set_loops().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_float_tween.tween_property(bncc_card, "position:y", _base_card_y - 7.0, 1.8)
	_float_tween.tween_property(bncc_card, "position:y", _base_card_y + 7.0, 1.8)

func _stop_floating_animation() -> void:
	if _float_tween and _float_tween.is_valid():
		_float_tween.kill()
	_float_tween = null
