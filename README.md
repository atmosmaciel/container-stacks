# Container Stacks

Este projeto contém *stacks* de containers usados no dia a dia para desenvolvimento de projetos. Ele concentra serviços que são usados rotineiramente.

*Usado somente para desenvolvimento.*

## Por quê?

Eu não preciso destas instalações *stand-alone* na minha máquina local, então, eu estou o tempo todo manipulando e usando estes serviços localmente.

## Configuração

Crie uma cópia do arquivo `.env.example` para `.env`, este arquivo já possui valores padrão que podem ser alterados conforme a necessidade.

## Como usar isto

Uma das maneiras, é entrar diretamente no diretório deste projeto e inicializar o serviço que eu preciso, por exemplo: `make redis-start`.

Isso não é muito produtivo. Então é melhor criar um *alias* no seu terminal favorito. Para isso, faça:

1. `<seu-editor-de-textos> .zshrc`, por exemplo: `vim .zshrc`.
2. Faça o `make` olhar para o `Makefile` deste projeto aonde ele estiver.
    a. `alias <seu-alias>="make -C <caminho-ate-este-projeto>/container-stacks"`.
    b. Por exemplo: `alias containerstack="make -C <caminho-ate-este-projeto>/container-stacks"`.
3. `$SHELL`.

Agora sim, a partir de qualquer lugar você poderá inicializar o serviço que precisar usando `<seu-alias> <some-service-name>`, por exemplo:

- `containerstack redis-start`.

Também é possível inicializar uma stack inteira com vários serviços, como de bancos de dados, por exemplo:

- `containerstack db-stack-up`.

## Serviços

Os serviços disponíveis podem ser vistos no [Makefile](./Makefile) do projeto.
