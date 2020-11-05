.model
.stack 100h
.data              
    tb1 db 'Nhap xau can tim: $'
    tb2 db 10,13,'So lan xuat hien cua chuoi vixuly: $'
    s1 db 100 dup(?)
    s2 db 'vixuly$' 
    count db ?
.code                                           
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, tb1
    call inX 
    lea si, s1
    call docX
    
    mov count, 0
    call dem
    
    mov ah, 4ch
    int 21h
main endp

inX proc
    mov ah, 9
    int 21h
    ret
inX endp 

docX proc
    mov ah, 1
    int 21h
    cmp al, 13
    je thoat
    mov [si], al
    inc si
    jmp docX 
    thoat:
        mov [si], '$'
        ret
docX endp 
    
dem proc
    lea si, s1
    lap:
        lea di, s2
    lap2:
        mov bh, [si]
        mov bl, [di]
        cmp bl, 24h
        je them
        cmp bh, 24h
        je outCT
        inc si
        cmp bh, bl
        jne lap
        inc di
        jmp lap2
    them:
        inc count
        jmp lap
    outCT:  
        lea dx, tb2
        call inX
        mov dl, count
        add dl, 30h
        mov ah, 2
        int 21h
        ret 
dem endp