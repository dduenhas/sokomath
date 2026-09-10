class_name LevelData
extends RefCounted

# =============================================================
# ESTRUTURA CURRICULAR DO ENSINO FUNDAMENTAL I (1º AO 5º ANO)
# Alinhado à BNCC e BNCC Computação (Anos Iniciais)
# =============================================================

const LEVELS_PER_GRADE: int = 5

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
				"description": "Contagem, correspondência de posições, ordenação simples (1, 2, 3) e pensamento sequencial básico sem bloqueios complexos.",
				"accent_color": Color(0.2, 0.75, 0.45) # Verde Esmeralda
			}
		2:
			return {
				"grade": 2,
				"name": "2º Ano",
				"age": "7 a 8 anos",
				"subtitle": "Paridade, Comparações e Somas Iniciais",
				"description": "Números pares e ímpares, comparações relacionais (> e <), pulos de 2 em 2 e somas de fechamento elementares.",
				"accent_color": Color(0.25, 0.65, 0.95) # Azul Celeste
			}
		3:
			return {
				"grade": 3,
				"name": "3º Ano",
				"age": "8 a 9 anos",
				"subtitle": "Operações Inversas, Saltos e Decisões",
				"description": "Adições estruturadas, subtrações (minuendo e subtraendo), sequências com saltos (+3 ou +5) e tomada de decisão combinada.",
				"accent_color": Color(0.95, 0.55, 0.2) # Laranja Âmbar
			}
		4:
			return {
				"grade": 4,
				"name": "4º Ano",
				"age": "9 a 10 anos",
				"subtitle": "Multiplicação, Múltiplos e Portas Lógicas",
				"description": "Fatores e produto, identificação de múltiplos, operadores lógicos booleanos (AND) e sequências multiplicativas.",
				"accent_color": Color(0.7, 0.4, 0.95) # Roxo / Violeta
			}
		5:
			return {
				"grade": 5,
				"name": "5º Ano",
				"age": "10 a 11 anos",
				"subtitle": "Expressões Algébricas, Médias e Precedência",
				"description": "Equações compostas (2A + B e (A+B)×C), critérios de divisibilidade, circuitos lógicos e média aritmética.",
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
		2:
			match idx:
				0: return _level_g2_1()
				1: return _level_g2_2()
				2: return _level_g2_3()
				3: return _level_g2_4()
				4: return _level_g2_5()
		3:
			match idx:
				0: return _level_g3_1()
				1: return _level_g3_2()
				2: return _level_g3_3()
				3: return _level_g3_4()
				4: return _level_g3_5()
		4:
			match idx:
				0: return _level_g4_1()
				1: return _level_g4_2()
				2: return _level_g4_3()
				3: return _level_g4_4()
				4: return _level_g4_5()
		5:
			match idx:
				0: return _level_g5_1()
				1: return _level_g5_2()
				2: return _level_g5_3()
				3: return _level_g5_4()
				4: return _level_g5_5()

	return _level_g1_1()

# =============================================================
# 🟢 1º ANO (6 A 7 ANOS) - FUNDAMENTOS E PENSAMENTO SEQUENCIAL
# =============================================================

# Fase 1.1: O Primeiro Passo (Algoritmo Básico)
static func _level_g1_1() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 0,
		"title": "1º Ano - Fase 1: O Primeiro Passo",
		"bncc_code": "EF01MA04 / Computação: Algoritmos e Sequência de Passos",
		"bncc_desc": "Um algoritmo é uma sequência de instruções organizadas. Empurre a caixa até a placa amarela para ativar o sensor e destravar a porta!",
		"rule_description": "Empurre a caixa com o número 1 até a placa amarela",
		"rule_type": "TARGET_PLATES",
		"target_value": 1,
		"optimal_steps": 8,
		"grid_width": 8,
		"grid_height": 6,
		"player_start": Vector2i(1, 2),
		"door_pos": Vector2i(6, 2),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0),
			Vector2i(0,1), Vector2i(7,1),
			Vector2i(0,2), Vector2i(7,2),
			Vector2i(0,3), Vector2i(7,3),
			Vector2i(0,4), Vector2i(7,4),
			Vector2i(0,5), Vector2i(1,5), Vector2i(2,5), Vector2i(3,5), Vector2i(4,5), Vector2i(5,5), Vector2i(6,5), Vector2i(7,5),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(5, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1", "id": "p1"}
		]
	}

# Fase 1.2: Correspondência Biunívoca (Caixa 1 na Placa 1, Caixa 2 na Placa 2)
static func _level_g1_2() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 1,
		"title": "1º Ano - Fase 2: Correspondência Direta",
		"bncc_code": "EF01MA04 / Computação: Mapeamento e Correspondência 1-para-1",
		"bncc_desc": "Cada informação tem seu lugar! Leve a caixa 1 até a placa 1 e a caixa 2 até a placa 2.",
		"rule_description": "Posicione a caixa 1 no sensor 1 e a caixa 2 no sensor 2",
		"rule_type": "TARGET_PLATES",
		"target_value": 2,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 2, "theme": "blue"}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1", "id": "p1"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2", "id": "p2"}
		]
	}

