# 🦉 SokoMath: Computação & Matemática (1º ao 5º Ano)

<p align="center">
  <b>Jogo educativo digital de raciocínio lógico-espacial e resolução de problemas, integrando os objetivos de aprendizagem da Matemática e da Computação para os Anos Iniciais do Ensino Fundamental.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Engine-Godot%204.x-blue?logo=godotengine" alt="Godot 4">
  <img src="https://img.shields.io/badge/BNCC-Alinhado%201º%20ao%205º%20Ano-brightgreen" alt="BNCC Alinhado">
  <img src="https://img.shields.io/badge/BNCC%20Computação-CNE%2FCP%20nº%201%2F2022-orange" alt="BNCC Computação">
  <img src="https://img.shields.io/badge/Plataformas-Desktop%20%7C%20Tablets%20%7C%20Smartphones-purple" alt="Plataformas">
  <img src="https://img.shields.io/badge/Acessibilidade-DUA%20%2F%20Alto%20Contraste%20%2F%20Touch-teal" alt="Acessibilidade">
</p>

---

## 📖 Visão Geral

O **SokoMath** é uma experiência lúdica e pedagógica baseada nas clássicas mecânicas de *Sokoban* (empurrar caixas em um grid bidimensional). Nele, as regras de ativação dos alvos (placas de pressão) e liberação das portas de saída são regidas por **desafios matemáticos e operadores computacionais**, estimulando o pensamento analítico, o planejamento estratégico e a autodepuração de erros.

O jogo foi desenvolvido com foco no **Desenho Universal para a Aprendizagem (DUA)**, sendo 100% responsivo para computadores, tablets e smartphones, com interface adaptável, controles por toque na tela (D-Pad e gestos de deslizamento) e recursos completos de acessibilidade.

---

## 🎯 Pilares da BNCC Computação

Em consonância com o Complemento à Base Nacional Comum Curricular (Resolução CNE/CP nº 1/2022), o SokoMath desenvolve os quatro eixos estruturantes do **Pensamento Computacional**:

1. **🧩 Decomposição:** O jogador fraciona a solução do nível em etapas sucessivas: planejar a liberação de vias, desobstruir corredores e posicionar caixas na ordem de dependência correta.
2. **🔍 Reconhecimento de Padrões:** Identificação de propriedades numéricas recursivas (números pares e ímpares, progressões aritméticas de +2, +3, +5, múltiplos e operadores relacionais).
3. **💡 Abstração:** Filtragem de elementos do cenário para focar nas variáveis essenciais do problema (valor da caixa, condição lógica da placa receptora e restrições de movimento).
4. **⚙️ Algoritmos e Otimização:** Formulação de sequências ordenadas de ações. O jogo premia a eficácia com o sistema de **Custo Ótimo de Passos** e classificação em estrelas.
5. **🐞 Depuração (Debugging):** Por meio do botão de **Desfazer (Undo)**, a criança pode retroceder passos específicos para analisar onde ocorreu a falha lógica, remodelando sua estratégia sem a frustração de recomeçar do zero.

---

## 📚 Matriz Curricular por Ano Escolar (BNCC Matemática)

O jogo organiza seus desafios progressivamente do 1º ao 5º ano do Ensino Fundamental I, contando com **10 fases progressivas por ano letivo** (**50 fases pedagógicas no total**):

| Ano | Fases | Faixa Etária | Temática Central | Habilidades BNCC Principais | Mecânica no Jogo |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **1º Ano** | 10 Níveis | 6 a 7 anos | Fundamentos Lógicos e Sequências | **EF01MA01, EF01MA02, EF01MA09, EF01MA10** | Contagem simples, correspondência 1 a 1 e ordenação crescente (1, 2, 3). |
| **2º Ano** | 10 Níveis | 7 a 8 anos | Paridade e Comparações | **EF02MA01, EF02MA05, EF02MA06, EF02MA09** | Filtros de números pares e ímpares, desigualdades relacionais (> e <). |
| **3º Ano** | 10 Níveis | 8 a 9 anos | Operações Aritméticas e Saltos | **EF03MA05, EF03MA06, EF03MA10** | Adição e subtração como operações inversas, cálculo mental e saltos aritméticos. |
| **4º Ano** | 10 Níveis | 9 a 10 anos | Multiplicação e Portas Lógicas | **EF04MA04, EF04MA05, EF04MA11, EF04MA12** | Fatores, múltiplos comuns e circuitos lógicos (placas com operador booleano AND). |
| **5º Ano** | 10 Níveis | 10 a 11 anos | Expressões Numéricas e Precedência | **EF05MA07, EF05MA08, EF05MA10, EF05MA11** | Expressões compostas, ordem de operações aritméticas e equações combinadas. |

---

## 🏆 Modo Bônus: Sokoban Clássico (10 Fases Dinâmicas)

Ao concluir as 10 fases de qualquer ano letivo (ou diretamente pelo menu de seleção), o jogador desbloqueia o **Modo Prêmio: Sokoban Clássico**:
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
* **Desenvolvimento e Pedagogia:** Projeto educativo SokoMath.
* **Assets Gráficos:** Kenney Sokoban Pack (Domínio Público / CC0).
* **Trilha Sonora e Efeitos:** Kenney Audio & Creative Commons.
