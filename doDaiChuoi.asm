.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi: $'
    tb2 db 10,13,'Chieu dai chuoi: $'
    s db 100,?,100 dup ('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    ;Nhap chuoi
    mov ah, 9
    lea dx, tb1
    int 21h
    mov ah, 0ah
    lea dx, s
    int 21h
    ;Goi thong bao 2
    mov ah, 9
    lea dx, tb2
    int 21h
    ;Tinh do dai chuoi
    mov dl, s + 1
    add dl,30h
    mov ah, 2
    int 21h 
    ;Ket thuc
    mov ah, 4ch
    int 21h 
main endp