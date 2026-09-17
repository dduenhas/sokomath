# 🦉 SokoMath: Computação & Matemática (1º ao 5º Ano)

<p align="center">
  <b>Jogo educativo digital de raciocínio lógico-espacial e resolução de problemas, integrando os objetivos de aprendizagem da Matemática e da Computação para os Anos Iniciais do Ensino Fundamental.</b>
</p>

<p align="center">
  <a href="./SOKOMATH_DOCUMENTACAO_PEDAGOGICA_E_TECNICA.pdf"><img src="https://img.shields.io/badge/Documentação-PDF%20Oficial%20(15%20pág.)-red?style=for-the-badge&logo=adobeacrobatreader" alt="Documentação PDF"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Engine-Godot%204.x-blue?logo=godotengine" alt="Godot 4">
  <img src="https://img.shields.io/badge/BNCC-Matemática%20(2018)-brightgreen" alt="BNCC Matemática">
  <img src="https://img.shields.io/badge/BNCC%20Computação-Res.%20CNE%2FCEB%20nº%201%2F2022-orange" alt="BNCC Computação">
  <img src="https://img.shields.io/badge/Plataformas-Desktop%20%7C%20Tablets%20%7C%20Smartphones-purple" alt="Plataformas">
  <img src="https://img.shields.io/badge/Acessibilidade-DUA%20%2F%20Alto%20Contraste%20%2F%20Touch-teal" alt="Acessibilidade">
</p>

> 📄 **RELATÓRIO & DOCUMENTAÇÃO PEDAGÓGICA INTEGRAL (PDF):**  
> Para consultar a fundamentação teórica completa (modos de Bruner, pedagogia do erro construtivo, mediação em Vygotsky e DUA), as diretrizes da Resolução CNE/CEB nº 1/2022, a arquitetura técnica em Godot 4 e a **matriz tabular detalhada de todas as 60 fases**, acesse o documento oficial:  
> 👉 **[Clique aqui para abrir ou baixar o PDF: SOKOMATH_DOCUMENTACAO_PEDAGOGICA_E_TECNICA.pdf](./SOKOMATH_DOCUMENTACAO_PEDAGOGICA_E_TECNICA.pdf)** *(15 páginas, ~856 KB, Edição Revisada 2026)*

---

## 📖 Visão Geral

O **SokoMath** é uma experiência lúdica e pedagógica baseada nas clássicas mecânicas de *Sokoban* (empurrar caixas em um grid bidimensional). Nele, as regras de ativação dos alvos (placas de pressão) e liberação das portas de saída são regidas por **desafios matemáticos e operadores computacionais**, estimulando o pensamento analítico, o planejamento estratégico e a autodepuração de erros.

O jogo foi desenvolvido com foco no **Desenho Universal para a Aprendizagem (DUA)**, sendo 100% responsivo para computadores, tablets e smartphones, com interface adaptável, controles por toque na tela (D-Pad e gestos de deslizamento) e recursos completos de acessibilidade.

---

## 🎯 Pilares da BNCC Computação

Em consonância com as Normas sobre Computação na Educação Básica — Complemento à BNCC (Resolução CNE/CEB nº 1, de 4 de outubro de 2022), o SokoMath desenvolve os eixos estruturantes do **Pensamento Computacional**:

1. **🧩 Decomposição:** O jogador fraciona a solução do nível em etapas sucessivas: planejar a liberação de vias, desobstruir corredores e posicionar caixas na ordem de dependência correta.
2. **🔍 Reconhecimento de Padrões:** Identificação de propriedades numéricas recursivas (números pares e ímpares, progressões aritméticas de +2, +3, +5, múltiplos e operadores relacionais).
3. **💡 Abstração:** Filtragem de elementos do cenário para focar nas variáveis essenciais do problema (valor da caixa, condição lógica da placa receptora e restrições de movimento).
4. **⚙️ Algoritmos e Otimização:** Formulação de sequências ordenadas de ações. O jogo premia a eficácia com o sistema de **Custo Ótimo de Passos** e classificação em estrelas.
5. **🐞 Depuração (Debugging):** Por meio do botão de **Desfazer (Undo)**, a criança pode retroceder passos específicos para analisar onde ocorreu a falha lógica, remodelando sua estratégia sem a frustração de recomeçar do zero.

