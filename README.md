# Container Stacks

Este projeto contém *stacks* de containers usados no dia a dia para desenvolvimento de projetos. Ele concentra serviços que são usados rotineiramente.

## Porque isso?

Eu não preciso dessas instalações *stand-alone* na minha máquina local, então eu estou o tempo todos manipulando estes serviços para usar localmente.

## Como usar isto

Uma das maneiras de usar é entrar diretamente no diretório deste projeto e inicializar o serviço que eu preciso: `make redis-start`

Isso não é muito produtivo. Então é melhor criar um *alias* para fazer isso:

1. `vim .zshrc`
2. `alias container-stack="make -f $PWD(ou o caminho para este projeto)/container-stacks/Makefile"`
3. `$SHELL`

Agora sim, a partir de qualquer lugar eu posso inicializar o serviço que eu precisar:

- `container-stack redis-start`
- `container-stack some-service-name`

Também posso precisar inicializar uma stack inteira com vários serviços de bancos de dados por exemplo:

- `container-stack db-stack-up`

## Serviços

Os serviços disponíveis podem ser vistos no [Makefile](./Makefile) do projeto.
