.model small
.stack 100h
.data
    tb1 db 'Nhap xau: $'
    tb2 db 10,13,'Xau khi in hoa: $'
    s db ?
.code     
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    lea si, s
    
    mov cx, 0
nhap: 
    mov ah, 1
    int 21h
    cmp al, 13
    je tiep
    mov [si], al
    inc si 
    inc cx
    jmp nhap
tiep:
    mov ah, 9
    lea dx, tb2
    int 21h      
    lea si, s
duyet: 
    mov bl, [si]
    cmp bl, 'a'
    jb tiep2
    cmp bl, 'z'
    ja tiep2
    sub bl, 32
tiep2:
    mov dl, bl
    mov ah, 2
    int 21h
    dec cx
    cmp cx, 0
    je endl
    inc si
    jmp duyet          
endl:    
    mov ah, 4ch
    int 21h
main endp