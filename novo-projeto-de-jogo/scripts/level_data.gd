class_name LevelData
extends RefCounted

# =============================================================
# ESTRUTURA CURRICULAR DO ENSINO FUNDAMENTAL I (1º AO 5º ANO)
# E MODALIDADE COMPLEMENTAR: DESAFIOS EXTRAS (LÓGICA COMPUTACIONAL)
# Alinhado à BNCC e Currículo Paulista de Matemática & BNCC Computação
# Total: 60 fases (50 curriculares de Matemática + 10 Desafios Extras)
# =============================================================

const LEVELS_PER_GRADE: int = 10

static func get_grades() -> Array[int]:
	return [1, 2, 3, 4, 5]

static func get_grade_info(grade: int) -> Dictionary:
	match grade:
		1:
			return {
				"grade": 1,
				"name": "1º Ano",
				"age": "6 a 7 anos",
				"subtitle": "Contagem, Comparação e Sequências",
				"description": "Contagem, correspondência um a um, ordenação, padrões simples e problemas visuais de juntar e retirar.",
				"accent_color": Color(0.2, 0.75, 0.45) # Verde Esmeralda
			}
		2:
			return {
				"grade": 2,
				"name": "2º Ano",
				"age": "7 a 8 anos",
				"subtitle": "Comparação, Composição e Padrões",
				"description": "Números, maior/menor/igual, pares e ímpares, adição, subtração e sequências com regularidades.",
				"accent_color": Color(0.25, 0.65, 0.95) # Azul Celeste
			}
		3:
			return {
				"grade": 3,
				"name": "3º Ano",
				"age": "8 a 9 anos",
				"subtitle": "Operações e Regularidades",
				"description": "Adição, subtração, multiplicação, divisão em situações-problema e sequências numéricas.",
				"accent_color": Color(0.95, 0.55, 0.2) # Laranja Âmbar
			}
		4:
			return {
				"grade": 4,
				"name": "4º Ano",
				"age": "9 a 10 anos",
				"subtitle": "Operações, Frações e Medidas",
				"description": "Problemas com as quatro operações, multiplicação e divisão, frações unitárias, medidas, perímetro e dados.",
				"accent_color": Color(0.7, 0.4, 0.95) # Roxo / Violeta
			}
		5:
			return {
				"grade": 5,
				"name": "5º Ano",
				"age": "10 a 11 anos",
				"subtitle": "Frações, Decimais e Problemas",
				"description": "Frações, números decimais, porcentagens, proporcionalidade, medidas, gráficos e problemas com as quatro operações.",
				"accent_color": Color(0.95, 0.75, 0.2) # Dourado
			}
		6:
			return {
				"grade": 6,
				"name": "Desafios Extras",
				"age": "Livre",
				"subtitle": "Lógica Computacional",
				"description": "Desafios complementares de pensamento computacional: algoritmos, labirintos, circuitos e tomada de decisão.",
				"accent_color": Color(0.2, 0.85, 0.85) # Ciano / Turquesa
			}
		_:
			return get_grade_info(1)

static func get_level_count(_grade: int = 1) -> int:
	return LEVELS_PER_GRADE

static func get_level_instance(grade_or_idx: int = 1, level_idx: int = -1) -> Dictionary:
	var g: int = 1
	var idx: int = 0
	if level_idx == -1:
		g = 1
		idx = clampi(grade_or_idx, 0, LEVELS_PER_GRADE - 1)
	else:
		g = clampi(grade_or_idx, 1, 6)
		idx = clampi(level_idx, 0, LEVELS_PER_GRADE - 1)

	match g:
		1:
			match idx:
				0: return _level_g1_1()
				1: return _level_g1_2()
				2: return _level_g1_3()
				3: return _level_g1_4()
				4: return _level_g1_5()
				5: return _level_g1_6()
				6: return _level_g1_7()
				7: return _level_g1_8()
				8: return _level_g1_9()
				9: return _level_g1_10()
		2:
			match idx:
				0: return _level_g2_1()
				1: return _level_g2_2()
				2: return _level_g2_3()
				3: return _level_g2_4()
				4: return _level_g2_5()
				5: return _level_g2_6()
				6: return _level_g2_7()
				7: return _level_g2_8()
				8: return _level_g2_9()
				9: return _level_g2_10()
		3:
			match idx:
				0: return _level_g3_1()
				1: return _level_g3_2()
				2: return _level_g3_3()
				3: return _level_g3_4()
				4: return _level_g3_5()
				5: return _level_g3_6()
				6: return _level_g3_7()
				7: return _level_g3_8()
				8: return _level_g3_9()
				9: return _level_g3_10()
		4:
			match idx:
				0: return _level_g4_1()
				1: return _level_g4_2()
				2: return _level_g4_3()
				3: return _level_g4_4()
				4: return _level_g4_5()
				5: return _level_g4_6()
				6: return _level_g4_7()
				7: return _level_g4_8()
				8: return _level_g4_9()
				9: return _level_g4_10()
		5:
			match idx:
				0: return _level_g5_1()
				1: return _level_g5_2()
				2: return _level_g5_3()
				3: return _level_g5_4()
				4: return _level_g5_5()
				5: return _level_g5_6()
				6: return _level_g5_7()
				7: return _level_g5_8()
				8: return _level_g5_9()
				9: return _level_g5_10()
		6:
			match idx:
				0: return _level_extra_1()
				1: return _level_extra_2()
				2: return _level_extra_3()
				3: return _level_extra_4()
				4: return _level_extra_5()
				5: return _level_extra_6()
				6: return _level_extra_7()
				7: return _level_extra_8()
				8: return _level_extra_9()
				9: return _level_extra_10()

	return _level_g1_1()

static func _level_g1_1() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 0,
		"title": "1º Ano - Fase 1: Contagem de Objetos",
		"bncc_code": "EF01MA01 / EF01MA04 - Contagem e Leitura de Números Naturais",
		"bncc_desc": "Desenvolve a contagem de elementos em coleções pequenas e o registro numérico correspondente.",
		"rule_description": "Conte quantas caixas estão na sala (1, 2 e 3) e encaixe no sensor a caixa com o número correspondente a esse total.",
		"rule_type": "TARGET_PLATES",
		"target_value": 3,
		"optimal_steps": 10,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 3), "val": 3, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 5), "val": 1, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 2), "val": 2, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "Total = 3", "id": "p1"}
		],
		"status_format": "3 caixas contadas com sucesso! Caminho liberado!"
	}

