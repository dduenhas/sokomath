class_name SokoGradeSelectModal
extends CanvasLayer

signal grade_and_level_selected(grade: int, level_idx: int)
signal closed

enum ViewMode { CURRICULAR, EXTRA }

@onready var close_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CloseBtn
@onready var music_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/AudioControls/MusicBtn
@onready var sfx_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/AudioControls/SfxBtn
@onready var math_tab_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/ModeSwitcher/MathTabBtn
@onready var extra_tab_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/ModeSwitcher/ExtraTabBtn
@onready var cards_container: HBoxContainer = $CenterContainer/PanelContainer/Margin/VBox/ScrollCards/CardsContainer

var _selected_grade: int = 1
var _current_mode: ViewMode = ViewMode.CURRICULAR

func _ready() -> void:
	if close_btn:
		close_btn.focus_mode = Control.FOCUS_ALL
		close_btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			closed.emit()
		)
	if music_btn:
		music_btn.focus_mode = Control.FOCUS_ALL
		music_btn.pressed.connect(func():
			SoundManager.play("click")
			if SoundManager.instance:
				SoundManager.instance.toggle_music()
		)
	if sfx_btn:
		sfx_btn.focus_mode = Control.FOCUS_ALL
		sfx_btn.pressed.connect(func():
			if SoundManager.instance:
				SoundManager.instance.toggle_sfx()
			SoundManager.play("click")
		)

	if math_tab_btn:
		math_tab_btn.focus_mode = Control.FOCUS_ALL
		math_tab_btn.pressed.connect(func():
			SoundManager.play("click")
			_switch_mode(ViewMode.CURRICULAR)
		)

	if extra_tab_btn:
		extra_tab_btn.focus_mode = Control.FOCUS_ALL
		extra_tab_btn.pressed.connect(func():
			SoundManager.play("click")
			_switch_mode(ViewMode.EXTRA)
		)

	if SoundManager.instance:
		SoundManager.instance.music_toggled.connect(func(_enabled: bool): _update_audio_buttons())
		SoundManager.instance.sfx_toggled.connect(func(_enabled: bool): _update_audio_buttons())

	_update_audio_buttons()
	_update_tab_styles()
	_build_cards()

func open(current_grade: int = 1) -> void:
	_selected_grade = current_grade
	if current_grade == 6 or current_grade == 0:
		_current_mode = ViewMode.EXTRA
	else:
		_current_mode = ViewMode.CURRICULAR

	visible = true
	_update_audio_buttons()
	_update_tab_styles()
	_build_cards()

	# Acessibilidade por teclado: foca a aba ativa ao abrir
	if _current_mode == ViewMode.CURRICULAR and math_tab_btn:
		math_tab_btn.grab_focus()
	elif _current_mode == ViewMode.EXTRA and extra_tab_btn:
		extra_tab_btn.grab_focus()

func close() -> void:
	visible = false

func _switch_mode(mode: ViewMode) -> void:
	if _current_mode != mode:
		_current_mode = mode
		_update_tab_styles()
		_build_cards()

func _update_tab_styles() -> void:
	var active_style := StyleBoxFlat.new()
	active_style.bg_color = Color(0.18, 0.32, 0.48, 0.98)
	active_style.border_width_left = 2
	active_style.border_width_top = 2
	active_style.border_width_right = 2
	active_style.border_width_bottom = 2
	active_style.border_color = Color(0.4, 0.85, 1.0, 1.0)
	active_style.set_corner_radius_all(8)

	var inactive_style := StyleBoxFlat.new()
	inactive_style.bg_color = Color(0.08, 0.12, 0.18, 0.85)
	inactive_style.border_width_left = 1
	inactive_style.border_width_top = 1
	inactive_style.border_width_right = 1
	inactive_style.border_width_bottom = 1
	inactive_style.border_color = Color(0.25, 0.35, 0.48, 1.0)
	inactive_style.set_corner_radius_all(8)

	if math_tab_btn:
		var is_cur := (_current_mode == ViewMode.CURRICULAR)
		math_tab_btn.add_theme_stylebox_override("normal", active_style if is_cur else inactive_style)
		math_tab_btn.add_theme_color_override("font_color", Color.WHITE if is_cur else Color(0.7, 0.8, 0.9))

	if extra_tab_btn:
		var is_ext := (_current_mode == ViewMode.EXTRA)
		extra_tab_btn.add_theme_stylebox_override("normal", active_style if is_ext else inactive_style)
		extra_tab_btn.add_theme_color_override("font_color", Color.WHITE if is_ext else Color(0.7, 0.8, 0.9))