# Fase 1.3: A Ordem das Coisas (1 ➔ 2 ➔ 3)
static func _level_g1_3() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 2,
		"title": "1º Ano - Fase 3: Ordem Crescente (1, 2, 3)",
		"bncc_code": "EF01MA09 / Computação: Ordenação de Dados e Arrays",
		"bncc_desc": "Na computação, organizar itens em ordem crescente facilita a busca. Complete a trilha com os números 1, 2 e 3 em sequência!",
		"rule_description": "Organize as caixas em ordem: [ 1 ] ➔ [ 2 ] ➔ [ 3 ]",
		"rule_type": "ORDER_ASCENDING",
		"target_value": 3,
		"optimal_steps": 18,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 1, "theme": "green"},
			{"pos": Vector2i(2, 3), "val": 2, "theme": "blue"},
			{"pos": Vector2i(3, 4), "val": 3, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 1, "label": "1º", "id": "ord_1"},
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 2, "label": "2º", "id": "ord_2"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 3, "label": "3º", "id": "ord_3"}
		]
	}

# Fase 1.4: O Menor Primeiro (Comparação Direta)
static func _level_g1_4() -> Dictionary:
	var small := randi_range(1, 3)
	var large := small + randi_range(3, 5)
	var crates_data: Array[Dictionary] = [
		{"pos": Vector2i(3, 2), "val": large, "theme": "red"},
		{"pos": Vector2i(3, 4), "val": small, "theme": "green"}
	]
	crates_data.shuffle()
	crates_data[0]["pos"] = Vector2i(3, 2)
	crates_data[1]["pos"] = Vector2i(3, 4)

	return {
		"grade": 1,
		"level_index": 3,
		"title": "1º Ano - Fase 4: Comparação (O Menor Número)",
		"bncc_code": "EF01MA01 / Computação: Comparação e Seleção de Menor Valor (MIN)",
		"bncc_desc": "O algoritmo precisa do MENOR valor para seguir adiante. Compare as duas caixas (%d e %d) e empurre a menor até o sensor." % [small, large],
		"rule_description": "Leve a MENOR caixa até o sensor",
		"rule_type": "MINIMUM_VALUE",
		"target_value": small,
		"optimal_steps": 12,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": crates_data,
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": small, "label": "MENOR", "id": "min_p"}
		]
	}

# Fase 1.5: Desvio e Desobstrução de Caminho
static func _level_g1_5() -> Dictionary:
	return {
		"grade": 1,
		"level_index": 4,
		"title": "1º Ano - Fase 5: Planejando o Caminho",
		"bncc_code": "EF01MA04 / Computação: Decomposição e Navegação Espacial",
		"bncc_desc": "Desvio espacial: para levar a caixa ao sensor, você precisará contornar o obstáculo central sem ficar encurralado!",
		"rule_description": "Desvie do obstáculo e leve a caixa 5 até o sensor",
		"rule_type": "TARGET_PLATES",
		"target_value": 5,
		"optimal_steps": 16,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 1),
		"door_pos": Vector2i(7, 5),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(4,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": [
			{"pos": Vector2i(2, 3), "val": 5, "theme": "yellow"}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 5, "label": "5", "id": "p5"}
		]
	}

# =============================================================
# 🔵 2º ANO (7 A 8 ANOS) - PARIDADE, CLASSIFICAÇÃO E SOMA INICIAL
# =============================================================

# Fase 2.1: Detectando Pares (Introdução a Par/Ímpar)
static func _level_g2_1() -> Dictionary:
	var even_val := randi_range(2, 4) * 2
	var odd_val := randi_range(1, 4) * 2 + 1
	var crates_data := [
		{"pos": Vector2i(3, 2), "val": even_val, "theme": "green"},
		{"pos": Vector2i(3, 4), "val": odd_val, "theme": "red"}
	]
	crates_data.shuffle()
	crates_data[0]["pos"] = Vector2i(3, 2)
	crates_data[1]["pos"] = Vector2i(3, 4)

	return {
		"grade": 2,
		"level_index": 0,
		"title": "2º Ano - Fase 1: Detectando Números Pares",
		"bncc_code": "EF02MA01 / Computação: Classificação e Regras de Decisão",
		"bncc_desc": "Números pares podem ser divididos em duas partes iguais sem sobra (2, 4, 6, 8...). O sensor só aceita caixas com número PAR!",
		"rule_description": "Coloque uma caixa com número PAR no sensor",
		"rule_type": "CONDITION_SINGLE",
		"target_value": 0,
		"optimal_steps": 12,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": crates_data,
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "PAR", "id": "even_p"}
		]
	}

