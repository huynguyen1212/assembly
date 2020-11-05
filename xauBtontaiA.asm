.model small
.stack 100h
.data
    tb1 db 'nhap xau A: $'
    tb2 db 10,13,'nhap xau B: $'
    tt db 10,13,'xau B co ton tai trong xau A$'
    ktt db 10,13,'xau B khong ton tai trong xau A$'
    a db 100 dup(?)
    b db 100 dup(?)     
.code    
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, tb1
    call inX
    lea si, a
    call docX  
    
    lea dx, tb2
    call inX
    lea si, b
    call docX 
    
    call ktra
    
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

ktra proc
    lea si, a
    lap:
        lea di, b
        lap2:
        mov bl, [si]
        mov bh, [di]
        cmp bl, 24h
        je kttai
        cmp bh, 24h
        je ttai
        inc si
        cmp bl, bh
        jne lap
        inc di
        jmp lap2
    kttai:
        lea dx, ktt
        call inX
        ret
    ttai:
        lea dx, tt
        call inX
        ret               
ktra endp