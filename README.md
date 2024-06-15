# Dictionary Mobile App

## Projeto de dicionário para auxiliar na busca do significado da palavra e sua fonética.

![screenshot](https://github.com/pbelfort/dictionary/assets/42588868/ca201930-8f42-4982-aa74-45305a5491be)

## Tecnologias utilizadas

- Flutter
- [Gherkin](https://medium.com/brasilflutter/flutter-gherkin-criando-automa%C3%A7%C3%B5es-de-teste-de-uma-forma-mais-simples-43f9da4f47e5) + [Flutter Gherkin](https://pub.dev/packages/flutter_gherkin)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)
- [GetX](https://pub.dev/packages/get)
- [Audioplayers](https://pub.dev/packages/audioplayers)
- Firebase

## Instruções de instalação

Para instalar a aplicação, basta fazer o clone do repositório utilizando o comando:

```git clone [repositorio]```

Após clonar o repositório, na raiz do projeto, digite o comando:

```flutter pub get```

Este comando irá fazer o download de todas as dependências do projeto.

Agora basta executar o comando:

```flutter run```

## Instruções de entrada

Para fazer o login no aplicativo use as seguintes credenciais

```email: test@dictionary.com```
```password: dict1010```

## Organização do código

```
./integration_test
./app
   ./base
	 adapters
	 middleware
	 shared
   ./data
	 model
	 provider
	 repository
   ./domain
	 entities
	 usecases
   ./modules
	 binding.dart
	 controller.dart
	 page.dart
   ./routes
   ./theme
   ./test   
main.dart
```

## Instruções dos testes de integração

Foi utilizado o [Flutter Gherkin](https://pub.dev/packages/flutter_gherkin) para realizar os testes de integração do aplicativo. Com este package foi possível utilizar o [Cucumber](https://cucumber.io/docs/cucumber/), ferramenta de teste de software que suporta o Desenvolvimento Orientado por Comportamento (BDD - Behavior Driven Development), cujo objetivo principal é permitir uma comunicação eficaz e clara entre os membros da equipe técnica e os stakeholders não técnicos.

É necessário trocar os valores das variáveis loginTextController e passTextController para que o aplicativo faça login automaticament. Abaixo está o caminho para a pasta:

> integration_test/given/given_i_am_in_route.dart

Para executar os testes de integração basta executar o comando:

```flutter pub run build_runner build```

## Vídeo de apresentação

https://github.com/pbelfort/dictionary/assets/42588868/3254b22e-5349-4f54-8a38-7bff985a2254

# Explorando o Audioplayers
## Ligue o som para escutar a fonética da palavra.

https://github.com/pbelfort/dictionary/assets/42588868/1ab1dbb4-2b45-4ac0-8ad5-1fc156d9671b