# Fase 2.2: Comparação de Valor (> Limiar)
static func _level_g2_2() -> Dictionary:
	var threshold := randi_range(3, 5)
	var low_val := threshold - randi_range(1, 2)
	var high_val := threshold + randi_range(1, 3)

	var crates_data := [
		{"pos": Vector2i(3, 2), "val": low_val, "theme": "wood"},
		{"pos": Vector2i(3, 4), "val": high_val, "theme": "blue"}
	]
	crates_data.shuffle()
	crates_data[0]["pos"] = Vector2i(3, 2)
	crates_data[1]["pos"] = Vector2i(3, 4)

	return {
		"grade": 2,
		"level_index": 1,
		"title": "2º Ano - Fase 2: O Sensor Maior que %d" % threshold,
		"bncc_code": "EF02MA01 / Computação: Operadores Relacionais (SE > X)",
		"bncc_desc": "O sensor utiliza uma condição lógica de comparação: o número precisa ser MAIOR que %d para ativar o mecanismo." % threshold,
		"rule_description": "Empurre para o sensor uma caixa com valor > %d" % threshold,
		"rule_type": "CONDITION_SINGLE",
		"target_value": threshold,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": crates_data,
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.GREATER_THAN, "val": threshold, "label": "> %d" % threshold, "id": "gt_p"}
		]
	}

# Fase 2.3: Amigos do 10 (Soma Elementar)
static func _level_g2_3() -> Dictionary:
	var a := randi_range(2, 5)
	var b := 10 - a
	var distractor := 10 - a + 1 if a > 2 else 10 - a - 1

	var vals := [
		{"val": a, "theme": "green"},
		{"val": b, "theme": "blue"},
		{"val": distractor, "theme": "wood"}
	]
	vals.shuffle()

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
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(6, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "A", "id": "s_a"},
			{"pos": Vector2i(6, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "B", "id": "s_b"}
		]
	}

# Fase 2.4: Pulo de 2 em 2 (Sequência Recursiva)
static func _level_g2_4() -> Dictionary:
	var start := randi_range(1, 3) * 2
	var t2 := start + 2
	var t3 := start + 4
	var distractor := t3 + 1

	var vals := [
		{"val": t3, "theme": "green"},
		{"val": distractor, "theme": "beige"}
	]
	vals.shuffle()

	return {
		"grade": 2,
		"level_index": 3,
		"title": "2º Ano - Fase 4: Pulo de 2 em 2",
		"bncc_code": "EF02MA09 / Computação: Padrões de Repetição e Passo Fixo (+2)",
		"bncc_desc": "Observe o padrão repetitivo: %d ➔ %d ➔ [ ? ]. Descubra qual é o próximo número da sequência e coloque-o na placa!" % [start, t2],
		"rule_description": "Complete a sequência (+2): %d ➔ %d ➔ [ ? ]" % [start, t2],
		"rule_type": "TARGET_PLATES",
		"target_value": t3,
		"optimal_steps": 14,
		"grid_width": 9,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(7, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0),
			Vector2i(0,1), Vector2i(8,1),
			Vector2i(0,2), Vector2i(8,2),
			Vector2i(0,3), Vector2i(8,3),
			Vector2i(0,4), Vector2i(8,4),
			Vector2i(0,5), Vector2i(8,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(6, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": t3, "label": "?", "id": "seq_p"}
		]
	}

# Fase 2.5: Classificação Dupla (Um Par e Um Ímpar)
static func _level_g2_5() -> Dictionary:
	var even_num := randi_range(2, 4) * 2
	var odd_num := randi_range(1, 4) * 2 + 1
	var distractor := even_num + 2

	var vals := [
		{"val": even_num, "theme": "green"},
		{"val": odd_num, "theme": "blue"},
		{"val": distractor, "theme": "wood"}
	]
	vals.shuffle()

	return {
		"grade": 2,
		"level_index": 4,
		"title": "2º Ano - Fase 5: Classificação Par e Ímpar",
		"bncc_code": "EF02MA01 / Computação: Estruturas Condicionais Múltiplas",
		"bncc_desc": "O sistema possui dois filtros: o Sensor 1 exige número PAR e o Sensor 2 exige número ÍMPAR. Organize as entradas corretas!",
		"rule_description": "Sensor 1: Número PAR | Sensor 2: Número ÍMPAR",
		"rule_type": "CONDITIONAL_EVEN_ODD",
		"target_value": 0,
		"optimal_steps": 18,
		"grid_width": 10,
		"grid_height": 7,
		"player_start": Vector2i(1, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0),
			Vector2i(0,1), Vector2i(9,1),
			Vector2i(0,2), Vector2i(9,2),
			Vector2i(0,3), Vector2i(9,3),
			Vector2i(0,4), Vector2i(9,4),
			Vector2i(0,5), Vector2i(9,5),
			Vector2i(0,6), Vector2i(1,6), Vector2i(2,6), Vector2i(3,6), Vector2i(4,6), Vector2i(5,6), Vector2i(6,6), Vector2i(7,6), Vector2i(8,6), Vector2i(9,6),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "PAR", "id": "p_even"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ODD, "val": 0, "label": "ÍMPAR", "id": "p_odd"}
		]
	}

