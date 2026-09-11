class_name LevelData
extends RefCounted

# =============================================================
# ESTRUTURA CURRICULAR DO ENSINO FUNDAMENTAL I (1º AO 5º ANO)
# Alinhado à BNCC e BNCC Computação (Anos Iniciais)
# Total: 50 fases estruturadas (10 fases progressivas por ano)
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
				"subtitle": "Fundamentos Lógicos e Sequências",
				"description": "Contagem, correspondência de posições, ordenação simples (1, 2, 3), comparações diretas e pensamento sequencial sem bloqueios.",
				"accent_color": Color(0.2, 0.75, 0.45) # Verde Esmeralda
			}
		2:
			return {
				"grade": 2,
				"name": "2º Ano",
				"age": "7 a 8 anos",
				"subtitle": "Paridade, Comparações e Somas Iniciais",
				"description": "Números pares e ímpares, comparações relacionais (> e <), saltos recursivos (+2, +3) e somas de fechamento elementares.",
				"accent_color": Color(0.25, 0.65, 0.95) # Azul Celeste
			}
		3:
			return {
				"grade": 3,
				"name": "3º Ano",
				"age": "8 a 9 anos",
				"subtitle": "Operações Inversas, Saltos e Decisões",
				"description": "Adições estruturadas, subtrações (minuendo e subtraendo), sequências com saltos (+PA), multiplicação inicial e decisões lógicas combinadas.",
				"accent_color": Color(0.95, 0.55, 0.2) # Laranja Âmbar
			}
		4:
			return {
				"grade": 4,
				"name": "4º Ano",
				"age": "9 a 10 anos",
				"subtitle": "Multiplicação, Múltiplos e Portas Lógicas",
				"description": "Fatores e produto, identificação de múltiplos e divisores, operadores lógicos booleanos (AND e OR) e expressões matemáticas compostas.",
				"accent_color": Color(0.7, 0.4, 0.95) # Roxo / Violeta
			}
		5:
			return {
				"grade": 5,
				"name": "5º Ano",
				"age": "10 a 11 anos",
				"subtitle": "Expressões Algébricas, Médias e Precedência",
				"description": "Equações compostas (2A + B e (A+B)*C), critérios avançados de divisibilidade, circuitos lógicos combinados e médias aritméticas.",
				"accent_color": Color(0.95, 0.75, 0.2) # Dourado
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
		g = clampi(grade_or_idx, 1, 5)
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

	return _level_g1_1()

# 1º Ano - Fase 1: O Primeiro Passo
static func _level_g1_1() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 0,
		"title": "1º Ano - Fase 1: O Primeiro Passo",
		"bncc_code": "EF01MA04 / Computação: Algoritmos e Sequência de Passos",
		"bncc_desc": "Um algoritmo é uma sequência organizada de instruções. Empurre a caixa até a placa amarela para destravar a porta!",
		"rule_description": "Empurre a caixa com o número 1 até a placa amarela",
		"rule_type": "TARGET_PLATES",
		"target_value": 1,
		"optimal_steps": 10,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 3), "val": 1, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1", "id": "p1"}
		]
	}

# 1º Ano - Fase 2: Duas Instruções
static func _level_g1_2() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 1,
		"title": "1º Ano - Fase 2: Duas Instruções",
		"bncc_code": "EF01MA02 / Computação: Contagem e Correspondência",
		"bncc_desc": "Dois passos encadeados: leve cada caixa ao sensor correto com seu respectivo valor (1 e 2).",
		"rule_description": "Coloque a caixa 1 na placa 1 e a caixa 2 na placa 2",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2", "id": "p2"}
		]
	}

# 1º Ano - Fase 3: Sequência 1, 2, 3
static func _level_g1_3() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 2,
		"title": "1º Ano - Fase 3: Sequência 1, 2, 3",
		"bncc_code": "EF01MA10 / Computação: Listas Ordenadas e Sequenciamento",
		"bncc_desc": "Sequência natural dos números: organize as caixas nos sensores em ordem crescente (1º, 2º e 3º).",
		"rule_description": "Organize as caixas em ordem: 1º -> 2º -> 3º",
		"rule_type": "ORDER_ASCENDING",
		"target_value": 3,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0),
			Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "red"},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "wood"},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1º", "id": "ord_1"},
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2º", "id": "ord_2"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "3º", "id": "ord_3"}
		]
	}

# 1º Ano - Fase 4: Comparação (O Menor Número)
static func _level_g1_4() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 3,
		"title": "1º Ano - Fase 4: Comparação (O Menor Número)",
		"bncc_code": "EF01MA01 / Computação: Comparação e Seleção de Menor Valor (MIN)",
		"bncc_desc": "O algoritmo precisa do MENOR valor para seguir adiante. Compare as duas caixas e empurre a menor até o sensor.",
		"rule_description": "Leve a MENOR caixa até o sensor",
		"rule_type": "MINIMUM_VALUE",
		"target_value": 2,
		"optimal_steps": 12,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 5, "theme": "red"},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "green"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "MENOR", "id": "min_p"}
		]
	}

# 1º Ano - Fase 5: Planejando o Desvio
static func _level_g1_5() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 4,
		"title": "1º Ano - Fase 5: Planejando o Desvio",
		"bncc_code": "EF01MA04 / Computação: Decomposição e Navegação Espacial",
		"bncc_desc": "Desvio espacial: para levar a caixa ao sensor, contorne o obstáculo central sem ficar encurralado!",
		"rule_description": "Desvie do obstáculo e leve a caixa 5 até o sensor",
		"rule_type": "TARGET_PLATES",
		"target_value": 5,
		"optimal_steps": 16,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 2),
		"door_pos": Vector2i(7, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6), Vector2i(4, 3)
		],
		"crates": [
			{"pos": Vector2i(2, 3), "val": 5, "theme": "yellow"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 5, "label": "5", "id": "p5"}
		]
	}

