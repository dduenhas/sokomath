class_name SokoVictoryModal
extends CanvasLayer

signal next_level_selected
signal retry_level_selected
signal grade_modal_selected
signal claim_prize_selected

@onready var title_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Title
@onready var level_name_label: Label = $CenterContainer/PanelContainer/Margin/VBox/LevelName
@onready var message_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Message
@onready var steps_label: Label = $CenterContainer/PanelContainer/Margin/VBox/StepsInfo
@onready var stars_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Stars
@onready var next_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/HBox/NextBtn
@onready var retry_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/HBox/RetryBtn
@onready var grade_select_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/HBox/GradeSelectBtn
@onready var claim_prize_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/HBox/ClaimPrizeBtn

func _ready() -> void:
	visible = false
	if next_btn:
		next_btn.pressed.connect(func():
			SoundManager.play("click")
			hide()
			next_level_selected.emit()
		)
	if retry_btn:
		retry_btn.pressed.connect(func():
			SoundManager.play("click")
			hide()
			retry_level_selected.emit()
		)
	if grade_select_btn:
		grade_select_btn.pressed.connect(func():
			SoundManager.play("click")
			hide()
			grade_modal_selected.emit()
		)
	if claim_prize_btn:
		claim_prize_btn.pressed.connect(func():
			SoundManager.play("win")
			hide()
			claim_prize_selected.emit()
		)

func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_SPACE or event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			if next_btn and next_btn.visible and not next_btn.disabled:
				get_viewport().set_input_as_handled()
				SoundManager.play("click")
				hide()
				next_level_selected.emit()
			elif claim_prize_btn and claim_prize_btn.visible and not claim_prize_btn.disabled:
				get_viewport().set_input_as_handled()
				SoundManager.play("win")
				hide()
				claim_prize_selected.emit()

func show_victory(level_dict: Dictionary, steps: int, is_final_grade_level: bool = false, grade: int = 1) -> void:
	var optimal: int = level_dict.get("optimal_steps", 20)
	var stars := 3
	if steps > optimal * 1.5:
		stars = 1
	elif steps > optimal * 1.2:
		stars = 2

	if level_name_label:
		level_name_label.text = level_dict.get("title", "")

	if steps_label:
		steps_label.text = "Passos executados: %d | Custo ótimo: %d" % [steps, optimal]

	if stars_label:
		var rating_str := "Excelente [ 3 / 3 ]" if stars == 3 else "Muito Bom [ 2 / 3 ]" if stars == 2 else "Bom [ 1 / 3 ]"
		stars_label.text = "Eficiência Algorítmica: %s" % rating_str

	var is_classic: bool = level_dict.get("is_classic", false)

	if message_label:
		if is_final_grade_level:
			if is_classic:
				message_label.text = "🏆 Mestre do Sokoban! Você completou as 10 fases dinâmicas do modo prêmio!"
			elif grade == 6:
				message_label.text = "💡 Mestre da Lógica! Você completou os 10 Desafios Extras de Pensamento Computacional!"
			else:
				message_label.text = "🎉 Parabéns! Você dominou todas as 10 fases pedagógicas deste ano letivo!"
		else:
			message_label.text = "Conceito consolidado: " + level_dict.get("bncc_code", "")

	if title_label:
		if is_final_grade_level:
			if is_classic:
				title_label.text = "🏆 Grande Prêmio Concluído!"
			elif grade == 6:
				title_label.text = "💡 Desafios Extras Concluídos!"
			elif grade >= 5:
				title_label.text = "🎓 Ensino Fundamental I Concluído!"
			else:
				title_label.text = "🎉 Parabéns! %dº Ano Concluído!" % grade
		else:
			title_label.text = "Desafio Concluído!"

	# Configura botões dependendo de ser final de ano letivo ou fase normal
	if is_final_grade_level:
		if next_btn:
			next_btn.visible = false
		if retry_btn:
			retry_btn.visible = true
			retry_btn.text = " Jogar Novamente"
		if grade_select_btn:
			grade_select_btn.visible = true
		if claim_prize_btn:
			claim_prize_btn.visible = not is_classic
	else:
		if next_btn:
			next_btn.visible = true
			next_btn.text = " Próxima Fase (Espaço)"
		if retry_btn:
			retry_btn.visible = true
			retry_btn.text = " Repetir Fase"
		if grade_select_btn:
			grade_select_btn.visible = false
		if claim_prize_btn:
			claim_prize_btn.visible = false

	show()
	if next_btn and next_btn.visible:
		next_btn.grab_focus()
