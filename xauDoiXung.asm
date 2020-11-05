.model small
.stack 100h
.data
    tb1 db 'Nhap xau: $'
    tb2 db 10,13,'Xau doi xung.$'
    tb3 db 10,13,'Xau khong doi xung.$'   
    s db ?
.code     
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    lea si, s
    
    xor cx, cx
    call nhap
    call ktra
    
    mov ah, 4ch
    int 21h
main endp  
nhap proc
    mov ah, 1
    int 21h
    cmp al, 13
    je thoat
    mov [si], al
    inc si
    inc cx
    jmp nhap
    thoat: 
        lea di, s
        add di, cx
        dec di
        lea si, s
        ret
nhap endp 
ktra proc
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne kdoixung
    inc si
    dec di  
    cmp si, di
    je doixung
    jmp ktra 
    kdoixung:
        mov ah, 9
        lea dx, tb3
        int 21h 
        ret
    doixung:
        mov ah, 9
        lea dx, tb2
        int 21h
        ret
ktra endp