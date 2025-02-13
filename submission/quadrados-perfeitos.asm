@ /000 ; Início do programa na memória 000
START   SC SUBR ; Chama a subrotina para calcular os quadrados
        HM =0   ; Encerra o programa

@ /00E
UM      K =1    ; Valor unitário para incremento
DOIS    K =2    ; Valor constante 2

@ /100  ; Início da tabela de quadrados perfeitos
N       K =0    ; Contador de N (0 a 63)
POS     K =100  ; Posição de armazenamento dos resultados

@ /200
SUBR    K =0    ; Assinatura da subrotina
INI     LD N    ; Carrega N
        JN FIMSUBR ; Se N < 0, fim da subrotina
        MM ACUM ; Zera o acumulador da soma
        MM IMPAR ; Zera o primeiro número ímpar
        JUMP LOOP

LOOP    LD IMPAR ; Carrega o número ímpar atual
        AD UM    ; Soma 1
        AD IMPAR ; Soma ao número ímpar para obter o próximo
        MM IMPAR ; Atualiza o número ímpar
        AD ACUM  ; Soma ao acumulador da soma
        MM ACUM  ; Atualiza o acumulador
        LD COUNT ; Carrega contador interno
        AD UM    ; Incrementa contador
        MM COUNT ; Atualiza contador
        LD COUNT ; Carrega contador
        SB N     ; Verifica se chegou a N
        JN LOOP  ; Se não, continua somando
        
        LD ACUM  ; Carrega o resultado final (N^2)
        MM POS ; Armazena no endereço correspondente
        
        LD POS   ; Atualiza a posição de memória
        AD DOIS  ; Avança duas posições (valores de 2 bytes)
        MM POS   ; Salva nova posição
        
        LD N     ; Incrementa N
        AD UM    
        MM N     ; Atualiza N
        SB K64   ; Verifica se N = 64
        JN INI   ; Se não, continua o cálculo
        
FIMSUBR RS SUBR ; Retorna da subrotina

@ /300
ACUM    K =0    ; Acumulador de soma de ímpares
IMPAR   K =-1   ; Primeiro número ímpar (-1, pois incrementamos no início)
COUNT   K =0    ; Contador interno
K64     K =64   ; Limite de N (64)
