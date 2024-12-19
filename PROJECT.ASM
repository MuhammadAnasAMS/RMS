.model large
.stack 1000h
.data
;WELCOME PAGE

m1 db 10,13,'                       **************************************************        $'
m2 db 10,13,'                       **                     WELCOME                  **        $'
m3 db 10,13,'                       **                       TO                     **        $'
m4 db 10,13,'                       **               RESTURANT MANAGEMENT           **        $'
m5 db 10,13,'                       **                     SYSTEM                   **        $'
m6 db 10,13,'                       **************************************************        $'

;CHOOSE
m7 db 10,13,'                        Schedule---$'
m8 db 10,13,'                        Enter Your Choice: $'
m19 db 10,13,'                              Enter 1 to Display Schedule: $'
m34 db 10,13,'                               Pick Your Item: $'
m35 db 10,13,'                               Enter Quantity: $'
m36 db 10,13,'                          Invalid Input !! Rerun the Program. $'
m37 db 10,13,'                               Total Price: $'
m38 db 10,13,'                       1.Schedule: $'
m39 db 10,13,'                       2.Exit: $'

;SCHEDULE LIST
m9 db 10,13,'                           1. Breakfast $'
m10 db 10,13,'                           2. Lunch $'
m11 db 10,13,'                           3. Dinner $'

;BREAKFAST LIST
m12 db 10,13,'                     ********      Breakfast List      ********$'
m13 db 10,13,'                          1.Paratha with Fried Egg   50/-$'
m14 db 10,13,'                          2.Cheese Paratha           50/-$'
m15 db 10,13,'                          3.Chicken Paratha          50/-$'
m16 db 10,13,'                          4.Aloo Paratha             50/-$'
m17 db 10,13,'                          5.Chai                     50/-$'
m18 db 10,13,'                          6.Nehari with Nan          50/-$'

;LUNCH LIST
m20 db 10,13,'                     ********      Lunch List      ********$'
m21 db 10,13,'                          1.Aloo Biryani        100/-$'
m22 db 10,13,'                          2.Chicken Biryani     100/-$'
m23 db 10,13,'                          3.Chicken Pulaoo      100/-$'
m24 db 10,13,'                          4.Chicken Karahi      100/-$'
m25 db 10,13,'                          5.Daal Chawal         100/-$'
m26 db 10,13,'                          6.Burger              100/-$'

;DINNER LIST
m27 db 10,13,'                     ********      Dinner List      ********$'
m28 db 10,13,'                          1.Chicken Soup        200/-$'
m29 db 10,13,'                          2.Vegetable Soup      200/-$'
m30 db 10,13,'                          3.Mutton Pulaoo       200/-$'
m31 db 10,13,'                          4.Chicken Pulaoo      200/-$'
m32 db 10,13,'                          5.Zinger Burger       200/-$'
m33 db 10,13,'                          6.Anda Burger         200/-$'

.code
main proc

mov ax,@data
mov ds,ax

;WELCOME PAGE
mov ah,9
lea dx,m1
int 21h
lea dx,m2
int 21h
lea dx,m3
int 21h
lea dx,m4
int 21h
lea dx,m5
int 21h
lea dx,m6
int 21h

;NEW LINE
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;TAKE INPUT TO START
mov ah,9
lea dx,a19
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Schedule
jmp Invalid

Schedule:
;NEW LINE
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m7
int 21h
lea dx,m9
int 21h
lea dx,m10
int 21h
lea dx,m11
int 21h

;LIST CHOOSE
lea dx,m8
int 21h

mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Breakfast

cmp bh,2
je Lunch

cmp bh,3
je Dinner

jmp Invalid

;BREAKFAST LIST
Breakfast:

;NEW LINE
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;LIST START
mov ah,9
lea dx,m12
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m13
int 21h
lea dx,m14
int 21h
lea dx,m15
int 21h
lea dx,m16
int 21h
lea dx,m17
int 21h
lea dx,m18
int 21h

;CONDITION CHECK
lea dx,m34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

cmp bl,1
je Fifty

cmp bl,2
je Fifty

cmp bl,3
je Fifty

cmp bl,4
je Fifty

cmp bl,5
je Fifty

cmp bl,6
je Fifty

jmp Invalid

Lunch:
;NEW LINE
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;LIST START
mov ah,9
lea dx,m20
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m21
int 21h
lea dx,m22
int 21h
lea dx,m23
int 21h
lea dx,m24
int 21h
lea dx,m25
int 21h
lea dx,m26
int 21h

;CONDITION CHECKING
lea dx,m34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

cmp bl,1
je Hundred

cmp bl,2
je Hundred

cmp bl,3
je Hundred

cmp bl,4
je Hundred

cmp bl,5
je Hundred

cmp bl,6
je Hundred

jmp Invalid

;FOR EXIT
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m38
int 21h

mov ah,1
int 21h
mov bl,al

cmp bh,1
jmp Exit

Dinner:
;NEW LINE
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;LIST START
mov ah,9
lea dx,m27
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m28
int 21h
lea dx,m29
int 21h
lea dx,m30
int 21h
lea dx,m31
int 21h
lea dx,m32
int 21h
lea dx,m33
int 21h
   
;CONDITION CHECKING
lea dx,m34
int 21h

mov ah,1
int 21h
mov bl,al
sub bl,48

cmp bl,1
je TwoHundred

cmp bl,2
je TwoHundred

cmp bl,3
je TwoHundred

cmp bl,4
je TwoHundred

cmp bl,5
je TwoHundred

cmp bl,6
je TwoHundred

jmp Invalid

Fifty:
mov bl,5
lea dx,m35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add ch,48
add cl,48

lea dx,m37
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;FOR EXIT OR MAIN MENU
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m38
int 21h

mov ah,9
lea dx,m39
int 21h

mov ah,9
lea dx,m8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

jmp Invalid

Hundred:
mov bl,10
lea dx,m35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add ch,48
add cl,48

lea dx,m37
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;FOR EXIT
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m38
int 21h

mov ah,9
lea dx,m39
int 21h

mov ah,9
lea dx,m8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

jmp Invalid

TwoHundred:
mov bl,20
lea dx,m35
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mul bl
aam

mov cx,ax
add cl,48
add ch,48

lea dx,m37
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

mov dl,'0'
int 21h

mov dl,47
int 21h
mov dl,45
int 21h

;FOR EXIT
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m38
int 21h

mov ah,9
lea dx,m39
int 21h

mov ah,9
lea dx,m8
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Schedule

cmp al,2
je Exit

jmp Invalid

Invalid:
;NEW LINE
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,m36
int 21h
jmp Exit

Exit:
mov ah,4ch
int 21h

main endp
end main