# =============================================================
# 🟠 3º ANO (8 A 9 ANOS) - OPERAÇÕES INVERSAS E REGULARIDADES
# =============================================================

# Fase 3.1: Balança de Soma (Meta Precisa)
static func _level_g3_1() -> Dictionary:
	var a := randi_range(4, 9)
	var b := randi_range(3, 8)
	var target := a + b
	var d1 := target - a + 1
	var d2 := target - b - 2

	var vals := [
		{"val": a, "theme": "green"},
		{"val": b, "theme": "blue"},
		{"val": d1, "theme": "wood"},
		{"val": d2, "theme": "beige"}
	]
	vals.shuffle()

	return {
		"grade": 3,
		"level_index": 0,
		"title": "3º Ano - Fase 1: Balança de Soma (A + B = %d)" % target,
		"bncc_code": "EF03MA05 / Computação: Resolução de Problemas e Seleção de Entradas",
		"bncc_desc": "Entre as 4 opções de caixas, encontre o par exato cuja soma seja igual a %d. Cuidado com números que passam perto!" % target,
		"rule_description": "Empurre 2 caixas para que A + B = %d" % target,
		"rule_type": "SUM_EQUALS",
		"target_value": target,
		"optimal_steps": 20,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0),
			Vector2i(0,1), Vector2i(9,1),
			Vector2i(0,2), Vector2i(9,2),
			Vector2i(0,3), Vector2i(9,3),
			Vector2i(0,4), Vector2i(9,4),
			Vector2i(0,5), Vector2i(9,5),
			Vector2i(0,6), Vector2i(9,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot A", "id": "A"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot B", "id": "B"}
		]
	}

# Fase 3.2: Diferença e Operação Inversa ([A] - [B] = Target)
static func _level_g3_2() -> Dictionary:
	var b_val := randi_range(2, 5)
	var target := randi_range(3, 6)
	var a_val := target + b_val
	var d1 := a_val + 2
	var d2 := b_val + 1

	var vals := [
		{"val": a_val, "theme": "green"},
		{"val": b_val, "theme": "blue"},
		{"val": d1, "theme": "red"},
		{"val": d2, "theme": "beige"}
	]
	vals.shuffle()

	return {
		"grade": 3,
		"level_index": 1,
		"title": "3º Ano - Fase 2: Diferença Lógica ([A] - [B] = %d)" % target,
		"bncc_code": "EF03MA05 / Computação: Operadores de Subtração e Teste Relacional",
		"bncc_desc": "Subtração é a operação inversa da adição! Descubra o Minuendo [A] e o Subtraendo [B] para que [A] - [B] = %d." % target,
		"rule_description": "Resolva a subtração: [A] - [B] = %d" % target,
		"rule_type": "SUBTRACTION",
		"target_value": target,
		"optimal_steps": 22,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0),
			Vector2i(0,1), Vector2i(9,1),
			Vector2i(0,2), Vector2i(9,2),
			Vector2i(0,3), Vector2i(9,3),
			Vector2i(0,4), Vector2i(9,4),
			Vector2i(0,5), Vector2i(9,5),
			Vector2i(0,6), Vector2i(9,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Minuendo [A]", "id": "sub_A"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Subtraendo [B]", "id": "sub_B"}
		]
	}

# Fase 3.3: Sequência de Saltos (+3 ou +5)
static func _level_g3_3() -> Dictionary:
	var step_size := 3 if randf() > 0.5 else 5
	var t1 := randi_range(1, 3) * step_size
	var t2 := t1 + step_size
	var t3 := t1 + 2 * step_size
	var t4 := t1 + 3 * step_size
	var distractor := t3 + 1

	var vals := [
		{"val": t3, "theme": "green"},
		{"val": t4, "theme": "blue"},
		{"val": distractor, "theme": "wood"}
	]
	vals.shuffle()

	return {
		"grade": 3,
		"level_index": 2,
		"title": "3º Ano - Fase 3: Sequência de Saltos (+%d)" % step_size,
		"bncc_code": "EF03MA10 / Computação: Regularidades e Iterações de Laço",
		"bncc_desc": "Identifique a regra recursiva da sequência: %d ➔ %d ➔ [ ? ] ➔ [ ? ]. Posicione os dois próximos números nos sensores!" % [t1, t2],
		"rule_description": "Complete a sequência (+%d): %d ➔ %d ➔ [ ? ] ➔ [ ? ]" % [step_size, t1, t2],
		"rule_type": "SEQUENCE_PA",
		"target_value": step_size,
		"seq_start": [t1, t2],
		"optimal_steps": 24,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 3), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": t3, "label": "3º Termo (?)", "id": "seq_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": t4, "label": "4º Termo (?)", "id": "seq_2"}
		]
	}