static func _level_g1_2() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 1,
		"title": "1º Ano - Fase 2: Correspondência Um a Um",
		"bncc_code": "EF01MA02 - Correspondência Um a Um entre Coleções",
		"bncc_desc": "Estimula o pareamento biunívoco, associando cada elemento de uma coleção ao seu respectivo receptor.",
		"rule_description": "Cada caixa tem seu lugar reservado: pareie cada caixa com o sensor que possui a mesma numeração.",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Vaga 1", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "Vaga 2", "id": "p2"}
		],
		"status_format": "Correspondência 1 a 1 completada com sucesso!"
	}

static func _level_g1_3() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 2,
		"title": "1º Ano - Fase 3: Comparação de Quantidades",
		"bncc_code": "EF01MA03 - Estimar e Comparar Quantidades (Mais e Menos)",
		"bncc_desc": "Exercita a comparação de grandezas discretas para identificar onde há maior quantidade de unidades.",
		"rule_description": "Compare as caixas disponíveis. Qual delas representa a MAIOR quantidade de unidades? Encaixe-a no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 5,
		"optimal_steps": 12,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 5, "label": "Maior Valor", "id": "p1"}
		],
		"status_format": "5 é maior que 2! O sensor reconheceu a maior quantidade!"
	}

static func _level_g1_4() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 3,
		"title": "1º Ano - Fase 4: Ordem e Posição (O Número Entre)",
		"bncc_code": "EF01MA01 - Ordem, Posição e Sucessão Numérica",
		"bncc_desc": "Trabalha noções de ordenação posicional e localização relativa (primeiro, entre e depois).",
		"rule_description": "Na sequência numérica de 1 a 3, qual número fica exatamente no meio (entre 1 e 3)? Encaixe-o no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 3), "val": 2, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 5), "val": 4, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "Entre 1 e 3", "id": "p1"}
		],
		"status_format": "O número 2 fica entre 1 e 3 na sequência numérica!"
	}

static func _level_g1_5() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 4,
		"title": "1º Ano - Fase 5: Ordenação Crescente",
		"bncc_code": "EF01MA01 / EF01MA10 - Sequência Numérica e Ordenação Crescente",
		"bncc_desc": "Desenvolve a capacidade de ordenar elementos segundo critérios numéricos crescentes (do menor para o maior).",
		"rule_description": "Organize as caixas nos três sensores em ordem crescente, partindo do menor para o maior.",
		"rule_type": "ORDER_ASCENDING",
		"target_value": 3,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1º lugar", "id": "ord_1"},
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2º lugar", "id": "ord_2"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "3º lugar", "id": "ord_3"}
		],
		"status_format": "Ordem crescente 1, 2, 3 organizada com sucesso!"
	}

static func _level_g1_6() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 5,
		"title": "1º Ano - Fase 6: Padrões e Regularidades",
		"bncc_code": "EF01MA09 / EF01MA10 - Padrões de Repetição e Regularidades",
		"bncc_desc": "Estimula o reconhecimento de regularidades em sequências repetitivas com atributos de cores e materiais.",
		"rule_description": "Observe a sequência: Azul, Madeira, Azul... Descubra qual caixa mantém a regularidade e complete a fila.",
		"rule_type": "TARGET_PLATES",
		"target_value": 1,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 3, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Próximo Padrão", "id": "p_pat"}
		],
		"status_format": "Padrão completado: Azul, Madeira, Azul, Madeira!"
	}

static func _level_g1_7() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 6,
		"title": "1º Ano - Fase 7: Sequência Numérica (+1)",
		"bncc_code": "EF01MA10 - Sequências Recursivas Simples (+1)",
		"bncc_desc": "Trabalha a ideia de sucessor imediato na contagem natural de números.",
		"rule_description": "Seguindo os passos da contagem 2, 3, 4... Qual é o próximo número sucessor (+1)? Encaixe no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 5,
		"optimal_steps": 13,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 5, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 5, "label": "Sucessor (+1)", "id": "p1"}
		],
		"status_format": "2, 3, 4 e 5! Contagem sucessiva correta!"
	}

static func _level_g1_8() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 7,
		"title": "1º Ano - Fase 8: Juntar Quantidades",
		"bncc_code": "EF01MA06 / EF01MA08 - Problemas de Juntar e Adição Concreta",
		"bncc_desc": "Desenvolve a noção concreta de adição como união e agrupamento de duas coleções.",
		"rule_description": "Junte duas caixas nos sensores que somadas atinjam exatamente a meta de 5 unidades.",
		"rule_type": "SUM_EQUALS",
		"target_value": 5,
		"optimal_steps": 16,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parcela A", "id": "s1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parcela B", "id": "s2"}
		],
		"status_format": "2 + 3 = 5 unidades! Quantidades reunidas com sucesso!"
	}

static func _level_g1_9() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 8,
		"title": "1º Ano - Fase 9: Retirar e Separar",
		"bncc_code": "EF01MA08 - Problemas de Separar e Retirar (Subtração Concreta)",
		"bncc_desc": "Exercita o significado subtrativo de retirar uma quantidade de um grupo inicial.",
		"rule_description": "Em uma brincadeira havia 5 blocos e 2 foram guardados na caixa. Quantos blocos restaram? Encaixe a sobra no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 3,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "5 - 2 = ?", "id": "p1"}
		],
		"status_format": "5 retirando 2 resultam em 3 brinquedos!"
	}

static func _level_g1_10() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 9,
		"title": "1º Ano - Fase 10: Desafio Integrador",
		"bncc_code": "EF01MA01 / EF01MA06 / EF01MA08 - Síntese de Contagem e Composição",
		"bncc_desc": "Integra os conhecimentos de contagem, comparação e composição de números do 1º ano.",
		"rule_description": "Desafio final: encontre o par de caixas que juntas completam a meta de 6 unidades para abrir o portão.",
		"rule_type": "SUM_EQUALS",
		"target_value": 6,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 1, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parte 1", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parte 2", "id": "p2"}
		],
		"status_format": "4 + 2 = 6! Bateria do 1º Ano concluída com êxito!"
	}