# 1º Ano - Fase 6: Correspondência Biunívoca
static func _level_g1_6() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 5,
		"title": "1º Ano - Fase 6: Correspondência Biunívoca",
		"bncc_code": "EF01MA03 / Computação: Associação Chave-Valor",
		"bncc_desc": "Cada caixa possui um identificador único. Conecte cada caixa ao seu sensor correspondente!",
		"rule_description": "Associe cada número ao seu sensor respectivo",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0),
			Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "yellow"},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "green"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 4, "label": "4", "id": "corr_4"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 7, "label": "7", "id": "corr_7"}
		]
	}

# 1º Ano - Fase 7: Sequência Inversa (3, 2, 1)
static func _level_g1_7() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 6,
		"title": "1º Ano - Fase 7: Sequência Inversa (3, 2, 1)",
		"bncc_code": "EF01MA10 / Computação: Contagem Regressiva e Pilhas (LIFO)",
		"bncc_desc": "Contagem regressiva: posicione as caixas em ordem decrescente (3, 2 e 1) nos sensores de ativação.",
		"rule_description": "Complete a contagem regressiva: 3 -> 2 -> 1",
		"rule_type": "TARGET_PLATES",
		"target_value": 3,
		"optimal_steps": 20,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0),
			Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "red"},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "3", "id": "reg_3"},
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2", "id": "reg_2"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1", "id": "reg_1"}
		]
	}

# 1º Ano - Fase 8: O Maior Número (MAX)
static func _level_g1_8() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 7,
		"title": "1º Ano - Fase 8: O Maior Número (MAX)",
		"bncc_code": "EF01MA01 / Computação: Seleção de Máximo Valor (MAX)",
		"bncc_desc": "O sistema de abertura exige o MAIOR valor disponível. Compare as caixas e envie a maior para o sensor.",
		"rule_description": "Leve a MAIOR caixa até o sensor",
		"rule_type": "TARGET_PLATES",
		"target_value": 8,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 8, "label": "MAIOR", "id": "max_p"}
		]
	}

# 1º Ano - Fase 9: A Curva Estratégica
static func _level_g1_9() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 8,
		"title": "1º Ano - Fase 9: A Curva Estratégica",
		"bncc_code": "EF01MA04 / Computação: Planejamento de Rotas sem Retrocesso",
		"bncc_desc": "Planeje os passos para contornar a curva sem empurrar a caixa contra as paredes!",
		"rule_description": "Contorne a curva e leve a caixa 6 até o sensor",
		"rule_type": "TARGET_PLATES",
		"target_value": 6,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 2),
		"door_pos": Vector2i(8, 5),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7),
			Vector2i(5, 3)
		],
		"crates": [
			{"pos": Vector2i(3, 3), "val": 6, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "6", "id": "curv_6"}
		]
	}

# 1º Ano - Fase 10: Grande Desafio do 1º Ano
static func _level_g1_10() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 9,
		"title": "1º Ano - Fase 10: Grande Desafio do 1º Ano",
		"bncc_code": "EF01MA02 / Computação: Integração Algorítmica e Desafio Final",
		"bncc_desc": "Parabéns por chegar ao fim do 1º Ano! Posicione as 3 caixas fundamentais nos sensores correspondentes.",
		"rule_description": "Posicione as 3 caixas em seus respectivos sensores",
		"rule_type": "TARGET_PLATES",
		"target_value": 3,
		"optimal_steps": 22,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood"},
			{"pos": Vector2i(3, 5), "val": 2, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 3, "theme": "yellow"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1", "id": "fin1_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2", "id": "fin1_2"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "3", "id": "fin1_3"}
		]
	}

# 2º Ano - Fase 1: Detectando Números Pares
static func _level_g2_1() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 0,
		"title": "2º Ano - Fase 1: Detectando Números Pares",
		"bncc_code": "EF02MA01 / Computação: Classificação e Regras de Decisão",
		"bncc_desc": "Números pares podem ser divididos em duas partes iguais sem sobra (2, 4, 6, 8...). O sensor só aceita PAR!",
		"rule_description": "Coloque uma caixa com número PAR no sensor",
		"rule_type": "CONDITION_SINGLE",
		"target_value": 0,
		"optimal_steps": 12,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "PAR", "id": "even_p"}
		]
	}

# 2º Ano - Fase 2: O Sensor Maior que 4
static func _level_g2_2() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 1,
		"title": "2º Ano - Fase 2: O Sensor Maior que 4",
		"bncc_code": "EF02MA01 / Computação: Operadores Relacionais (SE > X)",
		"bncc_desc": "O sensor utiliza uma condição lógica de comparação: o número precisa ser MAIOR que 4 para ativar.",
		"rule_description": "Empurre para o sensor uma caixa com valor > 4",
		"rule_type": "CONDITION_SINGLE",
		"target_value": 4,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.GREATER_THAN, "val": 4, "label": "> 4", "id": "gt_p"}
		]
	}

# 2º Ano - Fase 3: Amigos do 10 (Soma = 10)
static func _level_g2_3() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 2,
		"title": "2º Ano - Fase 3: Amigos do 10 (Soma = 10)",
		"bncc_code": "EF02MA05 / Computação: Composição e Fatos Básicos da Adição",
		"bncc_desc": "Composição de 10: Encontre duas caixas que juntas somem 10 (A + B = 10) para energizar o circuito da porta.",
		"rule_description": "Posicione 2 caixas de forma que A + B = 10",
		"rule_type": "SUM_EQUALS",
		"target_value": 10,
		"optimal_steps": 16,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue"},
			{"pos": Vector2i(2, 3), "val": 3, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A", "id": "s_a"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "B", "id": "s_b"}
		]
	}

# 2º Ano - Fase 4: Pulo de 2 em 2
static func _level_g2_4() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 3,
		"title": "2º Ano - Fase 4: Pulo de 2 em 2",
		"bncc_code": "EF02MA09 / Computação: Padrões de Repetição e Passo Fixo (+2)",
		"bncc_desc": "Observe o padrão repetitivo: 2 -> 4 -> [ ? ]. Descubra o próximo número da sequência e coloque-o na placa!",
		"rule_description": "Complete a sequência (+2): 2 -> 4 -> [ ? ]",
		"rule_type": "TARGET_PLATES",
		"target_value": 6,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "beige"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "6", "id": "seq_p"}
		]
	}

