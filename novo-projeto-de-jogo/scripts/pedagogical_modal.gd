class_name SokoPedagogicalModal
extends CanvasLayer

signal closed

@onready var close_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CloseBtn
@onready var copy_btn: Button = $CenterContainer/PanelContainer/Margin/VBox/Header/CopyBtn
@onready var copy_status_label: Label = $CenterContainer/PanelContainer/Margin/VBox/Header/CopyStatus
@onready var rich_text: RichTextLabel = $CenterContainer/PanelContainer/Margin/VBox/TextPanel/Scroll/MarginContainer/RichText

const PEDAGOGICAL_TEXT: String = """[b][font_size=20][color=#FFD54F]Justificativa Pedagógica & Matriz Curricular Readequada[/color][/font_size][/b]
[b][font_size=15][color=#81D4FA]SokoMath: Educação Matemática e Pensamento Computacional no Ensino Fundamental I[/color][/font_size][/b]

[color=#E0E0E0]O [b]SokoMath[/b] é uma proposta pedagógica inovadora baseada em jogos digitais (Game-Based Learning), combinando os princípios clássicos de quebra-cabeça lógico-espacial (Sokoban) com os objetos de conhecimento da [b]Matemática[/b] e as diretrizes do [b]Pensamento Computacional[/b].

A aplicação estrutura-se em [b]duas categorias claramente separadas[/b]:
1. [b]Matemática por Ano Escolar (1º ao 5º Ano):[/b] Trilha curricular principal contendo 10 fases por série (50 fases no total), rigorosamente calibradas para a faixa etária e alinhadas aos campos de Números, Álgebra inicial, Geometria, Grandezas e Medidas, e Probabilidade e Estatística.
2. [b]Desafios Extras — Lógica Computacional:[/b] Modalidade complementar que reúne algoritmos, padrões recursivos, orientação espacial, tomada de decisão (Se... Então...), portas lógicas visuais (AND / OR com linguagem infantil), filtragem multifatorial e depuração de instruções (debugging).[/color]

---

[b][font_size=16][color=#80CBC4]1. Matriz Curricular de Matemática por Ano Escolar[/color][/font_size][/b]

[b][color=#69F0AE]• 1º ANO: Contagem, Comparação e Sequências (6 a 7 anos)[/color][/b]
• [b]Habilidades Principais:[/b] EF01MA01, EF01MA02, EF01MA03, EF01MA04, EF01MA06, EF01MA08, EF01MA09, EF01MA10.
• [b]Conteúdos:[/b] Contagem de coleções pequenas, correspondência um a um, relações de mais/menos, ordem e posição (número entre), ordenação crescente, padrões visuais de cores/formas, sequências de +1 e situações concretas de juntar e retirar.
• [b]Foco Pedagógico:[/b] Apoio visual concreto, enunciados curtos e resolução investigativa sem abstrações precoces.

[b][color=#40C4FF]• 2º ANO: Comparação, Composição e Padrões (7 a 8 anos)[/color][/b]
• [b]Habilidades Principais:[/b] EF02MA01, EF02MA05, EF02MA06, EF02MA08, EF02MA09.
• [b]Conteúdos:[/b] Leitura e ordenação de dezenas, comparação (> e <), localização na reta numérica, composição de números (dezenas e unidades), cálculo mental da adição, subtração no significado de completar, complementos para 100, paridade por agrupamento de dois em dois e sequências com saltos de 5 em 5.
• [b]Foco Pedagógico:[/b] Linguagem clara para docentes e crianças, substituindo jargões formais por conceitos práticos.

[b][color=#FFB74D]• 3º ANO: Operações e Regularidades (8 a 9 anos)[/color][/b]
• [b]Habilidades Principais:[/b] EF03MA05, EF03MA06, EF03MA07, EF03MA08, EF03MA09, EF03MA10.
• [b]Conteúdos:[/b] Adição com estratégias de decomposição, subtração em situações-problema do cotidiano (sem imposição de terminologia técnica), multiplicação como parcelas iguais e como arranjos retangulares, fatos básicos da tabuada (2, 3, 4, 5 e 10), divisão como repartição equitativa e de medida (quantos cabem), noções de metade e terça parte, e sequências por saltos de 4 em 4.
• [b]Foco Pedagógico:[/b] Operações contextualizadas em compras, feiras e organização espacial.

[b][color=#CE93D8]• 4º ANO: Operações, Frações e Medidas (9 a 10 anos)[/color][/b]
• [b]Habilidades Principais:[/b] EF04MA03, EF04MA04, EF04MA05, EF04MA06, EF04MA07, EF04MA09, EF04MA20, EF04MA21, EF04MA27.
• [b]Conteúdos:[/b] Adição e subtração com centenas, multiplicação em cenários significativos, divisão e interpretação do resto, relação inversa entre multiplicação e divisão, estimativa e cálculo mental (fatores de 100), frações unitárias (1/4 de uma quantidade), medição de perímetro e área em malha quadriculada, e leitura de tabelas e gráficos.
• [b]Readequação Curricular:[/b] Portas lógicas, circuitos booleanos e expressões compostas foram deslocadas para os Desafios Extras, mantendo a trilha focada em frações, operações e medidas.

[b][color=#FFD54F]• 5º ANO: Frações, Decimais e Problemas (10 a 11 anos)[/color][/b]
• [b]Habilidades Principais:[/b] EF05MA01, EF05MA02, EF05MA03, EF05MA04, EF05MA06, EF05MA07, EF05MA08, EF05MA12, EF05MA15, EF05MA20.
• [b]Conteúdos:[/b] Valor posicional em números naturais, fração como parte do todo e resultado de divisão (3/4 de 20), comparação de frações com apoio visual, frações equivalentes (2/4 = 1/2), números decimais e troco no sistema monetário, porcentagens usuais (50% e 25%), proporcionalidade direta e cálculo de área retangular.
• [b]Readequação Curricular:[/b] Expressões algébricas com incógnitas, inequações e critérios abstratos foram substituídos por frações, decimais no cotidiano e leitura de dados.

---

[b][font_size=16][color=#A5D6A7]2. Modalidade Complementar: Desafios Extras — Lógica Computacional[/color][/font_size][/b]

Esta modalidade oferece um ambiente investigativo de Pensamento Computacional para estudantes que desejam aprofundar desafios lógicos:
• [b]Fase 1 (Algoritmos):[/b] Sequência ordenada de passos e planejamento de rota sem bloqueio.
• [b]Fase 2 (Padrões):[/b] Sequências recursivas (+3) e regularidades lógicas.
• [b]Fase 3 (Labirintos):[/b] Orientação espacial e manobras em corredores estreitos.
• [b]Fase 4 (Condicionais):[/b] Estruturas de decisão "Se... Então..." (Se par -> azul; Se ímpar -> verde).
• [b]Fase 5 (Porta Lógica AND):[/b] Circuitos com duas chaves simultaneamente ativas (1 E 1 = Porta Aberta).
• [b]Fase 6 (Porta Lógica OR):[/b] Circuitos com condição alternativa (basta 1 chave ativa).
• [b]Fase 7 (Filtragem):[/b] Classificação simultânea de múltiplos atributos (par e maior que 10).
• [b]Fase 8 (Debugging):[/b] Identificação e substituição de instrução com erro (depuração de sensor).
• [b]Fase 9 (Circuitos Combinados):[/b] Integração de chaves lógicas coordenadas.
• [b]Fase 10 (Desafio Mestre):[/b] Síntese completa de algoritmos e otimização de passos.

---

[b][font_size=16][color=#FF8A80]3. Acessibilidade e Desenho Universal para a Aprendizagem (DUA)[/color][/font_size][/b]
• Navegação integral por teclado com foco visível e ordem lógica de tabulação.
• Não dependência exclusiva de cor: uso concomitante de rótulos textuais, formas, ícones e alto contraste.
• Mecânica de [i]Desfazer Passo (Undo)[/i] para autorregulação do erro sem penalização punitiva.
• Interface responsiva para computadores, tablets e celulares (com D-Pad virtual ajustável e gestos de toque).

[color=#90A4AE][i]Trilha pedagógica inspirada nas diretrizes curriculares do Ensino Fundamental I (BNCC / Currículo Paulista) e BNCC Computação. Não possui caráter de certificação oficial.[/i][/color]
"""