static func _level_g2_1() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 0,
		"title": "2º Ano - Fase 1: Ordenação de Dezenas",
		"bncc_code": "EF02MA01 - Comparar e Ordenar Números Naturais",
		"bncc_desc": "Desenvolve a compreensão posicional e a ordenação de dezenas exatas no sistema decimal.",
		"rule_description": "Organize as dezenas nos três sensores em ordem crescente (do menor para o maior).",
		"rule_type": "ORDER_ASCENDING",
		"target_value": 30,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 30, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 10, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 20, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 10, "label": "1º (Menor)", "id": "ord_1"},
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 20, "label": "2º (Médio)", "id": "ord_2"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 30, "label": "3º (Maior)", "id": "ord_3"}
		],
		"status_format": "Dezenas ordenadas: 10 -> 20 -> 30!"
	}

static func _level_g2_2() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 1,
		"title": "2º Ano - Fase 2: Comparação de Números (>)",
		"bncc_code": "EF02MA01 - Relações de Ordem e Desigualdade",
		"bncc_desc": "Estimula o julgamento relacional de ordem e desigualdade numérica através do símbolo de maior que (>).",
		"rule_description": "O sensor exige um número MAIOR que 15 (> 15). Analise as opções e encaixe a caixa adequada.",
		"rule_type": "CONDITION_SINGLE",
		"target_value": 15,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 18, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 9, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.GREATER_THAN, "val": 15, "label": "> 15", "id": "p1"}
		],
		"status_format": "18 é maior que 15! Condição satisfeita!"
	}

static func _level_g2_3() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 2,
		"title": "2º Ano - Fase 3: Reta Numérica",
		"bncc_code": "EF02MA01 - Localização de Números Naturais na Reta Numérica",
		"bncc_desc": "Exercita a localização de números na reta numérica respeitando a escala dos intervalos.",
		"rule_description": "Observe a sequência na reta numérica: 10, 20, [ ? ], 40. Descubra o número que falta e encaixe-o no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 30,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 30, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 25, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 35, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 30, "label": "10, 20, ?, 40", "id": "p1"}
		],
		"status_format": "10, 20, 30, 40: reta numérica completada!"
	}

static func _level_g2_4() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 3,
		"title": "2º Ano - Fase 4: Composição de Números",
		"bncc_code": "EF02MA01 / EF02MA05 - Composição e Decomposição de Números Naturais",
		"bncc_desc": "Compreensão da estrutura decimal por meio da decomposição aditiva de dezenas e unidades.",
		"rule_description": "Componha o número 25 agrupando dezenas inteiras e unidades nas placas receptoras.",
		"rule_type": "SUM_EQUALS",
		"target_value": 25,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 20, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 10, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dezenas", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Unidades", "id": "p2"}
		],
		"status_format": "20 + 5 = 25! Número composto corretamente!"
	}

static func _level_g2_5() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 4,
		"title": "2º Ano - Fase 5: Adição e Cálculo Mental",
		"bncc_code": "EF02MA05 - Fatos Básicos da Adição e Cálculo Mental",
		"bncc_desc": "Desenvolve estratégias de cálculo mental com fatos fundamentais da adição.",
		"rule_description": "Descubra quais duas caixas disponíveis somadas alcançam exatamente a meta de 15 unidades.",
		"rule_type": "SUM_EQUALS",
		"target_value": 15,
		"optimal_steps": 16,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 9, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Termo A", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Termo B", "id": "p2"}
		],
		"status_format": "8 + 7 = 15! Meta atingida com cálculo mental!"
	}

static func _level_g2_6() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 5,
		"title": "2º Ano - Fase 6: Subtração e Completar",
		"bncc_code": "EF02MA06 - Subtração com Significado de Completar",
		"bncc_desc": "Exercita o raciocínio subtrativo no sentido de quanto falta para completar uma quantia alvo.",
		"rule_description": "Você já tem 6 pontos e precisa alcançar a meta de 14. Quantos pontos faltam para completar? Encaixe a diferença.",
		"rule_type": "TARGET_PLATES",
		"target_value": 8,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 7, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 8, "label": "6 + ? = 14", "id": "p1"}
		],
		"status_format": "14 - 6 = 8. Faltavam 8 pontos para a meta!"
	}

static func _level_g2_7() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 6,
		"title": "2º Ano - Fase 7: Complementos para 100",
		"bncc_code": "EF02MA05 - Composição de Centenas e Complementos",
		"bncc_desc": "Estimula a identificação de complementos de dezenas para o fechamento da centena (100).",
		"rule_description": "Encontre o par de caixas que juntas somam exatamente uma centena inteira (100) e posicione-as nos sensores.",
		"rule_type": "SUM_EQUALS",
		"target_value": 100,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 60, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 40, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 30, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parcela A", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parcela B", "id": "p2"}
		],
		"status_format": "60 + 40 = 100! Centena inteira completada!"
	}

static func _level_g2_8() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 7,
		"title": "2º Ano - Fase 8: Pares e Ímpares",
		"bncc_code": "EF02MA08 - Identificação de Números Pares e Ímpares",
		"bncc_desc": "Desenvolve o conceito de paridade associando à formação de pares sem sobras.",
		"rule_description": "Separe as caixas pela paridade: posicione o número PAR na placa azul e o número ÍMPAR na placa verde.",
		"rule_type": "CONDITIONAL_EVEN_ODD",
		"target_value": 0,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 9, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "Sensor PAR", "id": "p_even"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ODD, "val": 0, "label": "Sensor ÍMPAR", "id": "p_odd"}
		],
		"status_format": "4 é Par e 7 é Ímpar! Paridade classificada com sucesso!"
	}

static func _level_g2_9() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 8,
		"title": "2º Ano - Fase 9: Sequências com Regularidades (+5)",
		"bncc_code": "EF02MA09 - Sequências Recursivas de Saltos (+5)",
		"bncc_desc": "Estimula o cálculo de padrões recursivos com adições sucessivas de 5 em 5.",
		"rule_description": "Observe a regularidade dos saltos: 5, 10, 15, [ ? ]. Encontre o próximo número da sequência e encaixe no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 20,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 20, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 25, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 18, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 20, "label": "Próximo (+5)", "id": "p1"}
		],
		"status_format": "5, 10, 15, 20: sequência de 5 em 5 completada!"
	}

