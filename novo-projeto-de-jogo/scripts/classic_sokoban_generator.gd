class_name ClassicSokobanGenerator
extends RefCounted

## Gerador de fases para o Modo Prêmio (Sokoban Clássico sem matemática).
## Implementa quebra-cabeças autênticos de Sokoban com corredores estreitos,
## estrangulamentos (chokepoints) e nichos de manobra (alcoves).
## As caixas iniciam fisicamente bloqueando os caminhos, e empurrá-las para os
## nichos corretos desobstrui o trajeto até a porta de saída.
## A cada partida, transformações isomórficas (espelhamento X e Y) e variações
## de cores garantem dinamismo preservando 100% da solubilidade matemática.

const DIRS: Array[Vector2i] = [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]

# 10 Blueprints autênticos de corredores, estrangulamentos e nichos de desvio
# # = Parede, @ = Jogador, $ = Caixa, . = Nicho / Alvo, E = Porta de Saída
const BLUEPRINTS: Array[Dictionary] = [
	# Nível 1: O Primeiro Corredor (1 caixa, 6 empurrões)
	{
		"title": "O Primeiro Corredor",
		"desc": "A caixa bloqueia o corredor principal. Empurre-a para o nicho para abrir caminho até a saída!",
		"optimal": 10,
		"ascii": [
			"########",
			"#   .  #",
			"#  ### #",
			"# @ $  E",
			"#  ### #",
			"#      #",
			"########"
		]
	},

	# Nível 2: A Encruzilhada em T (2 caixas, 10 empurrões)
	{
		"title": "A Encruzilhada em T",
		"desc": "Duas caixas trancam a bifurcação. Desvie as peças para os nichos e libere o acesso ao portão leste!",
		"optimal": 16,
		"ascii": [
			"#########",
			"#   .   #",
			"#  ###  #",
			"# @ $ $ E",
			"#  ###  #",
			"#   .   #",
			"#########"
		]
	},

	# Nível 3: O Gargalo Central (2 caixas, 7 empurrões)
	{
		"title": "O Gargalo Central",
		"desc": "A divisória possui um único ponto de passagem. Manobre as caixas para alcançar a câmara leste!",
		"optimal": 15,
		"ascii": [
			"##########",
			"#   #  . #",
			"#   #    #",
			"# @ $  $ E",
			"#   #    #",
			"#   #  . #",
			"##########"
		]
	},

	# Nível 4: O Circuito do Pilar (2 caixas, 8 empurrões)
	{
		"title": "O Circuito do Pilar",
		"desc": "Use o anel de circulação ao redor do pilar para empurrar as caixas de ambos os lados!",
		"optimal": 18,
		"ascii": [
			"##########",
			"#        #",
			"#  .  .  #",
			"#  ####  #",
			"# @$  $  E",
			"#        #",
			"##########"
		]
	},

	# Nível 5: O Desvio em S (3 caixas, 12 empurrões)
	{
		"title": "O Desvio em S",
		"desc": "Três caixas obstruem a rota sinuosa. Estacione cada peça em seu nicho na ordem correta!",
		"optimal": 22,
		"ascii": [
			"###########",
			"#   .     #",
			"#  ### #  #",
			"#  #   #$ E",
			"# @$   #  #",
			"#  #$  #  #",
			"#  .   .  #",
			"###########"
		]
	},

	# Nível 6: Câmaras Conectadas (3 caixas, 15 empurrões)
	{
		"title": "Câmaras Conectadas",
		"desc": "Duas salas interligadas com trânsito bloqueado. Transfira as caixas para os nichos perimetrais!",
		"optimal": 24,
		"ascii": [
			"###########",
			"#   .   . #",
			"#  ###    #",
			"# @$ $ $  E",
			"#    ###  #",
			"#   .     #",
			"###########"
		]
	},

	# Nível 7: Corredor de Armazenagem (3 caixas, 12 empurrões)
	{
		"title": "Corredor de Armazenagem",
		"desc": "Três caixas trancam a ala de carga. Use o túnel inferior para contornar e empurrar as peças para as baias!",
		"optimal": 26,
		"ascii": [
			"############",
			"#   . . .  #",
			"#   # # #  #",
			"# @ $ $ $  E",
			"#   # # #  #",
			"#          #",
			"############"
		]
	},

	# Nível 8: O Pátio Oposto (3 caixas, 9 empurrões)
	{
		"title": "O Pátio Oposto",
		"desc": "Caixas dispostas em posições opostas. Use a câmara de retorno para desbloquear o corredor leste!",
		"optimal": 24,
		"ascii": [
			"############",
			"#   .   .  #",
			"#   #   #  #",
			"# @ $   $  E",
			"#   # $ #  #",
			"#     .    #",
			"#          #",
			"############"
		]
	},

	# Nível 9: A Grande Ala (3 caixas, 14 empurrões)
	{
		"title": "A Grande Ala",
		"desc": "Três grandes nichos distribuídos entre salas. Desobstrua a encruzilhada para liberar o portão!",
		"optimal": 28,
		"ascii": [
			"############",
			"#  .     . #",
			"#  ##   ## #",
			"# @ $ $ $  E",
			"#  ##   ## #",
			"#    .     #",
			"#          #",
			"############"
		]
	},

	# Nível 10: O Mestre do Armazém (4 caixas, 16 empurrões)
	{
		"title": "O Enigma do Mestre Sokoban",
		"desc": "O teste supremo do armazém clássico: desobstrua todas as quatro câmaras para abrir o portal final!",
		"optimal": 36,
		"ascii": [
			"#############",
			"#  . . . .  #",
			"#  # # # #  #",
			"# @$ $ $ $  E",
			"#  # # # #  #",
			"#           #",
			"#############"
		]
	}
]