# Fase 3.4: Decisão Condicional Combinada (IF PAR e IF > X)
static func _level_g3_4() -> Dictionary:
	var threshold := 5
	return {
		"grade": 3,
		"level_index": 3,
		"title": "3º Ano - Fase 4: Condicionais (PAR e > %d)" % threshold,
		"bncc_code": "EF03MA01 / Computação: Estruturas de Decisão Lógica (IF / ELSE)",
		"bncc_desc": "O sensor 1 exige uma caixa com número PAR. O sensor 2 exige uma caixa com valor MAIOR que %d. Analise as caixas disponíveis!" % threshold,
		"rule_description": "Sensor 1: Número PAR | Sensor 2: Número > %d" % threshold,
		"rule_type": "CONDITIONAL_DUAL",
		"target_value": threshold,
		"optimal_steps": 22,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(8, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0),
			Vector2i(0,1), Vector2i(9,1),
			Vector2i(0,2), Vector2i(9,2),
			Vector2i(0,3), Vector2i(9,3),
			Vector2i(0,4), Vector2i(9,4),
			Vector2i(0,5), Vector2i(9,5),
			Vector2i(0,6), Vector2i(9,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 4, "theme": "wood"},   # Par <= 5
			{"pos": Vector2i(3, 4), "val": 7, "theme": "red"},    # Impar > 5
			{"pos": Vector2i(3, 5), "val": 8, "theme": "blue"},   # Par > 5
			{"pos": Vector2i(2, 5), "val": 3, "theme": "beige"}   # Impar < 5
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.EVEN, "val": 0, "label": "IF PAR", "id": "cond_even"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.GREATER_THAN, "val": threshold, "label": "IF > %d" % threshold, "id": "cond_gt"}
		]
	}

# Fase 3.5: Planejamento de Rota e Decomposição
static func _level_g3_5() -> Dictionary:
	var target := 15
	return {
		"grade": 3,
		"level_index": 4,
		"title": "3º Ano - Fase 5: Planejamento e Decomposição",
		"bncc_code": "EF03MA05 / Computação: Decomposição e Prevenção de Bloqueios",
		"bncc_desc": "Neste labirinto com corredor estreito, planeje a ordem em que você empurra as caixas para somar %d sem bloquear a passagem!" % target,
		"rule_description": "Empurre 2 caixas até os sensores para somar %d" % target,
		"rule_type": "SUM_EQUALS",
		"target_value": target,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 7, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 8, "theme": "blue"},
			{"pos": Vector2i(2, 4), "val": 4, "theme": "wood"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot 1", "id": "p_a"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot 2", "id": "p_b"}
		]
	}

# =============================================================
# 🟣 4º ANO (9 A 10 ANOS) - MULTIPLICAÇÃO, MÚLTIPLOS E BOOLEANOS
# =============================================================

# Fase 4.1: Máquina de Multiplicar (Fatores Simples)
static func _level_g4_1() -> Dictionary:
	var f1 := randi_range(2, 5)
	var f2 := randi_range(3, 5)
	var target := f1 * f2
	var d1 := f1 + 1
	var d2 := f2 + 2

	var vals := [
		{"val": f1, "theme": "green"},
		{"val": f2, "theme": "blue"},
		{"val": d1, "theme": "wood"},
		{"val": d2, "theme": "beige"}
	]
	vals.shuffle()

	return {
		"grade": 4,
		"level_index": 0,
		"title": "4º Ano - Fase 1: A Máquina de Multiplicar ([A] × [B] = %d)" % target,
		"bncc_code": "EF04MA04 / Computação: Produto e Decomposição em Fatores",
		"bncc_desc": "A multiplicação representa grupos iguais de quantidades. Encontre os dois fatores que multiplicados resultam em %d!" % target,
		"rule_description": "Encontre os fatores: [A] × [B] = %d" % target,
		"rule_type": "MULTIPLICATION",
		"target_value": target,
		"optimal_steps": 24,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0),
			Vector2i(0,1), Vector2i(9,1),
			Vector2i(0,2), Vector2i(9,2),
			Vector2i(0,3), Vector2i(9,3),
			Vector2i(0,4), Vector2i(9,4),
			Vector2i(0,5), Vector2i(9,5),
			Vector2i(0,6), Vector2i(9,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(4, 4), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator [A]", "id": "fac_A"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Fator [B]", "id": "fac_B"}
		]
	}