static func _level_g2_10() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 9,
		"title": "2º Ano - Fase 10: Desafio Integrador",
		"bncc_code": "EF02MA01 / EF02MA06 - Resolução de Problemas Integrados",
		"bncc_desc": "Aplica a leitura e resolução de problemas integrando estratégias de cálculo do 2º ano.",
		"rule_description": "Em uma gincana escolar, a turma marcou 12 pontos pela manhã e 8 pontos à tarde. Encaixe os dois valores para totalizar a pontuação.",
		"rule_type": "SUM_EQUALS",
		"target_value": 20,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 15, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Manhã", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Tarde", "id": "p2"}
		],
		"status_format": "12 + 8 = 20 pontos! Bateria do 2º Ano finalizada!"
	}

static func _level_g3_1() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 0,
		"title": "3º Ano - Fase 1: Adição e Decomposição",
		"bncc_code": "EF03MA05 - Procedimentos de Cálculo Mental e Adição",
		"bncc_desc": "Estimula estratégias de cálculo mental por decomposição em dezenas e unidades.",
		"rule_description": "Encontre duas caixas que, somadas por decomposição, atinjam exatamente a meta de 40 unidades.",
		"rule_type": "SUM_EQUALS",
		"target_value": 40,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 25, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 15, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 20, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parcela A", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Parcela B", "id": "p2"}
		],
		"status_format": "25 + 15 = 40! Estratégia de decomposição concluída!"
	}

static func _level_g3_2() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 1,
		"title": "3º Ano - Fase 2: Subtração Contextualizada",
		"bncc_code": "EF03MA06 - Problemas de Subtração Significativos",
		"bncc_desc": "Aplica a subtração em contexto de controle de estoque sem imposição de terminologia técnica.",
		"rule_description": "Um feirante tinha 50 caixas de frutas no estoque e vendeu 18 pela manhã. Quantas caixas restaram? Encaixe o resultado no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 32,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 32, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 38, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 28, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 32, "label": "50 - 18 = ?", "id": "p1"}
		],
		"status_format": "50 - 18 = 32 caixas restantes no estoque!"
	}

static func _level_g3_3() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 2,
		"title": "3º Ano - Fase 3: Multiplicação (Parcelas Iguais)",
		"bncc_code": "EF03MA07 / EF03MA08 - Multiplicação como Adição de Parcelas Iguais",
		"bncc_desc": "Introduz a multiplicação como simplificação da adição sucessiva de parcelas iguais.",
		"rule_description": "Você tem 3 grupos contendo 4 caixas cada um (4 + 4 + 4). Posicione os dois fatores nas placas para calcular o produto total.",
		"rule_type": "MULTIPLICATION",
		"target_value": 12,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Grupos", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Itens/grupo", "id": "p2"}
		],
		"status_format": "3 x 4 = 12! Parcelas iguais multiplicadas com sucesso!"
	}

static func _level_g3_4() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 3,
		"title": "3º Ano - Fase 4: Arranjo Retangular",
		"bncc_code": "EF03MA08 - Multiplicação em Disposição Retangular",
		"bncc_desc": "Explora a visualização espacial da multiplicação por linhas e colunas em arranjos retangulares.",
		"rule_description": "Uma horta possui 3 fileiras com 5 canteiros cada. Posicione as caixas correspondentes às linhas e colunas para calcular o total.",
		"rule_type": "MULTIPLICATION",
		"target_value": 15,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 6, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Linhas", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Colunas", "id": "p2"}
		],
		"status_format": "3 x 5 = 15 canteiros no arranjo retangular!"
	}

static func _level_g3_5() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 4,
		"title": "3º Ano - Fase 5: Fatos Básicos da Multiplicação",
		"bncc_code": "EF03MA07 - Fatos Básicos da Multiplicação (Tabuada)",
		"bncc_desc": "Consolida a memorização compreensiva dos fatos da multiplicação de 4 e 5.",
		"rule_description": "Descubra qual par de fatores produz exatamente o valor 20 e posicione as duas caixas nos sensores.",
		"rule_type": "MULTIPLICATION",
		"target_value": 20,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 3, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator 1", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator 2", "id": "p2"}
		],
		"status_format": "4 x 5 = 20! Fatos básicos memorizados!"
	}

static func _level_g3_6() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 5,
		"title": "3º Ano - Fase 6: Divisão (Repartição Equitativa)",
		"bncc_code": "EF03MA09 - Divisão como Repartição Equitativa",
		"bncc_desc": "Desenvolve o raciocínio divisório de partilha em quantidades rigorosamente iguais.",
		"rule_description": "18 figurinhas foram divididas igualmente entre 3 amigos. Quantas figurinhas cada amigo recebeu? Encaixe a resposta no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 6,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 9, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "18 ÷ 3 = ?", "id": "p1"}
		],
		"status_format": "Cada amigo recebeu exatamente 6 figurinhas!"
	}

static func _level_g3_7() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 6,
		"title": "3º Ano - Fase 7: Divisão (Quantos Cabem)",
		"bncc_code": "EF03MA09 - Divisão com Significado de Medida",
		"bncc_desc": "Trabalha a divisão com a ideia de medição: descobrir quantas vezes um grupo cabe no todo.",
		"rule_description": "Quantos grupos completos de 4 alunos podem ser formados em uma turma com 24 alunos? Encaixe a quantidade no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 6,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "24 ÷ 4 = ?", "id": "p1"}
		],
		"status_format": "Cabem exatamente 6 grupos de 4 alunos!"
	}

static func _level_g3_8() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 7,
		"title": "3º Ano - Fase 8: Metade e Terça Parte",
		"bncc_code": "EF03MA07 / EF03MA09 - Relação entre Divisão e Frações Iniciais",
		"bncc_desc": "Conecta a operação de divisão aos conceitos iniciais de frações usuais (metade e terça parte).",
		"rule_description": "Calcule a metade de 16 e a terça parte (1/3) de 15. Encaixe as respostas correspondentes em cada sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 0,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 8, "label": "Metade de 16", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 5, "label": "1/3 de 15", "id": "p2"}
		],
		"status_format": "Metade (8) e Terça Parte (5) ativadas com sucesso!"
	}