static func generate_level(level_idx: int) -> Dictionary:
	var idx := clampi(level_idx, 0, BLUEPRINTS.size() - 1)
	var bp: Dictionary = BLUEPRINTS[idx]
	var ascii_lines: Array = bp["ascii"]

	# Parse da matriz ASCII base
	var h: int = ascii_lines.size()
	var w: int = 0
	for line in ascii_lines:
		w = maxi(w, (line as String).length())

	var base_walls: Array[Vector2i] = []
	var base_crates: Array[Vector2i] = []
	var base_plates: Array[Vector2i] = []
	var base_player := Vector2i(1, 1)
	var base_door := Vector2i(w - 1, int(h / 2.0))

	for y in range(h):
		var line: String = ascii_lines[y]
		for x in range(line.length()):
			var ch: String = line[x]
			match ch:
				"#":
					base_walls.append(Vector2i(x, y))
				"$":
					base_crates.append(Vector2i(x, y))
				".":
					base_plates.append(Vector2i(x, y))
				"@":
					base_player = Vector2i(x, y)
				"E":
					base_door = Vector2i(x, y)

	# Variação Dinâmica: Sorteia espelhamento horizontal e/ou vertical
	# Transforma o layout visualmente a cada partida preservando 100% da lógica e solubilidade
	var flip_x: bool = randf() > 0.5
	var flip_y: bool = randf() > 0.5

	var final_walls: Array[Vector2i] = []
	for wp in base_walls:
		final_walls.append(_transform_pt(wp, w, h, flip_x, flip_y))

	var final_crates_pos: Array[Vector2i] = []
	for cp in base_crates:
		final_crates_pos.append(_transform_pt(cp, w, h, flip_x, flip_y))

	var final_plates_pos: Array[Vector2i] = []
	for pp in base_plates:
		final_plates_pos.append(_transform_pt(pp, w, h, flip_x, flip_y))

	var final_player: Vector2i = _transform_pt(base_player, w, h, flip_x, flip_y)
	var final_door: Vector2i = _transform_pt(base_door, w, h, flip_x, flip_y)

	# Assegura que a porta de saída não possui bloco de parede sobreposto
	final_walls.erase(final_door)

	# Paletas de cores para caixas (variam dinamicamente a cada partida)
	var themes := ["wood", "blue", "red", "green", "yellow", "beige"]
	themes.shuffle()

	var crates_data: Array[Dictionary] = []
	for i in range(final_crates_pos.size()):
		crates_data.append({
			"pos": final_crates_pos[i],
			"val": 0,
			"theme": themes[i % themes.size()],
			"show_badge": false
		})

	var plates_data: Array[Dictionary] = []
	for i in range(final_plates_pos.size()):
		plates_data.append({
			"pos": final_plates_pos[i],
			"type": SokoPlate.ConditionType.ANY_VALUE,
			"val": 0,
			"label": "",
			"id": "classic_slot_%d" % i
		})

	return {
		"grade": 0,
		"is_classic": true,
		"level_index": idx,
		"title": bp.get("title", "Sokoban Clássico"),
		"bncc_code": "Modo Prêmio: Sokoban Clássico",
		"bncc_desc": "Empurre as caixas para os nichos de armazenagem e libere o caminho até a saída!",
		"rule_description": bp.get("desc", "Desobstrua o corredor para a saída!"),
		"rule_type": "TARGET_PLATES",
		"target_value": final_crates_pos.size(),
		"optimal_steps": bp.get("optimal", 20),
		"grid_width": w,
		"grid_height": h,
		"player_start": final_player,
		"door_pos": final_door,
		"walls": final_walls,
		"crates": crates_data,
		"plates": plates_data
	}

static func _transform_pt(p: Vector2i, w: int, h: int, flip_x: bool, flip_y: bool) -> Vector2i:
	var nx: int = (w - 1 - p.x) if flip_x else p.x
	var ny: int = (h - 1 - p.y) if flip_y else p.y
	return Vector2i(nx, ny)