# 2º Ano - Fase 5: Classificação Par e Ímpar
static func _level_g2_5() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 4,
		"title": "2º Ano - Fase 5: Classificação Par e Ímpar",
		"bncc_code": "EF02MA01 / Computação: Estruturas Condicionais Múltiplas",
		"bncc_desc": "Dois filtros: o Sensor 1 exige número PAR e o Sensor 2 exige número ÍMPAR. Organize as entradas corretas!",
		"rule_description": "Sensor 1: Número PAR | Sensor 2: Número ÍMPAR",
		"rule_type": "CONDITIONAL_EVEN_ODD",
		"target_value": 0,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 6), Vector2i(9, 0),
			Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "PAR", "id": "p_even"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ODD, "val": 0, "label": "ÍMPAR", "id": "p_odd"}
		]
	}

# 2º Ano - Fase 6: O Sensor Menor que 5
static func _level_g2_6() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 5,
		"title": "2º Ano - Fase 6: O Sensor Menor que 5",
		"bncc_code": "EF02MA01 / Computação: Operadores Relacionais (SE < X)",
		"bncc_desc": "Filtro de segurança: o sensor requer uma entrada com valor MENOR que 5. Escolha a caixa correta!",
		"rule_description": "Empurre para o sensor uma caixa com valor < 5",
		"rule_type": "CONDITION_SINGLE",
		"target_value": 5,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(1, 0),
			Vector2i(1, 6), Vector2i(2, 0), Vector2i(2, 6), Vector2i(3, 0), Vector2i(3, 6), Vector2i(4, 0), Vector2i(4, 6), Vector2i(5, 0),
			Vector2i(5, 6), Vector2i(6, 0), Vector2i(6, 6), Vector2i(7, 0), Vector2i(7, 6), Vector2i(8, 0), Vector2i(8, 1), Vector2i(8, 2),
			Vector2i(8, 3), Vector2i(8, 4), Vector2i(8, 5), Vector2i(8, 6)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "red"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "green"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.LESS_THAN, "val": 5, "label": "< 5", "id": "lt_p"}
		]
	}

# 2º Ano - Fase 7: Amigos do 15 (Soma = 15)
static func _level_g2_7() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 6,
		"title": "2º Ano - Fase 7: Amigos do 15 (Soma = 15)",
		"bncc_code": "EF02MA05 / Computação: Composição Numérica e Adição Algorítmica",
		"bncc_desc": "A porta requer uma soma exata de 15: combine as duas caixas certas nos sensores A e B.",
		"rule_description": "Combine 2 caixas para somar 15 (A + B = 15)",
		"rule_type": "SUM_EQUALS",
		"target_value": 15,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 7, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A", "id": "s15_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "B", "id": "s15_b"}
		]
	}

# 2º Ano - Fase 8: Pulo de 3 em 3 (+3)
static func _level_g2_8() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 7,
		"title": "2º Ano - Fase 8: Pulo de 3 em 3 (+3)",
		"bncc_code": "EF02MA09 / Computação: Sequências Numéricas Recursivas (+3)",
		"bncc_desc": "Identifique o passo de repetição: 3 -> 6 -> [ ? ]. Posicione o próximo termo da sequência no sensor.",
		"rule_description": "Complete a sequência (+3): 3 -> 6 -> [ ? ]",
		"rule_type": "TARGET_PLATES",
		"target_value": 9,
		"optimal_steps": 16,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 9, "theme": "green"},
			{"pos": Vector2i(3, 5), "val": 8, "theme": "beige"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 9, "label": "9", "id": "seq3_p"}
		]
	}

# 2º Ano - Fase 9: Filtro de Pares Duplos
static func _level_g2_9() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 8,
		"title": "2º Ano - Fase 9: Filtro de Pares Duplos",
		"bncc_code": "EF02MA01 / Computação: Validação de Múltiplos Critérios",
		"bncc_desc": "Ambos os sensores exigem números PARES. Filtre os números ímpares e ative os dois sensores!",
		"rule_description": "Ambos os sensores exigem número PAR",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 20,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "green"},
			{"pos": Vector2i(3, 5), "val": 6, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "red"},
			{"pos": Vector2i(4, 4), "val": 7, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "PAR", "id": "p_even1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "PAR", "id": "p_even2"}
		]
	}

# 2º Ano - Fase 10: Grande Desafio do 2º Ano
static func _level_g2_10() -> Dictionary:
	return {
		"grade": 2,
		"level_index": 9,
		"title": "2º Ano - Fase 10: Grande Desafio do 2º Ano",
		"bncc_code": "EF02MA05 / Computação: Integração Curricular de Adição e Paridade",
		"bncc_desc": "Parabéns por avançar! Encontre duas caixas que somem 20 (A + B = 20) evitando os bloqueios centrais.",
		"rule_description": "Posicione 2 caixas para somar 20 (A + B = 20)",
		"rule_type": "SUM_EQUALS",
		"target_value": 20,
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7), Vector2i(6, 3)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "blue"},
			{"pos": Vector2i(3, 5), "val": 8, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 9, "theme": "wood"},
			{"pos": Vector2i(4, 4), "val": 15, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(8, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A", "id": "s20_a"},
			{"pos": Vector2i(8, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "B", "id": "s20_b"}
		]
	}

# 3º Ano - Fase 1: Adição com Três Parcelas
static func _level_g3_1() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 0,
		"title": "3º Ano - Fase 1: Adição com Três Parcelas",
		"bncc_code": "EF03MA05 / Computação: Acumuladores e Somatórios",
		"bncc_desc": "Três parcelas somadas: encontre três caixas que juntas somem 15 (A + B + C = 15) para ligar o circuito.",
		"rule_description": "Posicione 3 caixas de forma que A + B + C = 15",
		"rule_type": "SUM_EQUALS",
		"target_value": 15,
		"optimal_steps": 22,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 6, "theme": "green"},
			{"pos": Vector2i(4, 5), "val": 3, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A", "id": "s3_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "B", "id": "s3_2"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "C", "id": "s3_3"}
		]
	}