static func _level_g3_9() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 8,
		"title": "3º Ano - Fase 9: Sequências por Saltos (+4)",
		"bncc_code": "EF03MA10 - Sequências Ordenadas por Adições Sucessivas",
		"bncc_desc": "Identifica a lei de formação de sequências numéricas recursivas em progressão aritmética.",
		"rule_description": "Identifique o padrão de saltos regulares 4, 8, 12... e complete a sequência posicionando os dois próximos números.",
		"rule_type": "SEQUENCE_PA",
		"target_value": 4,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 16, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 20, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 14, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 16, "label": "4º termo (+4)", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 20, "label": "5º termo (+4)", "id": "p2"}
		],
		"status_format": "Sequência 4, 8, 12, 16, 20 completada!"
	}

static func _level_g3_10() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 9,
		"title": "3º Ano - Fase 10: Desafio Integrador",
		"bncc_code": "EF03MA05 / EF03MA08 - Problema Prático com Multiplicação",
		"bncc_desc": "Integra a resolução de problemas práticos que envolvem multiplicação de valores.",
		"rule_description": "Uma papelaria vende estojos por 4 moedas cada. Uma escola comprou 6 estojos. Encaixe os fatores para calcular o custo total.",
		"rule_type": "MULTIPLICATION",
		"target_value": 24,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 3, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Estojos", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Preço/estojo", "id": "p2"}
		],
		"status_format": "4 x 6 = 24 moedas! Bateria do 3º Ano concluída!"
	}

static func _level_g4_1() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 0,
		"title": "4º Ano - Fase 1: Operações com Centenas",
		"bncc_code": "EF04MA03 - Adição e Subtração com Números Maiores",
		"bncc_desc": "Desenvolve procedimentos de cálculo mental com centenas em contextos do cotidiano.",
		"rule_description": "Uma campanha arrecadou 150 kg de mantimentos no sábado e 250 kg no domingo. Posicione os valores para calcular a soma total.",
		"rule_type": "SUM_EQUALS",
		"target_value": 400,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 150, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 250, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 200, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Sábado", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Domingo", "id": "p2"}
		],
		"status_format": "150 + 250 = 400 kg arrecadados no fim de semana!"
	}

static func _level_g4_2() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 1,
		"title": "4º Ano - Fase 2: Multiplicação Contextualizada",
		"bncc_code": "EF04MA05 / EF04MA06 - Significados da Multiplicação",
		"bncc_desc": "Aplica a multiplicação na resolução de problemas de transporte e proporcionalidade.",
		"rule_description": "8 vans escolares transportam exatamente 6 estudantes cada uma. Posicione os fatores para calcular o total de passageiros.",
		"rule_type": "MULTIPLICATION",
		"target_value": 48,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 7, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Qtd Vans", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Alunos/van", "id": "p2"}
		],
		"status_format": "8 x 6 = 48 estudantes transportados com segurança!"
	}

static func _level_g4_3() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 2,
		"title": "4º Ano - Fase 3: Divisão e Resto",
		"bncc_code": "EF04MA07 - Divisão e Interpretação do Resto",
		"bncc_desc": "Estimula a compreensão do significado do resto na divisão não exata de números naturais.",
		"rule_description": "15 livros foram embalados em pacotes de 4 unidades cada. Quantos livros SOBRARAM no resto da divisão? Encaixe a sobra no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 3,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "Resto de 15 ÷ 4", "id": "p1"}
		],
		"status_format": "15 ÷ 4 = 3 pacotes com resto 3! Resto identificado com sucesso!"
	}

static func _level_g4_4() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 3,
		"title": "4º Ano - Fase 4: Operações Inversas",
		"bncc_code": "EF04MA04 - Relações Inversas entre Multiplicação e Divisão",
		"bncc_desc": "Desenvolve a flexibilidade de cálculo através das relações inversas entre multiplicar e dividir.",
		"rule_description": "Sabendo que 7 x 6 = 42, utilize a operação inversa para determinar quanto é 42 ÷ 6 e encaixe a resposta no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 7,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 7, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 6, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 7, "label": "42 ÷ 6 = ?", "id": "p1"}
		],
		"status_format": "Operação inversa: se 7 x 6 = 42, então 42 ÷ 6 = 7!"
	}

static func _level_g4_5() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 4,
		"title": "4º Ano - Fase 5: Cálculo Mental e Estimativa",
		"bncc_code": "EF04MA03 / EF04MA05 - Estimativas e Fatores",
		"bncc_desc": "Estimula o cálculo mental na busca por fatores multiplicativos que resultem em uma centena exata.",
		"rule_description": "Descubra qual par de fatores das caixas disponíveis, quando multiplicados, atinge exatamente a meta de 100.",
		"rule_type": "MULTIPLICATION",
		"target_value": 100,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 25, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator A", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator B", "id": "p2"}
		],
		"status_format": "4 x 25 = 100! Meta atingida com estimativa e cálculo mental!"
	}

static func _level_g4_6() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 5,
		"title": "4º Ano - Fase 6: Frações Unitárias",
		"bncc_code": "EF04MA09 - Frações Unitárias como Unidades de Medida",
		"bncc_desc": "Trabalha a ideia de fração unitária (1/4) aplicada a um conjunto discreto de objetos.",
		"rule_description": "Uma torta inteira foi dividida em 8 fatias iguais. Quantas fatias correspondem a 1/4 da torta? Encaixe a resposta no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 3, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "1/4 de 8 fatias", "id": "p1"}
		],
		"status_format": "1/4 de 8 fatias = 2 fatias! Fração unitária calculada!"
	}

static func _level_g4_7() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 6,
		"title": "4º Ano - Fase 7: Perímetro de Figuras",
		"bncc_code": "EF04MA20 - Medição e Cálculo de Perímetro",
		"bncc_desc": "Desenvolve a noção geométrica de perímetro como medida do comprimento do contorno de uma figura.",
		"rule_description": "Calcule o perímetro (medida do contorno) de um canteiro retangular de 4 metros de comprimento por 3 metros de largura. Encaixe a medida total no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 14,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 14, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 12, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 7, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 14, "label": "Perímetro (4m x 3m)", "id": "p1"}
		],
		"status_format": "Perímetro calculado: 4 + 3 + 4 + 3 = 14 metros!"
	}

