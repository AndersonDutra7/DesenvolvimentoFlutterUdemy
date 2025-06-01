# Lista de Tarefas App (To Do List)

Aplicativo para gerenciamento de tarefas pessoais, com persistência local usando arquivo JSON.

---

## 📋 Descrição

Este projeto é um app de tarefas para dispositivos móveis, desenvolvido em Flutter. Permite adicionar, editar, concluir e excluir tarefas, armazenando os dados localmente no dispositivo para manter as informações mesmo após fechar o app.

O design possui efeito de vidro fosco, com interface limpa e intuitiva, facilitando a organização diária do usuário.

---

## 🚀 Funcionalidades

- Adicionar novas tarefas com título personalizado.
- Editar título de tarefas existentes.
- Marcar tarefas como concluídas ou pendentes.
- Excluir tarefas com opção de desfazer ação.
- Persistência local dos dados usando arquivos JSON no armazenamento do dispositivo.
- Compatível com Android e iOS.

---

## 🛠 Tecnologias e Ferramentas

- [Flutter](https://flutter.dev/) — Framework para desenvolvimento multiplataforma.
- [Dart](https://dart.dev/) — Linguagem de programação usada.
- `path_provider` — Para acessar diretórios do dispositivo.
- JSON — Para armazenar e ler dados localmente.
- Widgets personalizados para gerenciamento e exibição das tarefas.

---

## 📦 Estrutura do Projeto

lib/
├── models/ # Modelos de dados (Task)
├── storage/ # Classe para persistência local (TaskStorage)
├── widgets/ # Componentes reutilizáveis (TaskItem, TaskDialog)
└── pages/ # Telas da aplicação (HomePage)

---

## 🚀 Como rodar o projeto

1. Clone este repositório:

```bash
git clone https://github.com/AndersonDutra7/DesenvolvimentoFlutterUdemy.git
```

2. Entre no projeto:

```bash
cd DesenvolvimentoFlutterUdemy/to_do_list
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o app:

```bash
flutter run
```

---

🤝 Contribuições
Contribuições são bem-vindas! Para contribuir:

Fork este repositório.

Crie uma branch para sua feature (git checkout -b feature/nome-da-feature).

Faça commit das suas alterações (git commit -m 'Minha feature').

Envie para sua branch (git push origin feature/nome-da-feature).

Abra um Pull Request aqui.

---

📞 Contato
Anderson Raulino Dutra
LinkedIn | GitHub | andersonrdutra7@gmail.com

---

📄 Licença
Este projeto está licenciado sob a MIT License.

```

```