---

## 📚 Matriz Curricular por Ano Escolar (BNCC Matemática)

O jogo organiza seus desafios pedagógicos do 1º ao 5º ano do Ensino Fundamental I com **10 fases progressivas por ano letivo** (**50 fases curriculares de Matemática no total**), inspiradas nas habilidades da BNCC e Currículo Paulista:

| Ano | Fases | Faixa Etária | Temática Central | Habilidades BNCC Principais | Mecânica no Jogo |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **1º Ano** | 10 Fases | 6 a 7 anos | Contagem, Comparação e Sequências | **EF01MA01, EF01MA02, EF01MA03, EF01MA04, EF01MA06, EF01MA08, EF01MA09, EF01MA10** | Contagem concreta, correspondência um a um, mais/menos, ordem entre, sequências (+1) e juntar/retirar. |
| **2º Ano** | 10 Fases | 7 a 8 anos | Comparação, Composição e Padrões | **EF02MA01, EF02MA05, EF02MA06, EF02MA08, EF02MA09** | Ordenação de dezenas, maior/menor (> 15), reta numérica, composição 20+5, cálculo mental, paridade e saltos (+5). |
| **3º Ano** | 10 Fases | 8 a 9 anos | Operações e Regularidades | **EF03MA05, EF03MA06, EF03MA07, EF03MA08, EF03MA09, EF03MA10** | Adição por decomposição, subtração prática (estoque), multiplicação (parcelas e retângulos), divisão e saltos (+4). |
| **4º Ano** | 10 Fases | 9 a 10 anos | Operações, Frações e Medidas | **EF04MA03, EF04MA04, EF04MA05, EF04MA06, EF04MA07, EF04MA09, EF04MA20, EF04MA21, EF04MA27** | Operações com centenas, multiplicação no cotidiano, divisão e resto, operação inversa, frações unitárias (1/4), perímetro, área e gráficos. |
| **5º Ano** | 10 Fases | 10 a 11 anos | Frações, Decimais e Problemas | **EF05MA01, EF05MA02, EF05MA03, EF05MA04, EF05MA06, EF05MA07, EF05MA08, EF05MA12, EF05MA15, EF05MA20** | Valor posicional, frações de quantidade, frações equivalentes, decimais e troco monetário, porcentagens (50% e 25%), proporcionalidade e áreas. |

---

## 💡 Modalidade Complementar: Desafios Extras — Lógica Computacional

Acessível por aba dedicada na tela de seleção, esta modalidade reúne **10 desafios de Pensamento Computacional**:
* **Fase 1:** Algoritmos e Sequência de Passos (planejamento sem bloqueios).
* **Fase 2:** Padrões e Sequências Recursivas (+3).
* **Fase 3:** Labirinto e Orientação Espacial (manobra em corredores).
* **Fase 4:** Tomada de Decisão Condicional (Se... Então... / Par e Ímpar).
* **Fase 5:** Circuito Lógico E (Porta AND com representação visual e linguagem infantil).
* **Fase 6:** Circuito Lógico OU (Porta OR alternativa).
* **Fase 7:** Classificação e Filtragem Multifatorial (par e maior que 10).
* **Fase 8:** Depuração Simples de Instruções (Debugging).
* **Fase 9:** Circuitos Lógicos Combinados.
* **Fase 10:** O Grande Desafio Algorítmico Mestre.

---

## 🏆 Modo Bônus: Sokoban Clássico (10 Fases Dinâmicas)