# 3º Ano - Fase 2: Operação Inversa (Subtração)
static func _level_g3_2() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 1,
		"title": "3º Ano - Fase 2: Operação Inversa (Subtração)",
		"bncc_code": "EF03MA06 / Computação: Operações Inversas e Desfazimento",
		"bncc_desc": "A subtração desfaz a adição: posicione Minuendo e Subtraendo para obter a diferença 4 (A - B = 4).",
		"rule_description": "Posicione 2 caixas de forma que [A] - [B] = 4",
		"rule_type": "SUBTRACTION",
		"target_value": 4,
		"optimal_steps": 20,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 9, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 5, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Minuendo (A)", "id": "sub_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Subtraendo (B)", "id": "sub_b"}
		]
	}

# 3º Ano - Fase 3: Sequência de Saltos (+4)
static func _level_g3_3() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 2,
		"title": "3º Ano - Fase 3: Sequência de Saltos (+4)",
		"bncc_code": "EF03MA10 / Computação: Regularidades e Iterações de Laço",
		"bncc_desc": "Identifique a regra recursiva da sequência: 2 -> 6 -> [ ? ] -> [ ? ]. Posicione os dois próximos números!",
		"rule_description": "Complete a sequência (+4): 2 -> 6 -> [ ? ] -> [ ? ]",
		"rule_type": "SEQUENCE_PA",
		"target_value": 4,
		"seq_start": [2, 6],
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 10, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 14, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 12, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 10, "label": "3º Termo (10)", "id": "seq_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 14, "label": "4º Termo (14)", "id": "seq_2"}
		]
	}

# 3º Ano - Fase 4: Condicionais (PAR e > 5)
static func _level_g3_4() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 3,
		"title": "3º Ano - Fase 4: Condicionais (PAR e > 5)",
		"bncc_code": "EF03MA01 / Computação: Estruturas de Decisão Lógica (IF / ELSE)",
		"bncc_desc": "O Sensor 1 exige número PAR. O Sensor 2 exige número MAIOR que 5. Analise as caixas disponíveis!",
		"rule_description": "Sensor 1: Número PAR | Sensor 2: Número > 5",
		"rule_type": "CONDITIONAL_DUAL",
		"target_value": 5,
		"optimal_steps": 22,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 7, "theme": "red"},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "blue"},
			{"pos": Vector2i(4, 5), "val": 3, "theme": "beige"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "IF PAR", "id": "cond_even"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.GREATER_THAN, "val": 5, "label": "IF > 5", "id": "cond_gt"}
		]
	}

# 3º Ano - Fase 5: Planejamento e Decomposição
static func _level_g3_5() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 4,
		"title": "3º Ano - Fase 5: Planejamento e Decomposição",
		"bncc_code": "EF03MA05 / Computação: Decomposição e Prevenção de Bloqueios",
		"bncc_desc": "Planeje a ordem em que empurra as caixas para somar 15 sem bloquear a passagem do corredor!",
		"rule_description": "Empurre 2 caixas até os sensores para somar 15",
		"rule_type": "SUM_EQUALS",
		"target_value": 15,
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 7, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot 1", "id": "p_a"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot 2", "id": "p_b"}
		]
	}

# 3º Ano - Fase 6: Multiplicação como Adição Repetida
static func _level_g3_6() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 5,
		"title": "3º Ano - Fase 6: Multiplicação como Adição Repetida",
		"bncc_code": "EF03MA07 / Computação: Laços de Repetição e Multiplicação",
		"bncc_desc": "Multiplicar é somar parcelas iguais (3 x 3 = 3 + 3 + 3 = 9). Posicione três caixas de valor 3 para totalizar 9!",
		"rule_description": "Posicione 3 caixas de valor 3 (3 x 3 = 9)",
		"rule_type": "SUM_EQUALS",
		"target_value": 9,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "yellow"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "yellow"},
			{"pos": Vector2i(4, 3), "val": 3, "theme": "yellow"},
			{"pos": Vector2i(4, 5), "val": 2, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "3", "id": "m_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "+3", "id": "m_2"},
			{"pos": Vector2i(8, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "+3", "id": "m_3"}
		]
	}

# 3º Ano - Fase 7: Divisibilidade por 3
static func _level_g3_7() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 6,
		"title": "3º Ano - Fase 7: Divisibilidade por 3",
		"bncc_code": "EF03MA08 / Computação: Filtros de Múltiplos e Módulos",
		"bncc_desc": "Os dois sensores exigem números que pertençam à tabuada do 3 (múltiplos de 3). Separe os corretos!",
		"rule_description": "Coloque múltiplos de 3 em ambos os sensores",
		"rule_type": "DIVISIBILITY",
		"target_value": 3,
		"optimal_steps": 22,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 9, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 7, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 5, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 3", "id": "div3_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 3", "id": "div3_2"}
		]
	}

# 3º Ano - Fase 8: Saltos Decrescentes (-3)
static func _level_g3_8() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 7,
		"title": "3º Ano - Fase 8: Saltos Decrescentes (-3)",
		"bncc_code": "EF03MA10 / Computação: Decremento em Laços e Contagem Reversa",
		"bncc_desc": "Identifique a regularidade decrescente: 15 -> 12 -> [ ? ] -> [ ? ]. Complete com os dois termos seguintes!",
		"rule_description": "Complete a sequência (-3): 15 -> 12 -> [ ? ] -> [ ? ]",
		"rule_type": "SEQUENCE_PA",
		"target_value": 3,
		"seq_start": [15, 12],
		"seq_op": "-3",
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 9, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 8, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 9, "label": "Termo 3 (9)", "id": "dec_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 6, "label": "Termo 4 (6)", "id": "dec_2"}
		]
	}