func _ready() -> void:
	visible = false
	if rich_text:
		rich_text.selection_enabled = true
		rich_text.context_menu_enabled = true
		rich_text.bbcode_enabled = true
		rich_text.text = PEDAGOGICAL_TEXT

	if close_btn:
		close_btn.focus_mode = Control.FOCUS_ALL
		close_btn.pressed.connect(func():
			SoundManager.play("click")
			close()
		)

	if copy_btn:
		copy_btn.focus_mode = Control.FOCUS_ALL
		copy_btn.pressed.connect(copy_to_clipboard)

func open() -> void:
	visible = true
	if copy_status_label:
		copy_status_label.text = ""
	if close_btn:
		close_btn.grab_focus()

func close() -> void:
	visible = false
	closed.emit()

func copy_to_clipboard() -> void:
	SoundManager.play("click")
	var plain_text := rich_text.get_parsed_text() if rich_text else PEDAGOGICAL_TEXT
	DisplayServer.clipboard_set(plain_text)

	if copy_status_label:
		copy_status_label.text = "Copiado com sucesso!"
		var tween := create_tween()
		tween.tween_property(copy_status_label, "modulate:a", 1.0, 0.1)
		tween.tween_interval(2.0)
		tween.tween_property(copy_status_label, "modulate:a", 0.0, 0.4)