Ao concluir as fases ou diretamente pela aba de Desafios Extras, o jogador pode desfrutar do **Sokoban Clássico**:
* **Lógica Tradicional de Desobstrução:** Pura mecânica de puzzle espacial e pensamento algorítmico, onde caixas bloqueiam passagens estratégicas. O objetivo é desviar as caixas para nichos de armazenagem laterais a fim de liberar o caminho até a saída.
* **10 Níveis Exclusivos de Desafio:** Variando de 1 a 4 caixas e progressão de 6 a 15 empurrões mínimos (*O Primeiro Corredor*, *A Encruzilhada em T*, *O Gargalo Central*, *O Circuito do Pilar*, *O Desvio em S*, *Câmaras Conectadas*, *Corredor de Armazenagem*, *O Pátio Oposto*, *A Grande Ala* e *O Enigma do Mestre Sokoban*).
* **Geração e Variação Dinâmica:** A cada partida, o gerador aplica espelhamentos verticais/horizontais e temas visuais variados, criando tabuleiros com visual renovado a cada tentativa sem perder a solubilidade matemática.
* **Caminho até a Saída:** Posicionar as caixas nos nichos destranca o portão; em seguida, o jogador guia o personagem até a saída para celebrar a vitória.

---

## ♿ Recursos de Acessibilidade e Inclusão

Acessíveis a qualquer momento através do botão **♿ Acessibilidade** na barra superior:

* **Modo Alto Contraste & Daltônicos:** Realce de bordas das peças, caixas e alvos com cores contrastantes e símbolos gráficos além da cor.
* **Texto e Interface Ampliada:** Aumento proporcional da tipografia e botões para facilitar leitura em telas menores e auxiliar estudantes com baixa visão.
* **Controles Virtuais Touch (D-Pad):** Botões direcionais grandes e ergonômicos na tela para uso em tablets e smartphones.
* **Gestos de Deslizar (Swipe):** Permite movimentar o personagem deslizando o dedo em qualquer área da tela.
* **Redução de Movimento:** Desativação de efeitos visuais pulsantes e animações contínuas para estudantes sensíveis a estímulos visuais excessivos.
* **Mixer de Áudio Flexível:** Ajuste independente e fino do volume de Música de fundo e Efeitos Sonoros com botão de teste.

---

## 🦉 Guia Pedagógico Integrado (Botão 🦉🎓)

O jogo conta com um botão dedicado com o ícone da **Corujinha Pedagógica (🦉🎓)** que abre um modal com toda a fundamentação pedagógica, objetivos de aprendizagem e competências da BNCC e BNCC Computação.
* **Texto Selecionável:** Permite marcar e copiar trechos com o mouse, teclado ou toque prolongado em dispositivos móveis.
* **Cópia Rápida em 1 Clique:** Botão `📋 Copiar Texto Completo` que envia toda a justificativa diretamente para a área de transferência, ideal para professores copiarem para seus planos de aula e relatórios pedagógicos.

---

## 📑 Documentação Pedagógica e Técnica Oficial (PDF)

O projeto conta com um relatório editorial de **15 páginas**, elaborado para submissão acadêmica, avaliação curricular e orientação docente:

* 📥 **Documento PDF Oficial:** [`SOKOMATH_DOCUMENTACAO_PEDAGOGICA_E_TECNICA.pdf`](./SOKOMATH_DOCUMENTACAO_PEDAGOGICA_E_TECNICA.pdf) *(Edição Revisada 2026)*
* 🛠️ **Script Gerador Automatizado:** [`build_sokomath_doc_pdf.py`](./build_sokomath_doc_pdf.py) *(Python + Edge Headless)*
* 🌐 **Template HTML / CSS Paged Media:** [`sokomath_documentacao.html`](./sokomath_documentacao.html)
* 📋 **Base Textual da Revisão Crítica:** [`SokoMath_documentacao_revisada.txt`](./SokoMath_documentacao_revisada.txt)

