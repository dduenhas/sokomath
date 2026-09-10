class_name SokoPedagogicalModal
extends CanvasLayer

signal closed

@onready var close_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CloseBtn
@onready var copy_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CopyBtn
@onready var copy_status_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Header/CopyStatus
@onready var rich_text: RichTextLabel = $CenterContainer/PanelContainer/Margin/VBox/TextPanel/Scroll/MarginContainer/RichText

const PEDAGOGICAL_TEXT: String = """[b][font_size=20][color=#FFD54F]Justificativa Pedagógica & Matriz Curricular Integrada[/color][/font_size][/b]
[b][font_size=15][color=#81D4FA]SokoMath: Educação Matemática e Pensamento Computacional no Ensino Fundamental I[/color][/font_size][/b]

[color=#E0E0E0]O [b]SokoMath[/b] é uma proposta pedagógica inovadora baseada em jogos digitais (Game-Based Learning), combinando os princípios clássicos de quebra-cabeça lógico-espacial (Sokoban) com os objetos de conhecimento da [b]Matemática[/b] e as diretrizes da [b]BNCC Computação[/b] (Complemento à Base Nacional Comum Curricular, homologado pela Resolução CNE/CP nº 1/2022).[/color]

---

[b][font_size=16][color=#A5D6A7]1. Pilares da BNCC Computação (Anos Iniciais)[/color][/font_size][/b]

A aplicação desenvolve de forma ativa e empírica os quatro eixos estruturantes do Pensamento Computacional:
• [b]Decomposição:[/b] O estudante precisa fracionar o desafio principal da fase em subproblemas sequenciais (posicionar primeiro o bloco mais restrito, desobstruir corredores, ativar alvos na ordem adequada).
• [b]Reconhecimento de Padrões:[/b] Identificação de regularidades numéricas (paridade 2, 4, 6...; saltos aritméticos +3, +5; propriedades multiplicativas; regras booleanas).
• [b]Abstração:[/b] Capacidade de filtrar detalhes irrelevantes e focar nas variáveis essenciais do problema (valores dos blocos, regras da placa receptora e restrições de movimento).
• [b]Algoritmos e Otimização:[/b] Planejamento ordenado de passos executáveis. O jogo incentiva a eficiência algorítmica por meio do indicador de [i]Custo Ótimo de Passos[/i] e estrelas de desempenho, ensinando que a resolução eficaz busca o menor custo computacional.
• [b]Depuração (Debugging):[/b] A ferramenta de [i]Desfazer Passo (Undo)[/i] permite ao estudante inspecionar seu próprio raciocínio em tempo de execução, identificar onde o erro lógico ocorreu e reestruturar sua hipótese sem punições frustrantes.

---

[b][font_size=16][color=#80CBC4]2. Alinhamento com a BNCC Matemática por Ano Escolar[/color][/font_size][/b]

[b][color=#69F0AE]• 1º ANO: Fundamentos Lógicos, Contagem e Ordenação[/color][/b]
• [b]EF01MA01 / EF01MA02:[/b] Contagem de rotina, correspondência um a um, quantificação e leitura de números naturais.
• [b]EF01MA09 / EF01MA10:[/b] Organização e ordenação de elementos segundo critérios de sequência lógica crescente simples (1, 2, 3), sem bloqueios complexos.
• [b]Objetivo:[/b] Compreender o conceito de alvo, posições no espaço bidimensional e equivalência de valores.

[b][color=#40C4FF]• 2º ANO: Paridade, Relações de Ordem e Somas Iniciais[/color][/b]
• [b]EF02MA01 / EF02MA05:[/b] Compreensão da paridade dos números naturais (identificação empírica de pares e ímpares através de placas condicionais).
• [b]EF02MA06 / EF02MA09:[/b] Relações de ordem e desigualdade numérica (critérios relacionais de maior que > e menor que <), além de sequências recursivas com passos de 2 em 2.
• [b]Objetivo:[/b] Desenvolver o julgamento lógico condicional ("Se par, vá para a placa X; Se ímpar, vá para a placa Y").

[b][color=#FFB74D]• 3º ANO: Operações Aritméticas e Tomada de Decisão[/color][/b]
• [b]EF03MA05 / EF03MA06:[/b] Operações de adição e subtração como operações inversas, cálculo mental e estimativas.
• [b]EF03MA10:[/b] Identificação de regularidades em sequências numéricas compostas (saltos de +3, +5, múltiplos de fechamento).
• [b]Objetivo:[/b] Aplicação de operações aritméticas como chave de liberação física das placas para abertura de caminhos.

[b][color=#CE93D8]• 4º ANO: Multiplicação, Múltiplos e Portas Lógicas[/color][/b]
• [b]EF04MA04 / EF04MA05:[/b] Relações multiplicativas, propriedades das operações e identificação de fatores e múltiplos comuns.
• [b]EF04MA11 / EF04MA12:[/b] Relações de igualdade com sentenças abertas (estruturação inicial do pensamento pré-algébrico) e lógica booleana combinatória (placas que funcionam como operador AND lógico).
• [b]Objetivo:[/b] Raciocínio combinatório e antecipação de estados futuros em sistemas com múltiplos requisitos simultâneos.

[b][color=#FFD54F]• 5º ANO: Expressões Numéricas, Precedência e Áreas[/color][/b]
• [b]EF05MA07 / EF05MA08:[/b] Resolução de problemas envolvendo operações combinadas com e sem parênteses (ordem de precedência matemática).
• [b]EF05MA10 / EF05MA11:[/b] Relações de proporcionalidade, circuitos lógicos integrados e propriedades de divisibilidade.
• [b]Objetivo:[/b] Síntese e consolidação dos conhecimentos matemáticos fundamentais por meio da resolução autônoma de quebra-cabeças complexos.

---

[b][font_size=16][color=#FF8A80]3. Metodologia de Uso em Sala de Aula[/color][/font_size][/b]
1. [b]Exploração Livre e Investigativa:[/b] O aluno experimenta hipóteses diretamente com o personagem e blocos.
2. [b]Institucionalização do Saber:[/b] O professor pode pausar a atividade e discutir com a turma: "Qual padrão vocês notaram nas placas?", "Quantos passos foram necessários?", "Como poderíamos resolver em menos passos?".
3. [b]Inclusão e Acessibilidade:[/b] Recursos visuais (alto contraste, modo daltônico, ajuste de escala de texto e controles virtuais) garantem o Desenho Universal para a Aprendizagem (DUA), acolhendo a neurodiversidade e diferentes estilos de aprendizagem.

[color=#90A4AE][i]Documento elaborado para fins pedagógicos, planejamento docente e comprovação de alinhamento com os referenciais curriculares nacionais.[/i][/color]
"""

