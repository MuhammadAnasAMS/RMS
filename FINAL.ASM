model large
.stack 1000h
.data
; Data section remains unchanged
m1 db 10,13,'                       **************************************************        $'
m2 db 10,13,'                       **                     WELCOME                  **        $'
m3 db 10,13,'                       **                       TO                     **        $'
m4 db 10,13,'                       **               RESTURANT MANAGEMENT           **        $'
m5 db 10,13,'                       **                     SYSTEM                   **        $'
m6 db 10,13,'                       **************************************************        $'

; Additional messages remain the same ...
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
    mov ax, @data
    mov ds, ax

    ; WELCOME PAGE
    mov ah, 9
    lea dx, m1
    int 21h
    lea dx, m2
    int 21h
    lea dx, m3
    int 21h
    lea dx, m4
    int 21h
    lea dx, m5
    int 21h
    lea dx, m6
    int 21h

    ; Newline
    call newline

    ; INPUT TO START
    mov ah, 9
    lea dx, m19
    int 21h
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, 48

    cmp bh, 1
    jne Invalid
    call Schedule

Schedule proc
    ; Newline
    call newline
    mov ah, 9
    lea dx, m7
    int 21h
    lea dx, m9
    int 21h
    lea dx, m10
    int 21h
    lea dx, m11
    int 21h

    ; LIST CHOOSE
    lea dx, m8
    int 21h

    mov ah, 1
    int 21h
    mov bh, al
    sub bh, 48

    cmp bh, 1
    je Breakfast
    cmp bh, 2
    je Lunch
    cmp bh, 3
    je Dinner
    jmp Invalid
Schedule endp

Breakfast proc
    ; Newline
    call newline

    ; Breakfast list
    mov ah, 9
    lea dx, m12
    int 21h
    lea dx, m13
    int 21h
    lea dx, m14
    int 21h
    lea dx, m15
    int 21h
    lea dx, m16
    int 21h
    lea dx, m17
    int 21h
    lea dx, m18
    int 21h

    ; Condition check
    lea dx, m34
    int 21h
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48

    cmp bl, 1
    je Fifty
    cmp bl, 2
    je Fifty
    cmp bl, 3
    je Fifty
    cmp bl, 4
    je Fifty
    cmp bl, 5
    je Fifty
    cmp bl, 6
    je Fifty
    jmp Invalid
Breakfast endp

Lunch proc
    ; Newline for better formatting
    call newline

    ; Lunch list display
    mov ah, 9
    lea dx, m20
    int 21h
    lea dx, m21
    int 21h
    lea dx, m22
    int 21h
    lea dx, m23
    int 21h
    lea dx, m24
    int 21h
    lea dx, m25
    int 21h
    lea dx, m26
    int 21h

    ; User choice prompt
    lea dx, m34
    int 21h
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48

    ; Check the selected menu item
    cmp bl, 1
    je Hundred
    cmp bl, 2
    je Hundred
    cmp bl, 3
    je Hundred
    cmp bl, 4
    je Hundred
    cmp bl, 5
    je Hundred
    cmp bl, 6
    je Hundred
    jmp Invalid
Lunch endp

Dinner proc
    ; Newline for better formatting
    call newline

    ; Dinner list display
    mov ah, 9
    lea dx, m27
    int 21h
    lea dx, m28
    int 21h
    lea dx, m29
    int 21h
    lea dx, m30
    int 21h
    lea dx, m31
    int 21h
    lea dx, m32
    int 21h
    lea dx, m33
    int 21h

    ; User choice prompt
    lea dx, m34
    int 21h
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48

    ; Check the selected menu item
    cmp bl, 1
    je TwoHundred
    cmp bl, 2
    je TwoHundred
    cmp bl, 3
    je TwoHundred
    cmp bl, 4
    je TwoHundred
    cmp bl, 5
    je TwoHundred
    cmp bl, 6
    je TwoHundred
    jmp Invalid
Dinner endp

Fifty proc
    ; Prompt for quantity
    lea dx, m35
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, 48
    mov bl, 50    ; Unit price for items in Breakfast

    ; Calculate total price
    mul bl         ; Multiply quantity (AL) by unit price (BL)
    aam            ; Convert to unpacked decimal in AX (AH: tens, AL: ones)

    ; Display total price
    mov cx, ax     ; Store result in CX
    add ch, 48     ; Convert tens digit to ASCII
    add cl, 48     ; Convert ones digit to ASCII

    lea dx, m37    ; Display "Total Price:"
    mov ah, 9
    int 21h

    mov dl, ch     ; Display tens digit
    mov ah, 2
    int 21h
    mov dl, cl     ; Display ones digit
    int 21h

    ; Display menu or exit options
    lea dx, m38    ; "1.Schedule"
    mov ah, 9
    int 21h
    lea dx, m39    ; "2.Exit"
    int 21h
    lea dx, m8     ; "Enter Your Choice:"
    int 21h
    mov ah, 1
    int 21h
    sub al, 48

    cmp al, 1
    je Schedule    ; Go back to Schedule
    cmp al, 2
    je Exit        ; Exit program
    jmp Invalid
Fifty endp


Invalid proc
    ; Invalid message
    call newline
    mov ah, 9
    lea dx, m36
    int 21h
    jmp Exit
Invalid endp

Exit proc
    mov ah, 4Ch
    int 21h
Exit endp

newline proc
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    ret
newline endp

main endp
end main
