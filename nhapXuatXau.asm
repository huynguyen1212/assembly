.model small
.stack 100h
.data
    tb1 db 'Nhap xau: $'
    tb2 db 10,13,'Xau vua nhap: $'
    xau db ?
.code       
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    lea si, xau
    
    doc:   
        mov ah, 1
        int 21h
        cmp al, 13
        je tiep
        mov [si], al
        inc si
        jmp doc
    tiep:
        mov [si], '$'
        mov ah, 9
        lea dx, tb2
        int 21h
        lea dx, xau
        int 21h
    
    mov ah, 4ch
    int 21h
main endp       