static func _level_g4_8() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 7,
		"title": "4º Ano - Fase 8: Área em Malha Quadriculada",
		"bncc_code": "EF04MA21 - Área por Contagem de Quadradinhos",
		"bncc_desc": "Ensina a medição de superfície de figuras planas através do preenchimento e contagem de quadradinhos na malha.",
		"rule_description": "Uma sala retangular ocupa 5 quadradinhos de largura por 3 quadradinhos de altura na malha. Calcule a área total em quadradinhos e encaixe no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 15,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 15, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 18, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 15, "label": "Área (5 x 3)", "id": "p1"}
		],
		"status_format": "Área total da sala: 15 unidades quadradas!"
	}

static func _level_g4_9() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 8,
		"title": "4º Ano - Fase 9: Leitura de Gráficos e Tabelas",
		"bncc_code": "EF04MA27 - Leitura e Interpretação de Dados Estatísticos",
		"bncc_desc": "Desenvolve a interpretação e a comparação de grandezas expressas em gráficos de colunas.",
		"rule_description": "O gráfico de pontuação indica que o Time A marcou 18 pontos e o Time B marcou 12 pontos. Quantos pontos a mais fez o Time A? Encaixe a diferença.",
		"rule_type": "TARGET_PLATES",
		"target_value": 6,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "Diferença de pontos", "id": "p1"}
		],
		"status_format": "Diferença lida no gráfico: 18 - 12 = 6 pontos!"
	}

static func _level_g4_10() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 9,
		"title": "4º Ano - Fase 10: Desafio Integrador",
		"bncc_code": "EF04MA06 / EF04MA20 - Geometria e Multiplicação Integradas",
		"bncc_desc": "Integra conceitos de perímetro de polígonos regulares à operação multiplicativa.",
		"rule_description": "Uma quadra esportiva em formato de quadrado mede 6 metros em cada lado. Posicione a quantidade de lados e a medida para calcular o perímetro total.",
		"rule_type": "MULTIPLICATION",
		"target_value": 24,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Lados iguais", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Metros/lado", "id": "p2"}
		],
		"status_format": "4 lados x 6m = 24m de perímetro! Bateria do 4º Ano finalizada!"
	}

static func _level_g5_1() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 0,
		"title": "5º Ano - Fase 1: Valor Posicional",
		"bncc_code": "EF05MA01 - Leitura, Escrita e Decomposição de Números Maiores",
		"bncc_desc": "Desenvolve a compreensão do valor relativo dos algarismos em números naturais de várias ordens.",
		"rule_description": "Componha o número 345 posicionando a centena e a soma de dezenas com unidades nos sensores.",
		"rule_type": "SUM_EQUALS",
		"target_value": 345,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 300, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 45, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 40, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Centena", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dezena e Unidade", "id": "p2"}
		],
		"status_format": "300 + 45 = 345! Número composto por valor posicional!"
	}

static func _level_g5_2() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 1,
		"title": "5º Ano - Fase 2: Frações de uma Quantidade",
		"bncc_code": "EF05MA03 - Fração como Parte do Todo e Resultado de Divisão",
		"bncc_desc": "Exercita o cálculo de frações de quantidades discretas dividindo pelo denominador e multiplicando pelo numerador.",
		"rule_description": "Uma caixa contém 20 bombons no total. Encontre a quantidade equivalente a 3/4 desse total e encaixe a caixa correspondente no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 15,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 15, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 10, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 15, "label": "3/4 de 20 bombons", "id": "p1"}
		],
		"status_format": "3/4 de 20 bombons = 15 bombons! Fração de quantidade resolvida com sucesso!"
	}

static func _level_g5_3() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 2,
		"title": "5º Ano - Fase 3: Comparação de Frações",
		"bncc_code": "EF05MA03 - Comparação de Frações com Referenciais",
		"bncc_desc": "Estimula a comparação de frações com denominadores distintos através de referenciais concretos.",
		"rule_description": "Em uma barra dividida em 8 pedaços iguais, compare as frações 1/2 e 1/4. Descubra quantos pedaços possui a MAIOR dessas frações e encaixe no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 4,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 1, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 4, "label": "Maior: 1/2 ou 1/4?", "id": "p1"}
		],
		"status_format": "1/2 (4 pedaços) é maior que 1/4 (2 pedaços)!"
	}

static func _level_g5_4() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 3,
		"title": "5º Ano - Fase 4: Frações Equivalentes",
		"bncc_code": "EF05MA04 - Identificação de Frações Equivalentes",
		"bncc_desc": "Desenvolve a compreensão de que frações equivalentes representam a mesmíssima proporção do todo.",
		"rule_description": "Uma barra de chocolate tem 12 pedaços. Encontre a quantidade de pedaços correspondente à fração equivalente a 2/4 (metade) e encaixe no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 6,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "2/4 de 12 pedaços", "id": "p1"}
		],
		"status_format": "Frações equivalentes: 2/4 = 1/2 = 6 pedaços!"
	}

static func _level_g5_5() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 4,
		"title": "5º Ano - Fase 5: Decimais no Sistema Monetário",
		"bncc_code": "EF05MA02 / EF05MA07 - Decimais e Sistema Monetário",
		"bncc_desc": "Aplica números racionais na representação decimal em compras e trocas monetárias.",
		"rule_description": "Você comprou um lanche de R$ 2,50 e um suco de R$ 1,50. Encaixe os valores em centavos de cada item nos sensores para totalizar a conta.",
		"rule_type": "SUM_EQUALS",
		"target_value": 400,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 250, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 150, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 100, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Lanche", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Suco", "id": "p2"}
		],
		"status_format": "R$ 2,50 + R$ 1,50 = R$ 4,00 (400 centavos)!"
	}