func _update_audio_buttons() -> void:
	if SoundManager.instance:
		var mus_on: bool = SoundManager.instance.is_music_enabled()
		var sfx_on: bool = SoundManager.instance.is_sfx_enabled()
		if music_btn:
			music_btn.modulate.a = 1.0 if mus_on else 0.4
			music_btn.text = " Música"
			music_btn.tooltip_text = "Música: Ativada (Clique para desativar)" if mus_on else "Música: Desativada (Clique para ativar)"
		if sfx_btn:
			sfx_btn.modulate.a = 1.0 if sfx_on else 0.4
			sfx_btn.text = " Efeitos"
			sfx_btn.tooltip_text = "Efeitos Sonoros: Ativados (Clique para desativar)" if sfx_on else "Efeitos Sonoros: Desativados (Clique para ativar)"

func _build_cards() -> void:
	if not cards_container:
		return

	for child in cards_container.get_children():
		child.queue_free()

	if _current_mode == ViewMode.CURRICULAR:
		# 1º ao 5º Ano (Trilha de Matemática)
		var grades := LevelData.get_grades()
		for g in grades:
			var info: Dictionary = LevelData.get_grade_info(g)
			var card := _create_grade_card(g, info)
			cards_container.add_child(card)
	else:
		# Modalidade Complementar: Desafios Extras de Lógica Computacional
		var extra_info: Dictionary = LevelData.get_grade_info(6)
		var extra_card := _create_extra_challenges_card(extra_info)
		cards_container.add_child(extra_card)

		# Sokoban Clássico sem Matemática (Modo Prêmio)
		var classic_card := _create_classic_card()
		cards_container.add_child(classic_card)

func _get_focus_style() -> StyleBoxFlat:
	var f_style := StyleBoxFlat.new()
	f_style.bg_color = Color(0, 0, 0, 0)
	f_style.border_width_left = 2
	f_style.border_width_top = 2
	f_style.border_width_right = 2
	f_style.border_width_bottom = 2
	f_style.border_color = Color(1.0, 0.88, 0.35, 1.0)
	f_style.set_corner_radius_all(6)
	return f_style

func _create_grade_card(grade: int, info: Dictionary) -> PanelContainer:
	var card := PanelContainer.new()
	card.custom_minimum_size = Vector2(215, 410)
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
	margin.add_theme_constant_override("margin_top", 10)
	margin.add_theme_constant_override("margin_right", 12)
	margin.add_theme_constant_override("margin_bottom", 10)
	card.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 5)
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
	b_label.add_theme_font_size_override("font_size", 15)
	b_label.add_theme_color_override("font_color", Color.BLACK)
	badge_box.add_child(b_label)
	vbox.add_child(badge_box)

	# Age label
	var age_label := Label.new()
	age_label.text = "Idade: " + info.get("age", "")
	age_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	age_label.add_theme_font_size_override("font_size", 11)
	age_label.add_theme_color_override("font_color", Color(0.8, 0.9, 1.0))
	vbox.add_child(age_label)

	# Subtitle
	var sub_label := Label.new()
	sub_label.text = info.get("subtitle", "")
	sub_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sub_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub_label.add_theme_font_size_override("font_size", 12)
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

	# Level Grid / Buttons (1 a 10 em 2 linhas)
	var lvl_box := VBoxContainer.new()
	lvl_box.add_theme_constant_override("separation", 3)

	var lvl_title := Label.new()
	lvl_title.text = "Escolher Fase (1 a 10):"
	lvl_title.add_theme_font_size_override("font_size", 11)
	lvl_title.add_theme_color_override("font_color", Color(0.65, 0.75, 0.85))
	lvl_box.add_child(lvl_title)

	var focus_st := _get_focus_style()

	var row1 := HBoxContainer.new()
	row1.alignment = BoxContainer.ALIGNMENT_CENTER
	row1.add_theme_constant_override("separation", 3)
	for i in range(5):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(28, 24)
		btn.focus_mode = Control.FOCUS_ALL
		btn.add_theme_stylebox_override("focus", focus_st)
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(grade, lvl_idx)
		)
		row1.add_child(btn)
	lvl_box.add_child(row1)

	var row2 := HBoxContainer.new()
	row2.alignment = BoxContainer.ALIGNMENT_CENTER
	row2.add_theme_constant_override("separation", 3)
	for i in range(5, 10):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(28, 24)
		btn.focus_mode = Control.FOCUS_ALL
		btn.add_theme_stylebox_override("focus", focus_st)
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(grade, lvl_idx)
		)
		row2.add_child(btn)
	lvl_box.add_child(row2)

	vbox.add_child(lvl_box)

	# Primary Play Battery Button
	var start_btn := Button.new()
	start_btn.text = "Jogar Bateria"
	start_btn.icon = preload("res://assets/icons/arrow_right.svg")
	start_btn.expand_icon = true
	start_btn.custom_minimum_size = Vector2(0, 32)
	start_btn.focus_mode = Control.FOCUS_ALL
	start_btn.add_theme_stylebox_override("focus", focus_st)
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

