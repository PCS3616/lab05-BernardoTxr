        @ /000 ;inicio do programa na memória 000
START   SC SUBR ; chama subrotina
        HM =0 ; para o programa (decimal irrelevante)
        
        @ /00E
UM      K =1 ; valor unitário pra subtração
        @ /100
N       K =5 ; valor de N
        @ /102
RES     K =1 ; valor do fatorial

        @ /200
SUBR    K =0 ; assinatura
INI     LD N ; carrego n
        JZ FIMSUBR ; se n=0, fim subrotina
        SB UM ; subtrai de 1
        JZ FIMSUBR ; se n=0, fim subrotina
        LD RES ; se n!=0, coloco fatorial no acumulador
        ML N ; multiplica acumulador (fatorial) por n
        MM RES ; guarda acumulador (fatorial * n) na memória
        LD N ;  coloca n no acumulador
        SB UM ; decrementa n
        MM N ; coloca n-1 no lugar de N
        JP INI ; jump pro começo do for
FIMSUBR RS SUBR ; fim subrotina