static func _level_g5_6() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 5,
		"title": "5º Ano - Fase 6: Subtração de Decimais (Troco)",
		"bncc_code": "EF05MA07 - Subtração com Números Decimais",
		"bncc_desc": "Desenvolve a capacidade de calcular troco no sistema monetário por meio da subtração de decimais.",
		"rule_description": "Você realizou uma compra de R$ 6,50 e pagou com uma nota de R$ 10,00. Calcule o troco exato (em centavos) e encaixe a resposta no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 350,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 350, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 450, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 250, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 350, "label": "Troco de R$ 10,00", "id": "p1"}
		],
		"status_format": "Troco correto: R$ 10,00 - R$ 6,50 = R$ 3,50 (350 centavos)!"
	}

static func _level_g5_7() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 6,
		"title": "5º Ano - Fase 7: Porcentagens Usuais",
		"bncc_code": "EF05MA06 - Associação de Porcentagens Usuais (50% = Metade)",
		"bncc_desc": "Associa porcentagens de referência (50%) à metade de uma grandeza.",
		"rule_description": "Uma loja está oferecendo 50% de desconto em um livro que custa R$ 60,00. Calcule o valor em reais do desconto e encaixe no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 30,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 30, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 15, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 20, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 30, "label": "50% de R$ 60,00", "id": "p1"}
		],
		"status_format": "50% de R$ 60,00 = metade = R$ 30,00 de desconto!"
	}

static func _level_g5_8() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 7,
		"title": "5º Ano - Fase 8: Proporcionalidade Direta",
		"bncc_code": "EF05MA12 - Problemas de Proporcionalidade Direta",
		"bncc_desc": "Exercita o pensamento proporcional direto entre duas grandezas correlacionadas.",
		"rule_description": "Se 1 pacote contém 5 figurinhas, quantas figurinhas haverá em 6 pacotes? Posicione os fatores correspondentes para calcular a proporção.",
		"rule_type": "MULTIPLICATION",
		"target_value": 30,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Pacotes", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Figurinhas/pct", "id": "p2"}
		],
		"status_format": "6 pacotes x 5 figurinhas = 30 figurinhas no total!"
	}

static func _level_g5_9() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 8,
		"title": "5º Ano - Fase 9: Cálculo de Área Retangular",
		"bncc_code": "EF05MA20 - Medição de Área e Perímetro",
		"bncc_desc": "Aplica a fórmula do produto das dimensões lineares para a determinação da área de retângulos.",
		"rule_description": "Um pátio escolar mede 6 metros de comprimento por 2 metros de largura. Posicione as medidas das dimensões nas placas para calcular a área total.",
		"rule_type": "MULTIPLICATION",
		"target_value": 12,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Comprimento", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Largura", "id": "p2"}
		],
		"status_format": "6m x 2m = 12 m² de área retangular!"
	}

static func _level_g5_10() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 9,
		"title": "5º Ano - Fase 10: Desafio Integrador",
		"bncc_code": "EF05MA07 / EF05MA15 - Síntese de Gráficos e Resolução de Problemas",
		"bncc_desc": "Integra leitura de dados estatísticos com cálculo e resolução de problemas no término do EF I.",
		"rule_description": "Uma pesquisa registrou 12 votos na segunda-feira e o dobro desse valor na terça-feira. Posicione as duas quantidades para totalizar os votos.",
		"rule_type": "SUM_EQUALS",
		"target_value": 36,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 24, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 18, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Segunda-feira", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Terça-feira", "id": "p2"}
		],
		"status_format": "12 + 24 = 36 votos! Ensino Fundamental I concluído com excelência!"
	}

static func _level_extra_1() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 0,
		"title": "Desafio Extra 1: Algoritmos e Sequência de Passos",
		"bncc_code": "Pensamento Computacional - Decomposição e Algoritmos",
		"bncc_desc": "Exercita o planejamento antecipado de ações para evitar bloqueios irreversíveis no cenário.",
		"rule_description": "Planeje a sequência correta de empurrões para guiar a caixa pelo corredor estreito até o sensor sem encurralá-la.",
		"rule_type": "TARGET_PLATES",
		"target_value": 1,
		"optimal_steps": 12,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(0, 1), Vector2i(8, 1), Vector2i(0, 2), Vector2i(8, 2), Vector2i(0, 3), Vector2i(8, 3),
			Vector2i(0, 4), Vector2i(8, 4), Vector2i(0, 5), Vector2i(8, 5), Vector2i(4, 2), Vector2i(4, 4)
		],
		"crates": [
			{"pos": Vector2i(3, 3), "val": 1, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Receptor", "id": "p1"}
		],
		"status_format": "Algoritmo de passos executado com sucesso!"
	}

static func _level_extra_2() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 1,
		"title": "Desafio Extra 2: Padrões Recursivos",
		"bncc_code": "Pensamento Computacional - Reconhecimento de Padrões",
		"bncc_desc": "Estimula a dedução indutiva de regularidades lógicas em sequências numéricas recursivas.",
		"rule_description": "Descubra a regularidade da sequência lógica: 3, 6, 9, [ ? ]. Encontre o próximo termo recursivo e encaixe-o no sensor.",
		"rule_type": "TARGET_PLATES",
		"target_value": 12,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 15, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 10, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 12, "label": "Próximo (+3)", "id": "p1"}
		],
		"status_format": "Padrão recursivo 3, 6, 9, 12 completado!"
	}

static func _level_extra_3() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 2,
		"title": "Desafio Extra 3: Labirinto e Orientação Espacial",
		"bncc_code": "Pensamento Computacional - Raciocínio Lógico-Espacial",
		"bncc_desc": "Desenvolve a capacidade de resolução de problemas de labirinto e manobra com restrição de espaço.",
		"rule_description": "Navegue pelo labirinto e manobre as duas caixas pelas curvas até encaixá-las em seus nichos de destino.",
		"rule_type": "TARGET_PLATES",
		"target_value": 0,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 7), Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7),
			Vector2i(4, 0), Vector2i(4, 7), Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7),
			Vector2i(8, 0), Vector2i(8, 7), Vector2i(9, 0), Vector2i(9, 7), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5), Vector2i(0, 6), Vector2i(9, 6),
			Vector2i(5, 3), Vector2i(5, 4)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 5), "val": 2, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Nicho Norte", "id": "p1"},
			{"pos": Vector2i(6, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Nicho Sul", "id": "p2"}
		]
	}

