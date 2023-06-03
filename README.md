# container-stacks

Este projeto contém *stacks* de containers usados no dia a dia para desenvolvimento de projetos. Ele concentra serviços que são usados rotineiramente.

## Como usar isto

Uma das maneiras de usar é entrar diretamente no diretório deste projeto e inicializar o serviço que eu preciso: `make redis-start`

Isso não é muito produtivo. Então é melhor criar um *alias* para fazer isso:

1. `vim .zshrc`
2. `alias container-stack="make -f $PWD(ou o caminho para este projeto)/container-stacks/Makefile"`
3. `$SHELL`

Agora sim, a partir de qualquer lugar eu posso inicializar o serviço que eu precisar:

- `container-stack redis-start`
- `container-stack some-service-name`