# 3º Ano - Fase 9: Filtro Lógico Duplo (ÍMPAR e > 6)
static func _level_g3_9() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 8,
		"title": "3º Ano - Fase 9: Filtro Lógico Duplo (ÍMPAR e > 6)",
		"bncc_code": "EF03MA01 / Computação: Conjunção de Critérios Lógicos",
		"bncc_desc": "O Sensor 1 exige número ÍMPAR e o Sensor 2 exige número MAIOR que 6. Faça a triagem exata!",
		"rule_description": "Sensor 1: ÍMPAR | Sensor 2: Maior que 6",
		"rule_type": "CONDITIONAL_DUAL",
		"target_value": 6,
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 5, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 9, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "red"},
			{"pos": Vector2i(4, 5), "val": 6, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ODD, "val": 0, "label": "ÍMPAR", "id": "f_odd"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.GREATER_THAN, "val": 6, "label": "> 6", "id": "f_gt6"}
		]
	}

# 3º Ano - Fase 10: Grande Desafio do 3º Ano
static func _level_g3_10() -> Dictionary:
	return {
		"grade": 3,
		"level_index": 9,
		"title": "3º Ano - Fase 10: Grande Desafio do 3º Ano",
		"bncc_code": "EF03MA05 / Computação: Integração Curricular do 3º Ano",
		"bncc_desc": "Parabéns por concluir o 3º Ano! Encontre três caixas que somem 18 (A + B + C = 18) desviando dos pilares.",
		"rule_description": "Posicione 3 caixas para somar 18 (A + B + C = 18)",
		"rule_type": "SUM_EQUALS",
		"target_value": 18,
		"optimal_steps": 28,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7), Vector2i(6, 3)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue"},
			{"pos": Vector2i(3, 5), "val": 7, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "yellow"},
			{"pos": Vector2i(4, 4), "val": 4, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(8, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot A", "id": "fin3_1"},
			{"pos": Vector2i(8, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot B", "id": "fin3_2"},
			{"pos": Vector2i(8, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot C", "id": "fin3_3"}
		]
	}

# 4º Ano - Fase 1: Fatores e Produto (A * B = 12)
static func _level_g4_1() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 0,
		"title": "4º Ano - Fase 1: Fatores e Produto (A * B = 12)",
		"bncc_code": "EF04MA04 / Computação: Operações Aritméticas e Fatores",
		"bncc_desc": "Multiplicação: Encontre dois fatores cujo produto seja exatamente 12 ([A] * [B] = 12).",
		"rule_description": "Posicione 2 caixas de forma que [A] * [B] = 12",
		"rule_type": "MULTIPLICATION",
		"target_value": 12,
		"optimal_steps": 20,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 2, "theme": "yellow"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator A", "id": "fact_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator B", "id": "fact_b"}
		]
	}

# 4º Ano - Fase 2: Múltiplos e Divisores (Divisível por 4)
static func _level_g4_2() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 1,
		"title": "4º Ano - Fase 2: Múltiplos e Divisores (Divisível por 4)",
		"bncc_code": "EF04MA05 / Computação: Filtros por Operador Módulo",
		"bncc_desc": "Identifique os múltiplos de 4: apenas números perfeitamente divisíveis por 4 ativam os sensores!",
		"rule_description": "Posicione caixas que sejam múltiplos de 4",
		"rule_type": "DIVISIBILITY",
		"target_value": 4,
		"optimal_steps": 22,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 12, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 10, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 14, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 4", "id": "m4_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 4", "id": "m4_2"}
		]
	}

# 4º Ano - Fase 3: Portas Lógicas e Bits (AND)
static func _level_g4_3() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 2,
		"title": "4º Ano - Fase 3: Portas Lógicas e Bits (AND)",
		"bncc_code": "BNCC Computação: Mundo Digital e Lógica Booleana (1 e 0)",
		"bncc_desc": "Na computação, 1 = Verdadeiro e 0 = Falso. A porta AND requer sinal 1 em AMBOS os sensores para abrir a porta!",
		"rule_description": "Circuito AND: Ambos os sensores exigem sinal 1 (Verdadeiro)",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 24,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 1), Vector2i(9, 2), Vector2i(9, 3), Vector2i(9, 4), Vector2i(9, 5), Vector2i(9, 6), Vector2i(9, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 0, "theme": "red"},
			{"pos": Vector2i(4, 5), "val": 0, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 1", "id": "and1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 2", "id": "and2"}
		]
	}

# 4º Ano - Fase 4: O Valor Desconhecido (2 * [A] + [B] = 11)
static func _level_g4_4() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 3,
		"title": "4º Ano - Fase 4: O Valor Desconhecido (2 * [A] + [B] = 11)",
		"bncc_code": "EF04MA11 / Computação: Igualdade em Sentenças Matemáticas",
		"bncc_desc": "O dobro da primeira caixa somado com a segunda deve ser 11: 2 * [A] + [B] = 11. Teste as hipóteses!",
		"rule_description": "Resolva a sentença: 2 * [A] + [B] = 11",
		"rule_type": "EQUATION_2A_PLUS_B",
		"target_value": 11,
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "beige"},
			{"pos": Vector2i(4, 5), "val": 6, "theme": "metal"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Caixa [A]", "id": "eq_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Caixa [B]", "id": "eq_b"}
		]
	}

# 4º Ano - Fase 5: Otimização e Menor Custo
static func _level_g4_5() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 4,
		"title": "4º Ano - Fase 5: Otimização e Menor Custo",
		"bncc_code": "BNCC Computação: Otimização de Trajetória e Análise de Complexidade",
		"bncc_desc": "Eficiência de execução: organize as duas caixas de fechamento gastando a menor quantidade de passos possível!",
		"rule_description": "Leve as caixas 10 e 20 aos sensores de fechamento",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 22,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 10, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 20, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 10, "label": "10", "id": "p10"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 20, "label": "20", "id": "p20"}
		]
	}