func _create_extra_challenges_card(info: Dictionary) -> PanelContainer:
	var card := PanelContainer.new()
	card.custom_minimum_size = Vector2(380, 410)
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var accent: Color = Color(0.2, 0.85, 0.85) # Ciano / Turquesa

	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.06, 0.15, 0.20, 0.95)
	style.border_width_left = 3
	style.border_width_top = 4
	style.border_width_right = 3
	style.border_width_bottom = 3
	style.border_color = accent
	style.set_corner_radius_all(8)
	style.shadow_size = 8
	style.shadow_color = Color(0.1, 0.4, 0.5, 0.4)
	card.add_theme_stylebox_override("panel", style)

	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 16)
	margin.add_theme_constant_override("margin_top", 12)
	margin.add_theme_constant_override("margin_right", 16)
	margin.add_theme_constant_override("margin_bottom", 12)
	card.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 6)
	margin.add_child(vbox)

	# Tag Badge
	var badge_box := PanelContainer.new()
	var b_style := StyleBoxFlat.new()
	b_style.bg_color = accent
	b_style.set_corner_radius_all(4)
	badge_box.add_theme_stylebox_override("panel", b_style)
	var b_label := Label.new()
	b_label.text = "💡 DESAFIOS EXTRAS"
	b_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	b_label.add_theme_font_size_override("font_size", 14)
	b_label.add_theme_color_override("font_color", Color.BLACK)
	badge_box.add_child(b_label)
	vbox.add_child(badge_box)

	# Subtitle
	var sub_label := Label.new()
	sub_label.text = "Lógica Computacional"
	sub_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sub_label.add_theme_font_size_override("font_size", 15)
	sub_label.add_theme_color_override("font_color", Color(0.6, 1.0, 1.0))
	vbox.add_child(sub_label)

	# Description
	var desc_label := Label.new()
	desc_label.text = "10 desafios práticos de pensamento computacional: algoritmos de rota, padrões recursivos, labirintos, tomada de decisão (Se... Então...), circuitos lógicos (AND / OR) com linguagem infantil, filtragem e depuração de instruções."
	desc_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	desc_label.add_theme_font_size_override("font_size", 11)
	desc_label.add_theme_color_override("font_color", Color(0.8, 0.92, 0.96))
	desc_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	vbox.add_child(desc_label)

	# Level Grid (1 a 10)
	var lvl_box := VBoxContainer.new()
	lvl_box.add_theme_constant_override("separation", 3)

	var lvl_title := Label.new()
	lvl_title.text = "Fases de Lógica (1 a 10):"
	lvl_title.add_theme_font_size_override("font_size", 11)
	lvl_title.add_theme_color_override("font_color", Color(0.5, 0.85, 0.95))
	lvl_box.add_child(lvl_title)

	var focus_st := _get_focus_style()

	var row1 := HBoxContainer.new()
	row1.alignment = BoxContainer.ALIGNMENT_CENTER
	row1.add_theme_constant_override("separation", 4)
	for i in range(5):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(32, 26)
		btn.focus_mode = Control.FOCUS_ALL
		btn.add_theme_stylebox_override("focus", focus_st)
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(6, lvl_idx)
		)
		row1.add_child(btn)
	lvl_box.add_child(row1)

	var row2 := HBoxContainer.new()
	row2.alignment = BoxContainer.ALIGNMENT_CENTER
	row2.add_theme_constant_override("separation", 4)
	for i in range(5, 10):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(32, 26)
		btn.focus_mode = Control.FOCUS_ALL
		btn.add_theme_stylebox_override("focus", focus_st)
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(6, lvl_idx)
		)
		row2.add_child(btn)
	lvl_box.add_child(row2)

	vbox.add_child(lvl_box)

	# Play Extra Button
	var start_btn := Button.new()
	start_btn.text = "Jogar Desafios de Lógica"
	start_btn.icon = preload("res://assets/icons/arrow_right.svg")
	start_btn.expand_icon = true
	start_btn.custom_minimum_size = Vector2(0, 34)
	start_btn.focus_mode = Control.FOCUS_ALL
	start_btn.add_theme_stylebox_override("focus", focus_st)
	var start_style := StyleBoxFlat.new()
	start_style.bg_color = accent.darkened(0.25)
	start_style.border_width_top = 1
	start_style.border_color = accent.lightened(0.3)
	start_style.set_corner_radius_all(6)
	start_btn.add_theme_stylebox_override("normal", start_style)
	start_btn.add_theme_color_override("font_color", Color.BLACK)
	start_btn.pressed.connect(func():
		SoundManager.play("click")
		close()
		grade_and_level_selected.emit(6, 0)
	)
	vbox.add_child(start_btn)

	return card