func _ready() -> void:
	visible = false
	if rich_text:
		rich_text.selection_enabled = true
		rich_text.context_menu_enabled = true
		rich_text.bbcode_enabled = true
		rich_text.text = PEDAGOGICAL_TEXT

	if close_btn:
		close_btn.focus_mode = Control.FOCUS_NONE
		close_btn.pressed.connect(func():
			SoundManager.play("click")
			close()
		)

	if copy_btn:
		copy_btn.focus_mode = Control.FOCUS_NONE
		copy_btn.pressed.connect(copy_to_clipboard)

func open() -> void:
	visible = true
	if copy_status_label:
		copy_status_label.text = ""

func close() -> void:
	visible = false
	closed.emit()

func copy_to_clipboard() -> void:
	SoundManager.play("click")
	# Extrai texto limpo sem tags bbcode para a área de transferência
	var plain_text := rich_text.get_parsed_text() if rich_text else PEDAGOGICAL_TEXT
	DisplayServer.clipboard_set(plain_text)

	if copy_status_label:
		copy_status_label.text = "Texto copiado com sucesso!"
		var tween := create_tween()
		tween.tween_property(copy_status_label, "modulate:a", 1.0, 0.1)
		tween.tween_interval(3.0)
		tween.tween_property(copy_status_label, "modulate:a", 0.0, 0.5)