# 4º Ano - Fase 6: Porta Lógica OR (Disjunção)
static func _level_g4_6() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 5,
		"title": "4º Ano - Fase 6: Porta Lógica OR (Disjunção)",
		"bncc_code": "BNCC Computação: Portas Lógicas OR (1 ou 0)",
		"bncc_desc": "Na porta lógica OR, basta que pelo menos UMA entrada receba sinal 1 (Verdadeiro) para o circuito abrir!",
		"rule_description": "Ative a porta lógica com pelo menos uma entrada em 1",
		"rule_type": "TARGET_PLATES",
		"target_value": 1,
		"optimal_steps": 18,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 0, "theme": "red"},
			{"pos": Vector2i(4, 3), "val": 0, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "OR In", "id": "or_in"}
		]
	}

# 4º Ano - Fase 7: Múltiplos de 5
static func _level_g4_7() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 6,
		"title": "4º Ano - Fase 7: Múltiplos de 5",
		"bncc_code": "EF04MA05 / Computação: Critérios de Validação Aritmética",
		"bncc_desc": "Números que terminam em 0 ou 5 são múltiplos de 5. Alimente os sensores apenas com múltiplos de 5!",
		"rule_description": "Posicione caixas que sejam múltiplos de 5",
		"rule_type": "DIVISIBILITY",
		"target_value": 5,
		"optimal_steps": 22,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 15, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 20, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 12, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 18, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 5", "id": "m5_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 5", "id": "m5_2"}
		]
	}

# 4º Ano - Fase 8: Sentença Matemática Composta
static func _level_g4_8() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 7,
		"title": "4º Ano - Fase 8: Sentença Matemática Composta",
		"bncc_code": "EF04MA11 / Computação: Avaliação de Expressões Aritméticas",
		"bncc_desc": "Multiplicação tem precedência: calcule [A] * [B] + [C] = 14 e posicione as 3 caixas exatas.",
		"rule_description": "Resolva a expressão: [A] * [B] = 12 e C = 2 (Total 14)",
		"rule_type": "SUM_EQUALS",
		"target_value": 14,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 2, "theme": "yellow"},
			{"pos": Vector2i(4, 5), "val": 5, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Termo 1", "id": "sc_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Termo 2", "id": "sc_2"},
			{"pos": Vector2i(8, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Termo 3", "id": "sc_3"}
		]
	}

# 4º Ano - Fase 9: Fatores e Produto (A * B = 18)
static func _level_g4_9() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 8,
		"title": "4º Ano - Fase 9: Fatores e Produto (A * B = 18)",
		"bncc_code": "EF04MA04 / Computação: Busca Exaustiva e Decomposição em Fatores",
		"bncc_desc": "Decomposição em fatores: encontre duas caixas cujo produto seja 18 (ex: 3 * 6 = 18 ou 2 * 9 = 18).",
		"rule_description": "Posicione 2 caixas de forma que [A] * [B] = 18",
		"rule_type": "MULTIPLICATION",
		"target_value": 18,
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 3, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 5, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator A", "id": "f18_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator B", "id": "f18_b"}
		]
	}

# 4º Ano - Fase 10: Grande Desafio do 4º Ano
static func _level_g4_10() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 9,
		"title": "4º Ano - Fase 10: Grande Desafio do 4º Ano",
		"bncc_code": "EF04MA04 / Computação: Integração Curricular de Multiplicação e Lógica",
		"bncc_desc": "Parabéns por completar o 4º Ano! Encontre os fatores de 24 ([A] * [B] = 24) navegando entre os pilares.",
		"rule_description": "Posicione 2 caixas de forma que [A] * [B] = 24",
		"rule_type": "MULTIPLICATION",
		"target_value": 24,
		"optimal_steps": 28,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7), Vector2i(6, 3)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "green"},
			{"pos": Vector2i(3, 5), "val": 6, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "wood"},
			{"pos": Vector2i(4, 4), "val": 7, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(8, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator A", "id": "f24_a"},
			{"pos": Vector2i(8, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator B", "id": "f24_b"}
		]
	}

# 5º Ano - Fase 1: Expressões Algébricas (([A] + [B]) * [C] = 20)
static func _level_g5_1() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 0,
		"title": "5º Ano - Fase 1: Expressões Algébricas (([A] + [B]) * [C] = 20)",
		"bncc_code": "EF05MA11 / Computação: Álgebra Simbólica e Precedência de Parênteses",
		"bncc_desc": "A ordem de avaliação importa! Resolva a expressão ([A] + [B]) * [C] = 20 alocando as caixas certas.",
		"rule_description": "Resolva: ([A] + [B]) * [C] = 20",
		"rule_type": "EXPRESSION_COMPOUND",
		"target_value": 20,
		"optimal_steps": 28,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "yellow"},
			{"pos": Vector2i(4, 5), "val": 5, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A", "id": "alg_a"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "B", "id": "alg_b"},
			{"pos": Vector2i(8, 3), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "C", "id": "alg_c"}
		]
	}

# 5º Ano - Fase 2: Critérios de Divisibilidade (Múltiplos de 6)
static func _level_g5_2() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 1,
		"title": "5º Ano - Fase 2: Critérios de Divisibilidade (Múltiplos de 6)",
		"bncc_code": "EF05MA08 / Computação: Regras Compostas (Divisível por 2 E por 3)",
		"bncc_desc": "Um número é divisível por 6 quando é simultaneamente par e divisível por 3. Filtre os múltiplos de 6!",
		"rule_description": "Posicione caixas que sejam múltiplos de 6",
		"rule_type": "DIVISIBILITY",
		"target_value": 6,
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 12, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 18, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 15, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 16, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 6", "id": "div6_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 6", "id": "div6_2"}
		]
	}

