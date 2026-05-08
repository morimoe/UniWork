INCLUDE Irvine32.inc

.data
mes1 db "Enter the X:", 0
mes2 db "Enter the Y:", 0
mes3 db "Result:", 0
vrx dd 0
vry dd 0
rez dd 0

.code
program PROC
    mov edx, OFFSET mes1
    call WriteString
    call ReadInt
    mov vrx, eax

    mov edx, OFFSET mes2
    call WriteString
    call ReadInt
    mov vry, eax

    mov eax, vry
    cdq
    mov ebx, 2
    idiv ebx

    cmp vrx, eax
    jg con1

    mov eax, vrx
    imul eax, 2
    cdq
    mov ebx, 15
    idiv ebx

    sub eax, 88
    add eax, vry
    mov rez, eax
    jmp ex

    con1:
        mov eax, vry
        imul eax, 2
        mov ecx, eax

        mov eax, vrx
        imul eax, 3

        sub ecx, eax
        mov eax, ecx
        cdq
        mov ebx, 2
        idiv ebx

        add eax, 59
        mov rez, eax

    ex:
        mov edx, OFFSET mes3
        call WriteString
        mov eax, rez
        call WriteInt
        call Crlf

    exit
program ENDP
END program