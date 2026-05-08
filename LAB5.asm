INCLUDE Irvine32.inc


; Макрос для вывода строки
PRINT_STR MACRO msg
    mov edx, OFFSET msg
    call WriteString
ENDM

; Макрос для вывода символа
PRINT_CHAR MACRO ch
    mov al, ch
    call WriteChar
ENDM


.data
    mas1        db  'ABC', 0
    mas2        db  'X', 'Y', 'Z', 'A', 'B', '1', 'A', '2', 0
    mas2_len    equ 8
    simv        db  'A'

    result      db  100 dup(0)
    result_len  dd  0

    msg1        db  'mas1: ', 0
    msg2        db  0ah, 'mas2 original: ', 0
    msg3        db  0ah, 'mas2 result: ', 0


.code
main proc

    PRINT_STR msg1
    PRINT_STR mas1
    PRINT_STR msg2
    PRINT_STR mas2

    mov esi, 0
    mov edi, 0

scan_loop:
    cmp esi, mas2_len
    jge done_scan

    mov al, mas2[esi]
    mov result[edi], al
    inc edi
    inc esi

    ; Проверяем — это simv?
    mov bl, simv
    cmp al, bl
    jne scan_loop

    ; Найден simv — вставляем mas1
    push esi
    mov esi, 0

insert_mas1:
    mov al, mas1[esi]
    cmp al, 0
    je  done_insert
    mov result[edi], al
    inc edi
    inc esi
    jmp insert_mas1

done_insert:
    pop esi
    jmp scan_loop

done_scan:
    mov result[edi], 0  ; завершающий ноль

    ; Вывод результата
    PRINT_STR msg3
    PRINT_STR result

quit:
    call crlf
    exit

main ENDP
END main