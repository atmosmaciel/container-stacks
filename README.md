# Container Stacks

Este projeto contém *stacks* de containers usados no dia a dia para desenvolvimento de projetos. Ele concentra serviços que são usados rotineiramente.

## Porque isso?

Eu não preciso dessas instalações *stand-alone* na minha máquina local, então eu estou o tempo todos manipulando estes serviços para usar localmente.

## Como usar isto

Uma das maneiras, é entrar diretamente no diretório deste projeto e inicializar o serviço que eu preciso: `make redis-start`.

Isso não é muito produtivo. Então é melhor criar um *alias* no seu terminal favorito. Para fazer isso, faça:

1. `vim .zshrc`
2. Faça o `make` olhar para o `Makefile` deste projeto aonde ele estiver: `alias containerstack="make -C caminho/ate/este/projeto/container-stacks"`
3. `$SHELL`

Agora sim, a partir de qualquer lugar eu posso inicializar o serviço que eu precisar:

- `containerstack redis-start`
- `containerstack some-service-name`

Também posso precisar inicializar uma stack inteira com vários serviços de bancos de dados por exemplo:

- `containerstack db-stack-up`

## Serviços

Os serviços disponíveis podem ser vistos no [Makefile](./Makefile) do projeto.
