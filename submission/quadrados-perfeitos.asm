        @ /000 ;inicio do programa na memória 000
START   LD ADDR ; addr -> acc
        AD DOIS ; addr + 2 -> acc
        MM ESC ; acc -> escrita
        LD SOMA ; carrega soma acumulada
        AD PROX_IMPAR ; soma + próximo ímpar -> acc
        MM SOMA ; armazena nova soma acumulada
        LD PROX_IMPAR ; carrega próximo ímpar
        AD DOIS ; próximo ímpar + 2 -> acc
        MM PROX_IMPAR ; armazena próximo ímpar atualizado
        LD SOMA ; 
ESC     K =0 ; será substituído por 9{addr+2}
        LD LIM ; lim -> acc
        SB ATUAL; lim - atual -> acc
        JZ FIM ; lim-atual == 0 -> jump fim
        LD ATUAL ; atual -> acc
        AD UM ; atual + 1 > acc
        MM ATUAL ; acc -> atual + 1
        JP START ; else, recomeça

        @ /100
        K =0 ;

        @ /400 
FIM     HM =0 ; # fim do programa
        
        @ /800
ADDR    K /9100 ; variável que armazena instrução de escrita
        @ /802
UM      K =1 ; 
        @ /804
DOIS    K =2 ; 
        @ /806
LIM     K =63 ; 
        @ /808
ATUAL   K =0 ; 
        @ /810 
SOMA    K =0 ; soma acumulada
        @ /812
PROX_IMPAR K =1 ; próximo número ímpar a somar