### Estrutura do Relatório
1. **Ficha Técnica & Escopo de Validação:** Metadados, DUA/UDL e explicitação ética da correspondência curricular.
2. **Visão Pedagógica e Limites da Proposta:** Raciocínio espacial em grade, planejamento prévio e papel ativo da mediação docente.
3. **Arquitetura Técnica (Godot 4.3 LTS):** Grid discreto (`Vector2i`), histórico de estados (`history_stack` / Undo) e validação estática de autoria (distância Manhattan delimitada).
4. **Fundamentos Didáticos, Erro e Metacognição:** Modos de Bruner (enativo, icônico e simbólico) integrados, pedagogia do erro construtivo e *scaffolding* em Vygotsky.
5. **Alinhamento Curricular BNCC:** Matriz das 5 unidades da Matemática e Trilha de Computação fundamentada na Resolução CNE/CEB nº 1/2022.
6. **Acessibilidade, Avaliação Formativa e Auditoria:** Diretrizes DUA, rotina docente em 5 etapas e quadro de auditoria das correções realizadas.
7. **Matriz Curricular Completa (60 Fases):** 1 página A4 dedicada por ano (1º ao 5º Ano) e Trilha Complementar de Computação, com objetivos, caixas e feedbacks.
8. **Análise Gráfica & Interface (HUD):** Gráfico proporcional de eixos temáticos e esquema anotado do HUD com feedback reflexivo.
9. **Autoria e Referências Normativas:** Perfil profissional de Diego Divino Duenhas, portfólio autoral e referências ABNT.

---

## 🎮 Controles

### Teclado (Desktop)
* **Movimentação:** `W`, `A`, `S`, `D` ou `Setas Direcionais`
* **Avançar para Próxima Fase:** Tecla `ESPAÇO` ou `ENTER` no Modal de Vitória
* **Desfazer Passo (Undo):** `Z`
* **Reiniciar Nível:** `R`
* **Menu de Séries / Anos:** `M` ou `TAB`
* **Atalhos Rápidos de Fase:** Teclas numéricas `1` a `5` (ou botões `◀` e `▶` na barra superior)

### Touchscreen (Smartphones e Tablets)
* **D-Pad Virtual na Tela:** Botões direcionais `▲`, `▼`, `◀`, `▶` na base esquerda da tela.
* **Gestos (Swipe):** Deslize o dedo na tela em qualquer direção para caminhar.
* **Ações Rápidas Virtuais:** Botões táteis de `↩ Desfazer` e `🔄 Reiniciar`.

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
* [Godot Engine v4.3+](https://godotengine.org/) (compatível com Godot 4.7)

### Execução no Editor
1. Clone o repositório ou baixe os arquivos do projeto.
2. Abra a engine **Godot 4**.
3. Clique em **Import** (Importar) e selecione o arquivo `novo-projeto-de-jogo/project.godot`.
4. Clique em **Edit** (Editar).
5. Pressione `F5` para rodar a cena principal (`res://scenes/main.tscn`).

### Exportação (Build) & Deploy na Vercel
* O projeto está configurado com renderizador **GL Compatibility**, facilitando exportação para:
  * **HTML5 / Web** (funciona direto no navegador em computadores e celulares)
  * **Android / iOS** (smartphones e tablets)
  * **Windows / Linux / macOS** (executáveis nativos de computador)

### 🌐 Como Publicar na Vercel
O repositório já inclui a build Web compilada na pasta `public/` e o arquivo `vercel.json` com os cabeçalhos de segurança (`COOP/COEP`) necessários para WebAssembly e áudio:
1. Acesse o painel da [Vercel](https://vercel.com/) e clique em **Add New... ➔ Project**.
2. Importe o repositório `dduenhas/sokomath`.
3. Mantenha as configurações padrão (o `vercel.json` e `package.json` já definem `public` como diretório de saída).
4. Clique em **Deploy**! O jogo estará disponível online imediatamente com suporte a navegadores desktop e mobile.

---

## 📄 Licença e Créditos
* **Concepção, Design e Desenvolvimento:** **Diego Divino Duenhas** ([diegoduenhas.com.br](https://diegoduenhas.com.br)).
  * *Designer Gráfico (SENAC SP) & Tecnólogo em Sistemas para Internet (IFSP).*
  * *Monitor Específico de Tecnologia no Projeto São João Mais Saber (UNIFEOB / Prefeitura de São João da Boa Vista, SP).*
* **Assets Gráficos:** Kenney Sokoban Pack (Domínio Público / CC0).
* **Trilha Sonora e Efeitos:** Kenney Audio & Creative Commons.
