extends SceneTree

func _init() -> void:
	print("==================================================")
	print("  TESTE COMPLETO: SokoMath - Readequação Curricular")
	print("==================================================")

	# 1. Test LevelData grades
	var grades := LevelData.get_grades()
	assert(grades.size() == 5, "Deveriam existir 5 anos na trilha principal")
	print("[OK] 5 anos curriculares registrados na trilha principal: ", grades)

	# 2. Test Grade Info for all 6 categories (1 to 5 + 6 Extra)
	for g in range(1, 7):
		var info: Dictionary = LevelData.get_grade_info(g)
		assert(info.has("name") and info.has("subtitle") and info.has("description"), "Dados incompletos no ano %d" % g)
		print("[OK] Categoria %d: '%s' | Subtítulo: '%s'" % [g, info.get("name"), info.get("subtitle")])

	# 3. Test All 60 Level Instances
	var total_tested := 0
	for g in range(1, 6):
		for lvl_idx in range(10):
			var lvl: Dictionary = LevelData.get_level_instance(g, lvl_idx)
			assert(lvl.get("grade") == g, "Grade mismatch no ano %d fase %d" % [g, lvl_idx])
			assert(lvl.get("level_index") == lvl_idx, "Index mismatch")
			assert(lvl.has("walls") and lvl.has("crates") and lvl.has("plates"), "Estrutura incompleta")
			total_tested += 1

	for lvl_idx in range(10):
		var lvl_extra: Dictionary = LevelData.get_level_instance(6, lvl_idx)
		assert(lvl_extra.get("grade") == 6, "Grade mismatch no extra fase %d" % lvl_idx)
		assert(lvl_extra.get("level_index") == lvl_idx, "Index mismatch no extra")
		total_tested += 1

	print("[OK] Total de fases validadas em LevelData: %d fases (50 curriculares + 10 extras)" % total_tested)

	# 4. Test GradeSelectModal instantiation and building
	var modal_scene: PackedScene = load("res://scenes/ui/grade_select_modal.tscn")
	assert(modal_scene != null, "Falha ao carregar cena do modal de seleção")
	var modal_node: SokoGradeSelectModal = modal_scene.instantiate()
	root.add_child(modal_node)
	modal_node.open(1)
	assert(modal_node._current_mode == SokoGradeSelectModal.ViewMode.CURRICULAR, "Modo inicial deveria ser CURRICULAR")
	print("[OK] GradeSelectModal aberto em modo CURRICULAR com sucesso")

	modal_node._switch_mode(SokoGradeSelectModal.ViewMode.EXTRA)
	assert(modal_node._current_mode == SokoGradeSelectModal.ViewMode.EXTRA, "Modo deveria alternar para EXTRA")
	print("[OK] GradeSelectModal alternado para modo EXTRA com sucesso")

	modal_node.close()
	modal_node.queue_free()

	print("==================================================")
	print("  TODOS OS TESTES DE ENGINE PASSARAM COM SUCESSO! ")
	print("==================================================")
	quit(0)