# 5º Ano - Fase 3: Portas Lógicas e Circuitos Digitais (AND)
static func _level_g5_3() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 2,
		"title": "5º Ano - Fase 3: Portas Lógicas e Circuitos Digitais (AND)",
		"bncc_code": "EF05MA11 / BNCC Computação: Mundo Digital e Circuitos Lógicos",
		"bncc_desc": "Na computação, 1 = Verdadeiro e 0 = Falso. A porta AND exige que ambas as entradas recebam sinal 1.",
		"rule_description": "Circuito Lógico AND: Ambos os sensores exigem sinal 1",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 0, "theme": "red"},
			{"pos": Vector2i(4, 5), "val": 0, "theme": "red"},
			{"pos": Vector2i(5, 3), "val": 0, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 1", "id": "and1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 2", "id": "and2"}
		]
	}

# 5º Ano - Fase 4: Média Aritmética ((A + B + C) / 3 = 6)
static func _level_g5_4() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 3,
		"title": "5º Ano - Fase 4: Média Aritmética ((A + B + C) / 3 = 6)",
		"bncc_code": "EF05MA24 / Computação: Cálculo de Médias e Tratamento de Dados",
		"bncc_desc": "A média é a soma dividida pela quantidade: encontre três caixas cuja média seja exatamente 6 (Soma = 18).",
		"rule_description": "Encontre 3 caixas cuja média seja 6 ((A+B+C)/3 = 6)",
		"rule_type": "AVERAGE_3",
		"target_value": 6,
		"optimal_steps": 30,
		"grid_width": 11,
		"grid_height": 9,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(0, 8), Vector2i(1, 0), Vector2i(1, 8), Vector2i(2, 0), Vector2i(2, 8), Vector2i(3, 0), Vector2i(3, 8), Vector2i(4, 0),
			Vector2i(4, 8), Vector2i(5, 0), Vector2i(5, 8), Vector2i(6, 0), Vector2i(6, 8), Vector2i(7, 0), Vector2i(7, 8), Vector2i(8, 0),
			Vector2i(8, 8), Vector2i(9, 0), Vector2i(9, 8), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4),
			Vector2i(10, 5), Vector2i(10, 6), Vector2i(10, 7), Vector2i(10, 8)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue"},
			{"pos": Vector2i(3, 6), "val": 8, "theme": "yellow"},
			{"pos": Vector2i(4, 3), "val": 10, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 3, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 1", "id": "avg_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 2", "id": "avg_2"},
			{"pos": Vector2i(7, 6), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 3", "id": "avg_3"}
		]
	}

# 5º Ano - Fase 5: Precedência de Operações (([A] + [B]) * [C] = 24)
static func _level_g5_5() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 4,
		"title": "5º Ano - Fase 5: Precedência de Operações (([A] + [B]) * [C] = 24)",
		"bncc_code": "EF05MA11 / Computação: Ordem de Avaliação e Precedência Algorítmica",
		"bncc_desc": "Avalie a expressão com parênteses ([A] + [B]) * [C] = 24. Planeje sua lógica com precisão!",
		"rule_description": "Resolva a expressão: ([A] + [B]) * [C] = 24",
		"rule_type": "EXPRESSION_COMPOUND",
		"target_value": 24,
		"optimal_steps": 32,
		"grid_width": 12,
		"grid_height": 9,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(10, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(0, 8), Vector2i(1, 0), Vector2i(1, 8), Vector2i(2, 0), Vector2i(2, 8), Vector2i(3, 0), Vector2i(3, 8), Vector2i(4, 0),
			Vector2i(4, 8), Vector2i(5, 0), Vector2i(5, 8), Vector2i(6, 0), Vector2i(6, 8), Vector2i(7, 0), Vector2i(7, 8), Vector2i(8, 0),
			Vector2i(8, 8), Vector2i(9, 0), Vector2i(9, 8), Vector2i(10, 0), Vector2i(10, 8), Vector2i(11, 0), Vector2i(11, 1), Vector2i(11, 2),
			Vector2i(11, 3), Vector2i(11, 4), Vector2i(11, 5), Vector2i(11, 6), Vector2i(11, 7), Vector2i(11, 8)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 2, "theme": "wood"},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "blue"},
			{"pos": Vector2i(3, 6), "val": 4, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "beige"},
			{"pos": Vector2i(4, 5), "val": 3, "theme": "metal"}
		],
		"plates": [
			{"pos": Vector2i(8, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot (A)", "id": "comp_A"},
			{"pos": Vector2i(8, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot (+B)", "id": "comp_B"},
			{"pos": Vector2i(8, 6), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot (*C)", "id": "comp_C"}
		]
	}

# 5º Ano - Fase 6: Média Aritmética de Alto Desempenho ((A + B + C) / 3 = 8)
static func _level_g5_6() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 5,
		"title": "5º Ano - Fase 6: Média Aritmética de Alto Desempenho ((A + B + C) / 3 = 8)",
		"bncc_code": "EF05MA24 / Computação: Análise Estatística e Agrupamentos",
		"bncc_desc": "Cálculo de média com soma total 24: posicione três caixas para atingir a média exata de 8.",
		"rule_description": "Encontre 3 caixas cuja média seja 8 ((A+B+C)/3 = 8)",
		"rule_type": "AVERAGE_3",
		"target_value": 8,
		"optimal_steps": 32,
		"grid_width": 11,
		"grid_height": 9,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(0, 8), Vector2i(1, 0), Vector2i(1, 8), Vector2i(2, 0), Vector2i(2, 8), Vector2i(3, 0), Vector2i(3, 8), Vector2i(4, 0),
			Vector2i(4, 8), Vector2i(5, 0), Vector2i(5, 8), Vector2i(6, 0), Vector2i(6, 8), Vector2i(7, 0), Vector2i(7, 8), Vector2i(8, 0),
			Vector2i(8, 8), Vector2i(9, 0), Vector2i(9, 8), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4),
			Vector2i(10, 5), Vector2i(10, 6), Vector2i(10, 7), Vector2i(10, 8)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 6, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "green"},
			{"pos": Vector2i(3, 6), "val": 10, "theme": "yellow"},
			{"pos": Vector2i(4, 3), "val": 5, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 12, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 1", "id": "avg8_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 2", "id": "avg8_2"},
			{"pos": Vector2i(7, 6), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 3", "id": "avg8_3"}
		]
	}

# 5º Ano - Fase 7: Circuito Lógico Booleano Misto
static func _level_g5_7() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 6,
		"title": "5º Ano - Fase 7: Circuito Lógico Booleano Misto",
		"bncc_code": "BNCC Computação: Portas Lógicas Conectadas em Cascata",
		"bncc_desc": "Portas em série: ambos os terminais de entrada exigem o bit 1 para ativar o barramento de dados!",
		"rule_description": "Circuito AND Duplo: Envie bits 1 aos dois terminais",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 1, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 0, "theme": "red"},
			{"pos": Vector2i(4, 5), "val": 0, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "Bit A", "id": "bit_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "Bit B", "id": "bit_b"}
		]
	}