# Fase 4.2: Caça aos Múltiplos (Divisibilidade Elementar)
static func _level_g4_2() -> Dictionary:
	var divisor := 3 if randf() > 0.5 else 5
	var m1 := divisor * randi_range(2, 3)
	var m2 := divisor * randi_range(4, 5)
	var nm1 := m1 + 1
	var nm2 := m2 - 1

	var vals := [
		{"val": m1, "theme": "green"},
		{"val": m2, "theme": "blue"},
		{"val": nm1, "theme": "red"},
		{"val": nm2, "theme": "metal"}
	]
	vals.shuffle()

	return {
		"grade": 4,
		"level_index": 1,
		"title": "4º Ano - Fase 2: Caça aos Múltiplos de %d" % divisor,
		"bncc_code": "EF04MA05 / Computação: Operador Módulo e Filtragem de Dados",
		"bncc_desc": "Múltiplos são números obtidos multiplicando %d por inteiros. Selecione apenas caixas que pertençam à tabuada do %d!" % [divisor, divisor],
		"rule_description": "Posicione 2 caixas que sejam MÚLTIPLAS de %d" % divisor,
		"rule_type": "DIVISIBILITY",
		"target_value": divisor,
		"optimal_steps": 26,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo %d" % divisor, "id": "div_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo %d" % divisor, "id": "div_2"}
		]
	}

# Fase 4.3: Portas Lógicas (Sinal 1 / Lógica Booleana)
static func _level_g4_3() -> Dictionary:
	var vals := [
		{"val": 1, "theme": "green"},
		{"val": 1, "theme": "green"},
		{"val": 0, "theme": "red"},
		{"val": 0, "theme": "red"}
	]
	vals.shuffle()

	return {
		"grade": 4,
		"level_index": 2,
		"title": "4º Ano - Fase 3: Portas Lógicas e Bits (AND)",
		"bncc_code": "BNCC Computação: Mundo Digital e Lógica Booleana (1 e 0)",
		"bncc_desc": "Na computação, 1 = Verdadeiro (Sinal Ativo) e 0 = Falso. A porta AND requer sinal 1 em AMBOS os sensores para abrir a passagem!",
		"rule_description": "Circuito AND: Ambos os sensores exigem sinal 1 (Verdadeiro)",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 26,
		"grid_width": 10,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(8, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0),
			Vector2i(0,1), Vector2i(9,1),
			Vector2i(0,2), Vector2i(9,2),
			Vector2i(0,3), Vector2i(9,3),
			Vector2i(0,4), Vector2i(9,4),
			Vector2i(0,5), Vector2i(9,5),
			Vector2i(0,6), Vector2i(9,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 4), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 1", "id": "and1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 2", "id": "and2"}
		]
	}

# Fase 4.4: O Valor Desconhecido (Sentença Matemática: 2×A + B = Meta)
static func _level_g4_4() -> Dictionary:
	var a := randi_range(2, 4)
	var b := randi_range(1, 5)
	var target := 2 * a + b
	var d1 := a + 1
	var d2 := b + 3

	var vals := [
		{"val": a, "theme": "wood"},
		{"val": b, "theme": "blue"},
		{"val": d1, "theme": "beige"},
		{"val": d2, "theme": "metal"}
	]
	vals.shuffle()

	return {
		"grade": 4,
		"level_index": 3,
		"title": "4º Ano - Fase 4: O Valor Desconhecido (2 × [A] + [B] = %d)" % target,
		"bncc_code": "EF04MA11 / Computação: Igualdade em Sentenças Matemáticas",
		"bncc_desc": "O dobro da primeira caixa somado com a segunda precisa ser igual a %d: 2 × [A] + [B] = %d. Calcule as combinações!" % [target, target],
		"rule_description": "Resolva a sentença: 2 × [A] + [B] = %d" % target,
		"rule_type": "EQUATION_2A_PLUS_B",
		"target_value": target,
		"optimal_steps": 28,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot 2×A", "id": "A"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot +B", "id": "B"}
		]
	}

# Fase 4.5: Sequência Dobrada (Padrão Exponencial / Dobro)
static func _level_g4_5() -> Dictionary:
	return {
		"grade": 4,
		"level_index": 4,
		"title": "4º Ano - Fase 5: O Padrão do Dobro (×2)",
		"bncc_code": "EF04MA11 / Computação: Sequências Geométricas e Escalaridade",
		"bncc_desc": "Observe o crescimento multiplicativo: 2 ➔ 4 ➔ [ ? ] ➔ [ ? ]. Cada número é o dobro do anterior (×2). Calcule e posicione os próximos números nos sensores!",
		"rule_description": "Complete o padrão do dobro (×2): 2 ➔ 4 ➔ [ ? ] ➔ [ ? ]",
		"rule_type": "SEQUENCE_PA",
		"target_value": 8,
		"seq_start": [2, 4],
		"seq_op": "×2",
		"optimal_steps": 30,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": 8, "theme": "green"},
			{"pos": Vector2i(3, 4), "val": 16, "theme": "blue"},
			{"pos": Vector2i(2, 4), "val": 6, "theme": "wood"},
			{"pos": Vector2i(4, 3), "val": 12, "theme": "beige"}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 8, "label": "3º Termo (?)", "id": "seq_8"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.TARGET_VALUE, "val": 16, "label": "4º Termo (?)", "id": "seq_16"}
		]
	}

# =============================================================
# 🟡 5º ANO (10 A 11 ANOS) - EXPRESSÕES, DIVISIBILIDADE E MÉDIAS
# =============================================================