static func _level_extra_4() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 3,
		"title": "Desafio Extra 4: Condicionais (Se... Então...)",
		"bncc_code": "Pensamento Computacional - Estruturas Condicionais (IF/ELSE)",
		"bncc_desc": "Ensina a estrutura de controle condicional básica de decisão computacional (SE / SENÃO).",
		"rule_description": "Tomada de decisão: SE o valor for PAR, direcione ao sensor azul; SE for ÍMPAR, direcione ao sensor verde.",
		"rule_type": "CONDITIONAL_EVEN_ODD",
		"target_value": 0,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "Se for PAR", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ODD, "val": 0, "label": "Se for ÍMPAR", "id": "p2"}
		]
	}

static func _level_extra_5() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 4,
		"title": "Desafio Extra 5: Circuito Lógico AND",
		"bncc_code": "Pensamento Computacional - Lógica Booleana Combinatória (AND)",
		"bncc_desc": "Apresenta a conjunção lógica booleana onde a saída só é ativada se ambas as entradas forem verdadeiras.",
		"rule_description": "Circuito E (AND): o portal só abre quando AMBAS as placas de entrada estiverem ativadas com o sinal 1 ao mesmo tempo.",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 0, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Entrada A", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Entrada B", "id": "p2"}
		],
		"status_format": "Circuito AND: 1 E 1 = Porta energizada com sucesso!"
	}

static func _level_extra_6() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 5,
		"title": "Desafio Extra 6: Circuito Lógico OR",
		"bncc_code": "Pensamento Computacional - Lógica Booleana Disjuntiva (OR)",
		"bncc_desc": "Introduz a disjunção lógica booleana onde basta uma das entradas estar ativa para liberar a saída.",
		"rule_description": "Circuito OU (OR): basta energizar pelo menos UMA das entradas com o sinal 1 para abrir a passagem.",
		"rule_type": "LOGIC_OR",
		"target_value": 1,
		"optimal_steps": 14,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 0, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Canal A", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Canal B", "id": "p2"}
		],
		"status_format": "Circuito OR: energia liberada por canal alternativo!"
	}

static func _level_extra_7() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 6,
		"title": "Desafio Extra 7: Classificação e Filtragem",
		"bncc_code": "Pensamento Computacional - Filtros e Classificação Lógica",
		"bncc_desc": "Exercita a filtragem de dados que satisfaçam múltiplos predicados lógicos simultaneamente.",
		"rule_description": "Filtro lógico: encontre entre as caixas aquela que cumpre ambas as condições simultaneamente: ser um número PAR e ser MAIOR QUE 10.",
		"rule_type": "TARGET_PLATES",
		"target_value": 12,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "red", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 9, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 12, "label": "Par & > 10", "id": "p1"}
		],
		"status_format": "12 é PAR e MAIOR que 10! Filtro aprovado!"
	}

static func _level_extra_8() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 7,
		"title": "Desafio Extra 8: Depuração (Debugging)",
		"bncc_code": "Pensamento Computacional - Autodepuração de Erros (Debugging)",
		"bncc_desc": "Desenvolve a competência de inspecionar estados, detectar incompatibilidades e depurar instruções com falhas.",
		"rule_description": "O sensor requer um número PAR para destravar o circuito, mas uma caixa ímpar está no caminho. Identifique a caixa par correta e encaixe-a no sensor.",
		"rule_type": "CONDITION_SINGLE",
		"target_value": 0,
		"optimal_steps": 15,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 7, "theme": "red", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "Sensor Par", "id": "p1"}
		],
		"status_format": "Falha depurada! Caixa par (6) ativou o sensor com sucesso!"
	}

static func _level_extra_9() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 8,
		"title": "Desafio Extra 9: Circuitos Combinados",
		"bncc_code": "Pensamento Computacional - Circuitos Lógicos Integrados",
		"bncc_desc": "Estimula a sincronização lógica de múltiplas variáveis em sistemas computacionais interdependentes.",
		"rule_description": "Circuito integrado: conecte os dois sinais lógicos de controle nas chaves de entrada para acionar a saída.",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 17,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 6), Vector2i(1, 0), Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6),
			Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0), Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6),
			Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0), Vector2i(9, 6), Vector2i(0, 1), Vector2i(9, 1), Vector2i(0, 2), Vector2i(9, 2),
			Vector2i(0, 3), Vector2i(9, 3), Vector2i(0, 4), Vector2i(9, 4), Vector2i(0, 5), Vector2i(9, 5)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "blue", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "wood", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Chave 1", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Chave 2", "id": "p2"}
		],
		"status_format": "Circuito integrado ativado com sinais combinados!"
	}

static func _level_extra_10() -> Dictionary:
	return {
		"grade": 6,
		"level_index": 9,
		"title": "Desafio Extra 10: O Grande Desafio Lógico",
		"bncc_code": "Pensamento Computacional - Otimização e Síntese de Algoritmos",
		"bncc_desc": "Sintetiza todos os eixos do pensamento computacional: planejamento ordenado, lógica de alvos e menor custo de passos.",
		"rule_description": "Desafio Mestre: organize as caixas nos alvos na ordem crescente das estações (1º -> 2º -> 3º) sem obstruir corredores.",
		"rule_type": "ORDER_ASCENDING",
		"target_value": 3,
		"optimal_steps": 22,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 7), Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7),
			Vector2i(4, 0), Vector2i(4, 7), Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7),
			Vector2i(8, 0), Vector2i(8, 7), Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 7), Vector2i(0, 1), Vector2i(10, 1),
			Vector2i(0, 2), Vector2i(10, 2), Vector2i(0, 3), Vector2i(10, 3), Vector2i(0, 4), Vector2i(10, 4), Vector2i(0, 5), Vector2i(10, 5),
			Vector2i(0, 6), Vector2i(10, 6), Vector2i(5, 3)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "red", "show_badge": true},
			{"pos": Vector2i(4, 5), "val": 1, "theme": "wood", "show_badge": true},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "blue", "show_badge": true}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "Estação 1", "id": "p1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "Estação 2", "id": "p2"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "Estação 3", "id": "p3"}
		],
		"status_format": "Parabéns! Desafio Mestre de Lógica Computacional superado!"
	}