func _create_classic_card() -> PanelContainer:
	var card := PanelContainer.new()
	card.custom_minimum_size = Vector2(380, 410)
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var accent := Color(1.0, 0.8, 0.2) # Ouro

	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.14, 0.12, 0.06, 0.95)
	style.border_width_left = 3
	style.border_width_top = 4
	style.border_width_right = 3
	style.border_width_bottom = 3
	style.border_color = accent
	style.set_corner_radius_all(8)
	style.shadow_size = 8
	style.shadow_color = Color(0.5, 0.4, 0.1, 0.4)
	card.add_theme_stylebox_override("panel", style)

	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 16)
	margin.add_theme_constant_override("margin_top", 12)
	margin.add_theme_constant_override("margin_right", 16)
	margin.add_theme_constant_override("margin_bottom", 12)
	card.add_child(margin)

	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 6)
	margin.add_child(vbox)

	# Tag Badge
	var badge_box := PanelContainer.new()
	var b_style := StyleBoxFlat.new()
	b_style.bg_color = accent
	b_style.set_corner_radius_all(4)
	badge_box.add_theme_stylebox_override("panel", b_style)
	var b_label := Label.new()
	b_label.text = "🏆 MODO PRÊMIO"
	b_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	b_label.add_theme_font_size_override("font_size", 14)
	b_label.add_theme_color_override("font_color", Color.BLACK)
	badge_box.add_child(b_label)
	vbox.add_child(badge_box)

	# Subtitle
	var sub_label := Label.new()
	sub_label.text = "Sokoban Clássico"
	sub_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sub_label.add_theme_font_size_override("font_size", 15)
	sub_label.add_theme_color_override("font_color", Color(1.0, 0.95, 0.6))
	vbox.add_child(sub_label)

	# Description
	var desc_label := Label.new()
	desc_label.text = "Pura desobstrução espacial sem cálculos! 10 fases dinâmicas que mudam de formato e tema a cada partida, exercitando o planejamento passo a passo e o raciocínio de rotas."
	desc_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	desc_label.add_theme_font_size_override("font_size", 11)
	desc_label.add_theme_color_override("font_color", Color(0.9, 0.85, 0.75))
	desc_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	vbox.add_child(desc_label)

	# Level Grid (1 a 10)
	var lvl_box := VBoxContainer.new()
	lvl_box.add_theme_constant_override("separation", 3)

	var lvl_title := Label.new()
	lvl_title.text = "Fases Clássicas (1 a 10):"
	lvl_title.add_theme_font_size_override("font_size", 11)
	lvl_title.add_theme_color_override("font_color", Color(0.9, 0.8, 0.5))
	lvl_box.add_child(lvl_title)

	var focus_st := _get_focus_style()

	var row1 := HBoxContainer.new()
	row1.alignment = BoxContainer.ALIGNMENT_CENTER
	row1.add_theme_constant_override("separation", 4)
	for i in range(5):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(32, 26)
		btn.focus_mode = Control.FOCUS_ALL
		btn.add_theme_stylebox_override("focus", focus_st)
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(0, lvl_idx)
		)
		row1.add_child(btn)
	lvl_box.add_child(row1)

	var row2 := HBoxContainer.new()
	row2.alignment = BoxContainer.ALIGNMENT_CENTER
	row2.add_theme_constant_override("separation", 4)
	for i in range(5, 10):
		var btn := Button.new()
		btn.text = str(i + 1)
		btn.custom_minimum_size = Vector2(32, 26)
		btn.focus_mode = Control.FOCUS_ALL
		btn.add_theme_stylebox_override("focus", focus_st)
		var lvl_idx := i
		btn.pressed.connect(func():
			SoundManager.play("click")
			close()
			grade_and_level_selected.emit(0, lvl_idx)
		)
		row2.add_child(btn)
	lvl_box.add_child(row2)

	vbox.add_child(lvl_box)

	# Play Prize Button
	var start_btn := Button.new()
	start_btn.text = "Jogar Sokoban Clássico"
	start_btn.icon = preload("res://assets/icons/trophy.svg")
	start_btn.expand_icon = true
	start_btn.custom_minimum_size = Vector2(0, 34)
	start_btn.focus_mode = Control.FOCUS_ALL
	start_btn.add_theme_stylebox_override("focus", focus_st)
	var start_style := StyleBoxFlat.new()
	start_style.bg_color = accent.darkened(0.2)
	start_style.border_width_top = 1
	start_style.border_color = accent.lightened(0.3)
	start_style.set_corner_radius_all(6)
	start_btn.add_theme_stylebox_override("normal", start_style)
	start_btn.add_theme_color_override("font_color", Color.BLACK)
	start_btn.pressed.connect(func():
		SoundManager.play("win")
		close()
		grade_and_level_selected.emit(0, 0)
	)
	vbox.add_child(start_btn)

	return card
