input macro
  mov ah, 01h
  int 21h
endm

output macro
  mov ah, 02h
  int 21h
endm

disp macro
  mov ah, 09h
  int 21h
endm

.model small
.stack 100h
.data
  title db 10,"Assignment-1 Add_arrayOfNum_usrIp SYITB102 Arnav Sangle $"
  ipMsg1 db 10,"Enter array size: $"
  ipMsg2 db 10,"Enter number: $"
  opMsg db 10,"Sum = $"

  arr db 10 dup(0)
  count db 0

.code
  mov ax, @data
  mov ds, ax

  disp title

  lea si, ipMsg1
  disp ipMsg1
  input
  sub al, 30h

  mov count, al
  mov cl, count
         
                   
s1:
  disp ipMsg2
  input
  sub al, 30h
  mov [si], al
  inc si
loop s1        ;dec cx
               ;jnz repeat

  mov ax, 000h
  mov cl, count

  lea si, arr
s2:
  add al, [si]
  inc si
loop s2

  mov ch, 02h
  mov cl, 04h
  mov bl, al

s3:
  rol bl, cl
  mov dl, bl
  and dl, 0fh
  cmp dl, 09    ;dl=dl-09
  jbe s4
  add dl, 07

s4:
  add dl, 30h
  output
  dec ch
  jnz s3
  mov ah, 4ch

end

