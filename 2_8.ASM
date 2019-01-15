.model small
.data
	n dw 234
	s dw ?
.stack
.code
start:
	mov ax, @data
	mov ds, ax

	mov ax, @stack
	mov ss, ax

	push 0; suma cifrelor de pana acum
	
	start_while:
	xor dx, dx; goleste dx
	mov ax, n; pregateste pentru impartirea la 10
	div 10; imparte
	
	pop bx ; ia suma cifrelor de pana acum
	add bx, dx; aduna restul impartirii lui ax la 10
	push dx	; baga suma cifrelor in stiva
	
	mov n, ax ; suprascrie n
	cmp n, 0 ; daca n a ajuns la 0, inseamna ca tocmai am prelucrat si ultima cifra
	jne start_while	
	
	pop ax
	mov s, ax


	mov ax, 4c00h
	int 21h
end start