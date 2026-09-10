class_name SokoVictoryModal
extends CanvasLayer

signal next_level_selected
signal retry_level_selected

@onready var title_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Title
@onready var level_name_label: Label = $CenterContainer/PanelContainer/Margin/VBox/LevelName
@onready var message_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Message
@onready var steps_label: Label = $CenterContainer/PanelContainer/Margin/VBox/StepsInfo
@onready var stars_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Stars
@onready var next_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/HBox/NextBtn
@onready var retry_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/HBox/RetryBtn

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

	if message_label:
		message_label.text = "Conceito consolidado: " + level_dict.get("bncc_code", "")

	if title_label:
		if is_final_grade_level:
			if grade >= 5:
				title_label.text = "Ensino Fundamental I Concluído!"
			else:
				title_label.text = "%dº Ano Concluído com Sucesso!" % grade
		else:
			title_label.text = "Desafio Concluído!"

	if next_btn:
		if is_final_grade_level:
			if grade >= 5:
				next_btn.text = " Concluir e Escolher Ano"
			else:
				next_btn.text = " Avançar para o %dº Ano" % (grade + 1)
		else:
			next_btn.text = " Próxima Fase"

	show()
