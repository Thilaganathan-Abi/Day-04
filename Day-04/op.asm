.model small
.stack 100h

.data
msg1 db "Enter the first number:$"
msg2 db "Enter the second number:$"
msg3 db "The addition is:$"
msg4 db "The subtraction is:$"
msg5 db "The multiplication is:$"
msg6 db "The division quotient is:$"
msg7 db "The division reminder is:$"
n1 db 0
n2 db 0
n3 db ?

.code
start:

mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

mov ah,01h
int 21h

mov dl,al
sub dl,48

mov n1,dl

mov dl,0ah
mov ah,02h
int 21h

mov dx,offset msg2
mov ah,09h
int 21h

mov ah,01h
int 21h

mov dl,al
sub dl,48

mov n2,dl

mov dl,0ah
mov ah,02h
int 21h

;addition

mov dx,offset msg3
mov ah,09h
int 21h

mov dl,n1
add dl,n2

add dl,48
mov ah,02h
int 21h

mov dl,0ah
mov ah,02h
int 21h

;subtraction

mov dx,offset msg4
mov ah,09h
int 21h

mov dl,n1
sub dl,n2

add dl,48
mov ah,02h
int 21h

mov dl,0ah
mov ah,02h
int 21h

;multiplication

mov dx,offset msg5
mov ah,09h
int 21h

mov al,n1
mul n2

mov dl,al
add dl,48

mov ah,02h
int 21h

mov dl,0ah
mov ah,02h
int 21h

;division

mov dx,offset msg7
mov ah,09h
int 21h

mov ah,00
mov al,n1
div n2
mov n3,ah

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

;reminder

mov dx,offset msg7
mov ah,09h
int 21h

mov dl,n3
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start

