        @ /000  
        GD /000      ; dev -> acc
        SB SUB       ; acc -> x numerico 
        MM X         ; x numerico -> x  
        GD /000      ; dev -> acc (descarte)
        GD /000      ; dev -> acc   
        SB SUB       ; acc -> y numerico
        MM Y         ; y numerico -> y  
        AD X         ; x + y -> acc  
        MM SUM       ; x + y -> soma  

        SC AJUSTE    ; trata vai1  

        LD SUM       ; soma -> acc 
        AD SUB       ; soma -> soma ascii
        PD /100      ; soma ascii -> monitor
        HM /000      ; fim

        @ /F00  
AJUSTE  K =000       ; assinatura  
        LD SUM       ; sum -> acc
        ML S         ; shifta
        DV S         ; lsb 
        SB A         ; lsb < 10?
        JN RETORNO   ; se não, return
        LD SUM       ; sum -> acc
        SB A         ; lsb - 10  
        AD S         ; propaga vai 1 
        MM SUM       ; acc -> sum
RETORNO RS /F00      ; return  

        @ /200  
X       K =0        ; Armazena o valor numérico de X  
Y       K =0        ; Armazena o valor numérico de Y 
A       K /000A     ; Constante 10 para ajuste do "vai-um"  
SUM     K =0        ; Armazena a soma de X e Y  
SUB     K /3030     ; Constante para conversão ASCII (0x3030)   
S       K /0100     ; Constante 0x0100 usada no ajuste  
