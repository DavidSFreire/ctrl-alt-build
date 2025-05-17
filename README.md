
# Ctrl+Alt+Build

[![Build](https://github.com/DavidSFreire/ctrl-alt-build/actions/workflows/flutter.yml/badge.svg)](https://github.com/DavidSFreire/ctrl-alt-build/actions)

Ctrl+Alt+Build é um aplicativo de perguntas e respostas educativas, desenvolvido como parte de um **jogo de tabuleiro** com o mesmo nome. O principal objetivo é ensinar, de forma lúdica, sobre **montagem de computadores** e os principais componentes de hardware.

---

## 🧠 Sobre o Projeto

Durante uma **feira de games**, criamos este aplicativo como uma ferramenta de apoio ao jogo físico. A proposta é simples e divertida: os jogadores avançam pelo tabuleiro e, ao cair em casas com perguntas de categorias específicas, devem responder corretamente para ganhar peças que fazem parte de um computador (como processador, memória RAM, placa-mãe, etc.). O primeiro a montar completamente seu PC vence o jogo!

---

## 🖼️ Imagem Ilustrativa


---

## 🕹️ Como Funciona

- As perguntas são separadas por **categorias**, relacionadas ao universo da informática:
  - Hardware
  - Montagem
  - Desempenho
  - Software
  - Problemas

- Cada resposta correta garante ao jogador uma **peça de computador**.
- O app evita repetição de perguntas para o mesmo jogador, garantindo uma experiência variada.

---

## 💡 Objetivo Educacional

O jogo tem um forte propósito pedagógico: **ensinar sobre hardware e montagem de computadores** de forma acessível, prática e divertida. Ele pode ser usado em salas de aula, oficinas e eventos educacionais voltados à tecnologia.

---

## 📂 Estrutura do Projeto

O diretório principal do app está dentro da pasta `lib/`, com a seguinte estrutura:

```
lib/
├── categorias/
│   ├── categoria_hardware.dart
│   ├── categoria_montagem.dart
│   ├── categoria_desempenho.dart
│   ├── categoria_software.dart
│   └── categoria_problemas.dart
│
├── componentes/
│   ├── pergunta_widget.dart
│   └── resultado_widget.dart
│
├── modelos/
│   └── pergunta.dart
│
├── telas/
│   ├── tela_categorias.dart
│   ├── tela_perguntas.dart
│   └── tela_resultado.dart
│
├── util/
│   └── gerenciador_perguntas.dart
│
└── main.dart
```

---

## 🛠️ Tecnologias Utilizadas

- **Dart**: Linguagem principal usada no desenvolvimento.
- **Flutter**: Framework usado para construir a interface e lógica do aplicativo.
- **Android SDK**: Para empacotar e gerar o APK do aplicativo.
- **Git**: Controle de versão do projeto.

---

## 📲 Download

Baixe o APK e experimente o Ctrl+Alt+Build no seu dispositivo Android:

👉 [**Clique aqui para baixar o APK**](https://www.download.com/ctrl-alt-build-apk) *(link fictício — substitua pelo real)*

---

## 🚀 Como Executar Localmente

1. Instale o Flutter SDK: https://flutter.dev/docs/get-started/install  
2. Clone este repositório:
   ```bash
   git clone https://github.com/DavidSFreire/ctrl-alt-build.git
   cd ctrl-alt-build
   ```
3. Execute:
   ```bash
   flutter pub get
   flutter run
   ```

---

## 👥 Contribuidores

- David S. Freire  

## 📄 Licença

Este projeto está licenciado sob a MIT License
