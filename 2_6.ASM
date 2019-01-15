.model small
.data
        n dw 97
        x db ? 
.stack          
.code
        
start:
        mov ax, @data
        mov ds, ax ;set data segment
                                                        
        mov ax, @stack
        mov ss, ax ;set stack segment
        
        mov cx, n                                                                                                                                                                                                                                                                                                                                                                                                                        
        cmp cx, 1
        je set_x_neprim
	push 0
        for_loop:
            xor dx, dx                  ;empty dx
            mov ax, n                   ;move n into AX
            div cx                      ;AX/CX

            cmp dx, 0                   ;if(DX == 0)
            je se_divide                
            continue_for:
            
        loop for_loop

        jmp final_program

        se_divide:
                pop dx               
                inc dx
                push dx                
                jmp continue_for

       final_program:
        pop dx
        cmp dx, 2
        je set_x_prim
        jmp set_x_neprim

       set_x_prim:              
        mov x, 1
        jmp exit

       set_x_neprim:
        mov x, 0
        jmp exit

       exit:
        mov ax, 4c00h
        int 21h
end start