# Fase 5.1: Decomposição Algébrica (2A + B = Target)
static func _level_g5_1() -> Dictionary:
	var a := randi_range(3, 5)
	var b := randi_range(2, 6)
	var target := 2 * a + b
	var d1 := a + 2
	var d2 := b + 1

	var vals := [
		{"val": a, "theme": "wood"},
		{"val": b, "theme": "blue"},
		{"val": d1, "theme": "beige"},
		{"val": d2, "theme": "metal"}
	]
	vals.shuffle()

	return {
		"grade": 5,
		"level_index": 0,
		"title": "5º Ano - Fase 1: Expressão e Variáveis (2A + B = %d)" % target,
		"bncc_code": "EF05MA11 / Computação: Pensamento Algébrico e Resolução de Problemas",
		"bncc_desc": "Decomponha a equação: 2 × [A] + [B] = %d. Selecione as variáveis corretas planejando a movimentação sem trancar o caminho!" % target,
		"rule_description": "Resolva a equação: 2 × [A] + [B] = %d" % target,
		"rule_type": "EQUATION_2A_PLUS_B",
		"target_value": target,
		"optimal_steps": 30,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 3),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot 2×A", "id": "A"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot +B", "id": "B"}
		]
	}

# Fase 5.2: Critérios de Divisibilidade e Múltiplos
static func _level_g5_2() -> Dictionary:
	var divisor: int = 4 if randf() > 0.5 else 6
	var m1: int = divisor * randi_range(2, 3)
	var m2: int = divisor * randi_range(4, 5)
	var nm1: int = m1 + 2
	var nm2: int = m2 - 2

	var vals := [
		{"val": m1, "theme": "green"},
		{"val": m2, "theme": "blue"},
		{"val": nm1, "theme": "red"},
		{"val": nm2, "theme": "metal"}
	]
	vals.shuffle()

	return {
		"grade": 5,
		"level_index": 1,
		"title": "5º Ano - Fase 2: Divisibilidade (Múltiplos de %d)" % divisor,
		"bncc_code": "EF05MA08 / Computação: Critérios de Divisão e Operador de Resto",
		"bncc_desc": "Critério de divisibilidade: Ambos os sensores exigem números múltiplos de %d (onde o resto da divisão por %d é zero)." % [divisor, divisor],
		"rule_description": "Posicione 2 caixas que sejam MÚLTIPLAS de %d" % divisor,
		"rule_type": "DIVISIBILITY",
		"target_value": divisor,
		"optimal_steps": 28,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(2, 3),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(4, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo de %d" % divisor, "id": "div_1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Múltiplo de %d" % divisor, "id": "div_2"}
		]
	}

# Fase 5.3: Circuito Digital Completo (Portas Lógicas)
static func _level_g5_3() -> Dictionary:
	var vals := [
		{"val": 1, "theme": "green"},
		{"val": 1, "theme": "green"},
		{"val": 0, "theme": "red"},
		{"val": 0, "theme": "red"},
		{"val": 0, "theme": "metal"}
	]
	vals.shuffle()

	return {
		"grade": 5,
		"level_index": 2,
		"title": "5º Ano - Fase 3: Portas Lógicas e Álgebra Booleana (AND)",
		"bncc_code": "EF05MA11 / BNCC Computação: Mundo Digital e Circuitos Lógicos",
		"bncc_desc": "Na computação, 1 = Verdadeiro e 0 = Falso. A porta AND exige que todas as suas entradas recebam o sinal 1 (Verdadeiro) para destravar a porta.",
		"rule_description": "Circuito Lógico AND: Ambos os sensores exigem sinal 1",
		"rule_type": "LOGIC_CIRCUIT",
		"target_value": 1,
		"optimal_steps": 32,
		"grid_width": 11,
		"grid_height": 8,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(1,7), Vector2i(2,7), Vector2i(3,7), Vector2i(4,7), Vector2i(5,7), Vector2i(6,7), Vector2i(7,7), Vector2i(8,7), Vector2i(9,7), Vector2i(10,7),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(3, 6), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[4]["val"], "theme": vals[4]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 1", "id": "and1"},
			{"pos": Vector2i(7, 5), "type": SokoPlate.ConditionType.LOGIC_TRUE, "val": 1, "label": "AND In 2", "id": "and2"}
		]
	}

