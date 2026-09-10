class_name SokoGradeSelectModal
extends CanvasLayer

signal grade_and_level_selected(grade: int, level_idx: int)
signal closed

@onready var close_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CloseBtn
@onready var cards_container: HBoxContainer = $CenterContainer/PanelContainer/Margin/VBox/ScrollCards/CardsContainer
@onready var music_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/AudioControls/MusicBtn
@onready var sfx_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/AudioControls/SfxBtn

var _selected_grade: int = 1

func _ready() -> void:
	if close_btn:
		close_btn.focus_mode = Control.FOCUS_NONE
		close_btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			closed.emit()
		)
	if music_btn:
		music_btn.focus_mode = Control.FOCUS_NONE
		music_btn.pressed.connect(func():
			SoundManager.play("click")
			if SoundManager.instance:
				SoundManager.instance.toggle_music()
		)
	if sfx_btn:
		sfx_btn.focus_mode = Control.FOCUS_NONE
		sfx_btn.pressed.connect(func():
			if SoundManager.instance:
				SoundManager.instance.toggle_sfx()
			SoundManager.play("click")
		)

	if SoundManager.instance:
		SoundManager.instance.music_toggled.connect(func(_enabled: bool): _update_audio_buttons())
		SoundManager.instance.sfx_toggled.connect(func(_enabled: bool): _update_audio_buttons())

	_update_audio_buttons()
	_build_grade_cards()

func open(current_grade: int = 1) -> void:
	_selected_grade = current_grade
	visible = true
	_update_audio_buttons()
	_highlight_selected_grade()

func _update_audio_buttons() -> void:
	if SoundManager.instance:
		var mus_on: bool = SoundManager.instance.is_music_enabled()
		var sfx_on: bool = SoundManager.instance.is_sfx_enabled()
		if music_btn:
			music_btn.modulate.a = 1.0 if mus_on else 0.35
			music_btn.text = " Música"
			music_btn.tooltip_text = "Música: Ativada (Clique para desativar)" if mus_on else "Música: Desativada (Clique para ativar)"
		if sfx_btn:
			sfx_btn.modulate.a = 1.0 if sfx_on else 0.35
			sfx_btn.text = " Efeitos"
			sfx_btn.tooltip_text = "Efeitos Sonoros: Ativados (Clique para desativar)" if sfx_on else "Efeitos Sonoros: Desativados (Clique para ativar)"

func close() -> void:
	visible = false

func _build_grade_cards() -> void:
	if not cards_container:
		return

	for child in cards_container.get_children():
		child.queue_free()

	var grades := LevelData.get_grades()
	for g in grades:
		var info: Dictionary = LevelData.get_grade_info(g)
		var card := _create_grade_card(g, info)
		cards_container.add_child(card)

func _create_grade_card(grade: int, info: Dictionary) -> PanelContainer:
	var card := PanelContainer.new()
	card.custom_minimum_size = Vector2(215, 420)
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var accent: Color = info.get("accent_color", Color(0.3, 0.6, 0.9))

	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.09, 0.13, 0.19, 0.95)
	style.border_width_left = 2
	style.border_width_top = 4
	style.border_width_right = 2
	style.border_width_bottom = 2
	style.border_color = accent
	style.set_corner_radius_all(8)
	style.shadow_size = 6
	style.shadow_color = Color(0, 0, 0, 0.4)
	card.add_theme_stylebox_override("panel", style)

	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 12)
	margin.add_theme_constant_override("margin_top", 12)
	margin.add_theme_constant_override("margin_right", 12)
	margin.add_theme_constant_override("margin_bottom", 12)
	card.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 8)
	margin.add_child(vbox)

	# Tag Badge (Ano)
	var badge_box := PanelContainer.new()
	var b_style := StyleBoxFlat.new()
	b_style.bg_color = accent
	b_style.set_corner_radius_all(4)
	badge_box.add_theme_stylebox_override("panel", b_style)
	var b_label := Label.new()
	b_label.text = info.get("name", "Ano").to_upper()
	b_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	b_label.add_theme_font_size_override("font_size", 16)
	b_label.add_theme_color_override("font_color", Color.BLACK)
	badge_box.add_child(b_label)
	vbox.add_child(badge_box)

	# Age label
	var age_label := Label.new()
	age_label.text = "Idade: " + info.get("age", "")
	age_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	age_label.add_theme_font_size_override("font_size", 12)
	age_label.add_theme_color_override("font_color", Color(0.8, 0.9, 1.0))
	vbox.add_child(age_label)

	# Subtitle
	var sub_label := Label.new()
	sub_label.text = info.get("subtitle", "")
	sub_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sub_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub_label.add_theme_font_size_override("font_size", 13)
	sub_label.add_theme_color_override("font_color", Color(1.0, 0.9, 0.4))
	vbox.add_child(sub_label)

	# Description
	var desc_label := Label.new()
	desc_label.text = info.get("description", "")
	desc_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	desc_label.add_theme_font_size_override("font_size", 11)
	desc_label.add_theme_color_override("font_color", Color(0.75, 0.82, 0.9))
	desc_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	vbox.add_child(desc_label)

	# Level Grid / Buttons (1 a 5)
	var lvl_box := VBoxContainer.new()
	lvl_box.add_theme_constant_override("separation", 4)

	var lvl_title := Label.new()
	lvl_title.text = "Escolher Fase:"
	lvl_title.add_theme_font_size_override("font_size", 11)
	lvl_title.add_theme_color_override("font_color", Color(0.65, 0.75, 0.85))
	lvl_box.add_child(lvl_title)

	var btn_row := HBoxContainer.new()
	btn_row.alignment = BoxContainer.ALIGNMENT_CENTER
	btn_row.add_theme_constant_override("separation", 4)
	for i in range(5):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(32, 28)
		btn.focus_mode = Control.FOCUS_NONE
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(grade, lvl_idx)
		)
		btn_row.add_child(btn)
	lvl_box.add_child(btn_row)
	vbox.add_child(lvl_box)

	# Primary Play Battery Button
	var start_btn := Button.new()
	start_btn.text = "Jogar Bateria"
	start_btn.icon = preload("res://assets/icons/arrow_right.svg")
	start_btn.expand_icon = true
	start_btn.custom_minimum_size = Vector2(0, 36)
	start_btn.focus_mode = Control.FOCUS_NONE
	var start_style := StyleBoxFlat.new()
	start_style.bg_color = accent.darkened(0.2)
	start_style.border_width_top = 1
	start_style.border_color = accent.lightened(0.3)
	start_style.set_corner_radius_all(6)
	start_btn.add_theme_stylebox_override("normal", start_style)
	start_btn.pressed.connect(func():
		SoundManager.play("click")
		close()
		grade_and_level_selected.emit(grade, 0)
	)
	vbox.add_child(start_btn)

	return card

func _highlight_selected_grade() -> void:
	# Podem ser adicionados efeitos visuais quando reaberto
	pass
