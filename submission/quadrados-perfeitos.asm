        @ /000 ; Inicio do programa na memória 000
START   LD ADDR ; Carrega ADDR no acumulador
        AD DOIS ; Soma 2 ao endereço de escrita
        MM ESC  ; Atualiza endereço de escrita

        LD SOMA  ; Carrega soma parcial
        AD INCREMENTO ; Soma 2N + 1
        MM SOMA  ; Atualiza soma

        LD ESC   ; Carrega posição de escrita
        MM SOMA  ; Armazena o quadrado na memória

        LD INCREMENTO ; Carrega incremento
        AD DOIS  ; Incrementa 2 para manter a lógica (2N + 1)
        MM INCREMENTO ; Atualiza incremento

        LD ATUAL ; Carrega N atual
        AD UM    ; N = N + 1
        MM ATUAL ; Atualiza N

        LD LIM   ; Carrega o limite (63)
        SB ATUAL ; Se N == 63, fim
        JZ FIM   ; Se chegou ao limite, encerra

        JP START ; Continua o loop

FIM     HM =0    ; Fim do programa

        @ /100  ; Memória onde os quadrados serão armazenados
ADDR    K /0100  ; Endereço base (posição 0x100)

        @ /800
N       K =0     ; índice
SOMA    K =0     ; valor acumulado
INCREMENTO K =1  ; Primeiro número ímpar (2*0 + 1)
ATUAL   K =0     ; Índice da memória de escrita
LIM     K =63    ; Último número natural permitido
UM      K =1     ; Constante 1
DOIS    K =2     ; Constante 2
ESC     K =0     ; Posição de escrita na memória
