INCLUDE Irvine32.inc

.data
a dw 5
b db 6
cd db 10
d dw 5
f dw 6
g db 10
h db 11
rez db ?
; z=((a+b*c-d)/f+h)/g

.code
program PROC
	mov eax, 0

	mov al, b

	imul cd

	add ax, a

	sub ax, d

	cwd
	idiv f

	movsx bx, h
	add ax, bx

	cwd
	movsx bx,g
	idiv bx

	mov rez, al

	exit
program ENDP
END program