# Fase 5.4: Média Aritmética Elementar ((A + B + C) / 3 = Target)
static func _level_g5_4() -> Dictionary:
	var avg := randi_range(5, 7)
	var v_a := avg - 2
	var v_b := avg
	var v_c := avg + 2
	var d1 := avg + 4
	var d2 := avg - 3

	var vals := [
		{"val": v_a, "theme": "green"},
		{"val": v_b, "theme": "blue"},
		{"val": v_c, "theme": "wood"},
		{"val": d1, "theme": "red"},
		{"val": d2, "theme": "beige"}
	]
	vals.shuffle()

	return {
		"grade": 5,
		"level_index": 3,
		"title": "5º Ano - Fase 4: Média Aritmética ((A + B + C) ÷ 3 = %d)" % avg,
		"bncc_code": "EF05MA24 / Computação: Análise de Dados e Agregação Estatística",
		"bncc_desc": "Agregação de dados: A média aritmética das 3 caixas (soma dos valores dividida por 3) precisa ser exatamente igual a %d." % avg,
		"rule_description": "Média dos 3 sensores: (A + B + C) ÷ 3 = %d" % avg,
		"rule_type": "AVERAGE_3",
		"target_value": avg,
		"optimal_steps": 34,
		"grid_width": 11,
		"grid_height": 9,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(9, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0),
			Vector2i(0,1), Vector2i(10,1),
			Vector2i(0,2), Vector2i(10,2),
			Vector2i(0,3), Vector2i(10,3),
			Vector2i(0,4), Vector2i(10,4),
			Vector2i(0,5), Vector2i(10,5),
			Vector2i(0,6), Vector2i(10,6),
			Vector2i(0,7), Vector2i(10,7),
			Vector2i(0,8), Vector2i(1,8), Vector2i(2,8), Vector2i(3,8), Vector2i(4,8), Vector2i(5,8), Vector2i(6,8), Vector2i(7,8), Vector2i(8,8), Vector2i(9,8), Vector2i(10,8),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(3, 6), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[4]["val"], "theme": vals[4]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(7, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 1", "id": "avg_1"},
			{"pos": Vector2i(7, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 2", "id": "avg_2"},
			{"pos": Vector2i(7, 6), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Dado 3", "id": "avg_3"}
		]
	}

# Fase 5.5: Desafio do Mestre Algorítmico (Expressão com Parênteses)
static func _level_g5_5() -> Dictionary:
	var v_a := randi_range(2, 4)
	var v_b := randi_range(1, 4)
	var v_c := randi_range(2, 3)
	var target := (v_a + v_b) * v_c
	var d1 := v_a + 2
	var d2 := v_c + 2

	var vals := [
		{"val": v_a, "theme": "green"},
		{"val": v_b, "theme": "blue"},
		{"val": v_c, "theme": "wood"},
		{"val": d1, "theme": "red"},
		{"val": d2, "theme": "metal"}
	]
	vals.shuffle()

	return {
		"grade": 5,
		"level_index": 4,
		"title": "5º Ano - Fase 5: Precedência de Operações (([A] + [B]) × [C] = %d)" % target,
		"bncc_code": "EF05MA11 / Computação: Ordem de Avaliação e Precedência Algorítmica",
		"bncc_desc": "Grande Desafio do Ensino Fundamental I: Avalie a expressão com parênteses ([A] + [B]) × [C] = %d. Planeje sua lógica e vença a jornada!" % target,
		"rule_description": "Resolva a expressão mista: ([A] + [B]) × [C] = %d" % target,
		"rule_type": "EXPRESSION_COMPOUND",
		"target_value": target,
		"optimal_steps": 38,
		"grid_width": 12,
		"grid_height": 9,
		"player_start": Vector2i(1, 4),
		"door_pos": Vector2i(10, 4),
		"walls": [
			Vector2i(0,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0), Vector2i(10,0), Vector2i(11,0),
			Vector2i(0,1), Vector2i(11,1),
			Vector2i(0,2), Vector2i(11,2),
			Vector2i(0,3), Vector2i(11,3),
			Vector2i(0,4), Vector2i(11,4),
			Vector2i(0,5), Vector2i(11,5),
			Vector2i(0,6), Vector2i(11,6),
			Vector2i(0,7), Vector2i(11,7),
			Vector2i(0,8), Vector2i(1,8), Vector2i(2,8), Vector2i(3,8), Vector2i(4,8), Vector2i(5,8), Vector2i(6,8), Vector2i(7,8), Vector2i(8,8), Vector2i(9,8), Vector2i(10,8), Vector2i(11,8),
		],
		"crates": [
			{"pos": Vector2i(3, 2), "val": vals[0]["val"], "theme": vals[0]["theme"]},
			{"pos": Vector2i(3, 4), "val": vals[1]["val"], "theme": vals[1]["theme"]},
			{"pos": Vector2i(3, 6), "val": vals[2]["val"], "theme": vals[2]["theme"]},
			{"pos": Vector2i(2, 3), "val": vals[3]["val"], "theme": vals[3]["theme"]},
			{"pos": Vector2i(2, 5), "val": vals[4]["val"], "theme": vals[4]["theme"]}
		],
		"plates": [
			{"pos": Vector2i(8, 2), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot (A)", "id": "comp_A"},
			{"pos": Vector2i(8, 4), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot (+B)", "id": "comp_B"},
			{"pos": Vector2i(8, 6), "type": SokoPlate.ConditionType.ANY_VALUE, "val": 0, "label": "Slot (×C)", "id": "comp_C"}
		]
	}