# 5º Ano - Fase 8: Critérios de Divisibilidade por 9
static func _level_g5_8() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 7,
		"title": "5º Ano - Fase 8: Critérios de Divisibilidade por 9",
		"bncc_code": "EF05MA08 / Computação: Validação Numérica e Resto Zero",
		"bncc_desc": "A soma dos algarismos de um múltiplo de 9 é divisível por 9 (ex: 18, 27). Alimente os sensores com múltiplos de 9!",
		"rule_description": "Posicione caixas que sejam múltiplos de 9",
		"rule_type": "DIVISIBILITY",
		"target_value": 9,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 18, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 27, "theme": "green"},
			{"pos": Vector2i(4, 3), "val": 21, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 24, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 9", "id": "div9_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo 9", "id": "div9_2"}
		]
	}

# 5º Ano - Fase 9: Sentença Linear (2 * [A] + [B] = 16)
static func _level_g5_9() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 8,
		"title": "5º Ano - Fase 9: Sentença Linear (2 * [A] + [B] = 16)",
		"bncc_code": "EF05MA11 / Computação: Modelagem Algébrica e Equações",
		"bncc_desc": "Resolva a sentença algébrica linear: o dobro de [A] mais [B] precisa totalizar 16 (2 * [A] + [B] = 16).",
		"rule_description": "Resolva a sentença: 2 * [A] + [B] = 16",
		"rule_type": "EQUATION_2A_PLUS_B",
		"target_value": 16,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(1, 0), Vector2i(1, 7), Vector2i(2, 0), Vector2i(2, 7), Vector2i(3, 0), Vector2i(3, 7), Vector2i(4, 0), Vector2i(4, 7),
			Vector2i(5, 0), Vector2i(5, 7), Vector2i(6, 0), Vector2i(6, 7), Vector2i(7, 0), Vector2i(7, 7), Vector2i(8, 0), Vector2i(8, 7),
			Vector2i(9, 0), Vector2i(9, 7), Vector2i(10, 0), Vector2i(10, 1), Vector2i(10, 2), Vector2i(10, 3), Vector2i(10, 4), Vector2i(10, 5),
			Vector2i(10, 6), Vector2i(10, 7)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 5, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 6, "theme": "blue"},
			{"pos": Vector2i(4, 3), "val": 4, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 7, "theme": "beige"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Incógnita [A]", "id": "lin_a"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Incógnita [B]", "id": "lin_b"}
		]
	}

# 5º Ano - Fase 10: O Grande Enigma Algébrico Final
static func _level_g5_10() -> Dictionary:
	return {
		"grade": 5,
		"level_index": 9,
		"title": "5º Ano - Fase 10: O Grande Enigma Algébrico Final",
		"bncc_code": "EF05MA11 / Computação: Conclusão do Ensino Fundamental I",
		"bncc_desc": "O maior desafio da jornada: resolva ([A] + [B]) * [C] = 36 e complete toda a formação matemática do jogo!",
		"rule_description": "Resolva o enigma final: ([A] + [B]) * [C] = 36",
		"rule_type": "EXPRESSION_COMPOUND",
		"target_value": 36,
		"optimal_steps": 36,
		"grid_width": 12,
		"grid_height": 9,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(10, 4),
		"walls": [
			Vector2i(0, 0), Vector2i(0, 1), Vector2i(0, 2), Vector2i(0, 3), Vector2i(0, 4), Vector2i(0, 5), Vector2i(0, 6), Vector2i(0, 7),
			Vector2i(0, 8), Vector2i(1, 0), Vector2i(1, 8), Vector2i(2, 0), Vector2i(2, 8), Vector2i(3, 0), Vector2i(3, 8), Vector2i(4, 0),
			Vector2i(4, 8), Vector2i(5, 0), Vector2i(5, 8), Vector2i(6, 0), Vector2i(6, 8), Vector2i(7, 0), Vector2i(7, 8), Vector2i(8, 0),
			Vector2i(8, 8), Vector2i(9, 0), Vector2i(9, 8), Vector2i(10, 0), Vector2i(10, 8), Vector2i(11, 0), Vector2i(11, 1), Vector2i(11, 2),
			Vector2i(11, 3), Vector2i(11, 4), Vector2i(11, 5), Vector2i(11, 6), Vector2i(11, 7), Vector2i(11, 8), Vector2i(6, 4)
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 5, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 4, "theme": "blue"},
			{"pos": Vector2i(3, 6), "val": 4, "theme": "yellow"},
			{"pos": Vector2i(4, 3), "val": 6, "theme": "wood"},
			{"pos": Vector2i(4, 5), "val": 3, "theme": "red"}
		],
		"plates": [
			{"pos": Vector2i(8, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A (5)", "id": "fin_a"},
			{"pos": Vector2i(8, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "+B (4)", "id": "fin_b"},
			{"pos": Vector2i(8, 6), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "*C (4)", "id": "fin_c"}
		]
	}
