include Irvine32.inc

readNum MACRO prompt, dest
    mov  edx, OFFSET prompt
    call WriteString
    call ReadHex
    mov  dest, ax
ENDM

printNum MACRO lbl, src
    mov  edx, OFFSET lbl
    call WriteString
    movzx eax, src
    call WriteHex
    call Crlf
ENDM

.data
    alfa dw 4 dup(0)
    beta dw 3 dup(0)
    msg1 byte "Enter number 1 (hex, max FFFh): ", 0
    msg2 byte "Enter number 2 (hex, max FFFh): ", 0
    msg3 byte "Enter number 3 (hex, max FFFh): ", 0
    msg4 byte "Enter number 4 (hex, max FFFh): ", 0
    out1 byte "Word 1: ", 0
    out2 byte "Word 2: ", 0
    out3 byte "Word 3: ", 0

.code
main PROC
    readNum msg1, alfa[0]
    readNum msg2, alfa[2]
    readNum msg3, alfa[4]
    readNum msg4, alfa[6]

    mov ax, alfa[0]
    and ax, 0FFFh
    mov bx, alfa[2]
    and bx, 0FFFh
    mov cx, alfa[4]
    and cx, 0FFFh
    mov dx, alfa[6]
    and dx, 0FFFh

    mov si, ax
    shl si, 4
    mov di, bx
    shr di, 8
    or  si, di
    mov beta[0], si

    mov si, bx
    and si, 0FFh
    shl si, 8
    mov di, cx
    shr di, 4
    or  si, di
    mov beta[2], si

    mov si, cx
    and si, 00Fh
    shl si, 12
    or  si, dx
    mov beta[4], si

    printNum out1, beta[0]
    printNum out2, beta[2]
    printNum out3, beta[4]

    exit
main ENDP
END main