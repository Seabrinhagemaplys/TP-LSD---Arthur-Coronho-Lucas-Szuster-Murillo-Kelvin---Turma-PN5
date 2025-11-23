Integrantes do grupo: Arthur Coronho Seabra Eiras, Lucas Araújo Campos Szuster e Murillo Kelvin de Andrade Santos

## Projeto final da discplina de Laboratório de Sistemas Digitais

### Descrição do projeto

O projeto final do nosso grupo visa o desenvolvimento de um sistema de dois
semáforos responsável por controlar o tráfego em uma interseção de duas ruas. A ideia
central é que, enquanto um sinal estiver fechado, o outro estará aberto, operando em ciclos
opostos.
Cada sinal possui quatro entradas, sendo elas:
* pedestre;
* emergência;
* outro_pedestre;
* outro_sinal_emergencia.

As saídas correspondentes a cada semáforo são:
* sinal_verde;
* sinal_amarelo;
* sinal_vermelho;
* virar_a_direita.

Dessa forma, o sistema global apresenta um total de oito entradas e oito saídas.

#### Comportamento do Sistema
Para cada semáforo, caso a entrada pedestre seja ativada enquanto o sinal estiver
verde, o sistema deve transicionar imediatamente para o vermelho. Considera-se que
um pedestre deve sempre pressionar o botão de pedestre para atravessar a via desejada.
A entrada de emergência, quando ativa, mantém o sinal de sua via no estado sinal_verde
enquanto o outro sinal é forçado ao estado sinal_vermelho. Por esse motivo, a entrada
outro_sinal_emergencia está conectada à entrada de emergência do outro semáforo. Assim,
caso essa entrada seja ativada no outro sinal, o semáforo atual permanecerá fechado até
que o sinal de emergência seja desativado.
No controle das duas vias, os veículos que estão na faixa da direita devem poder
virar à direita desde que não existam pedestres atravessando nem na sua via nem na
via cruzada. Como um pedestre só atravessa se tiver pressionado o botão de pedestre
correspondente, utiliza-se a entrada outro_pedestre para verificar se há travessia ativa

## FSM de alto nível -RTL fase 1

<img title="a title" alt="Alt text" src="/imagens/graphviz_2.png">

## Datapath - RTL fase 2

<img title="a title" alt="Alt text" src="/imagens/vvvvvv_page-0001_1.jpg">

## Integração Caminho de dados e Controladora - RTL fase 3
<img title="a title" alt="Alt text" src="/imagens/RLLT3_page-0001_1.jpg">

## FSM de baixo nível - RTL fase 4
<img title="a title" alt="Alt text" src="/imagens/graphviz_1.png">
