code SEGMENT          ;7 6 5 4 3 2 1 0      01010101
     ASSUME cs:code   ;2 3 6 3 2 7 3 3      10101000

begin:
        mov dl, 01010101b   ; занесення початкових даних в регістр dl
        xor dh, dh   

        ; 2-ий розряд
        mov ah, dl          
        and ah, 00000100b   
        shl ah, 1         
        or dh, ah 
        mov cl, 4
        shl ah, cl         
        or dh, ah        
        xor ah, ah  

        ; 3-ій розряд
        mov ah, dl          
        and ah, 00001000b
        mov cl, 3   
        shr ah, cl    
        or dh, ah

        shl ah, 1         
        or dh, ah 

        mov cl, 3
        shl ah,cl
        or dh, ah

        mov cl, 2
        shl ah, cl
        or dh, ah       
        xor ah, ah   

        ; 6-ий розряд
        mov ah, dl          ; копіюємо вхідні дані у ah
        and ah, 01000000b   ; виділяємо 7-ий розряд
        shr ah, 1           ; зміщуємо на 5 розрядів вправо
        or dh, ah           ; записуємо значення 0-го розряду в результат
        xor ah, ah          ; обнуляємо ah

        ; 7-ий розряд
        mov ah, dl          ; копіюємо вхідні дані у ah
        and ah, 10000000b   ; виділяємо 7-ий розряд
        mov cl, 5
        shr ah, cl          ; зміщуємо на 5 розрядів вправо
        or dh, ah           ; записуємо значення 0-го розряду в результат
        xor ah, ah          ; обнуляємо ah

        mov ax, 4c00h    ;  4c00h – код для операційної системи
        int 21h          ;  виклик функції операційної системи
code ENDS
    end begin