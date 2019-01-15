.model small
.data
        n dw 9
        x dw ?
.stack
.code
start:
        mov ax, @data
        mov ds, ax ; prepare data segment

        mov ax, @stack
        mov ss, ax ; prepare stack segment

        ;your code goes here the rest is template
        push 0 ; in stiva voi tine suma divizorilor gasiti pana acum

        cmp n, 0 ; tratare pentru numarul 0 - suma divizorilor ar trebui sa fie 0
        je final_program ; daca nu tratam inainte de for
                          ; in for se va imparti 0 la 0 -> eroare

        mov cx, n ;prepare contor for for_loop
        
        for_loop:
              xor dx, dx ; empty dx -> xor dx, dx is faster than mov dx, 0
              mov ax, n ; prepare division
              div cx; catul este in ax, iar restul este in dx
              cmp dx, 0; verifica daca cx este divizor a lui n
              je este_divizor
              continua_for:
        loop for_loop
        jmp final_program
        este_divizor:
                pop dx  ; scoate suma divizorilor de pana acum
                add dx, ax ; aduna noul divizor
                push dx  ; pune inapoi in stiva noua suma
                jmp continua_for
        final_program:
                pop ax   ; scoate suma divizorilor
                mov x, ax  ; pune suma divizorilor in variabila x

        mov ax, 4c00h ;exit program
        int 21h
end start
