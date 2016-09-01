.486
.model flat
Data1 segment
    Sumc4  dw 0
    Sumnc4 dw 0
    A1     dd 3 dup (5 dup (9 dup (1020201h)))
Data1 ends

Data2 segment
	A2 dw 2 dup (8 dup (4 dup (0)))
	A3 dw 4 dup (4 dup (4 dup (0)))
Data2 ends

Code1 segment
_start: 
    mov si, 0
    START_LOOP: 
    
        mov ax,si ;check if current offset divide by 4
        mov dl,4
        div dl
        cmp ah,0 
        je IS_DIV_BY_4

        mov ax, Sumnc4 ;if it isn't
        add ax, word ptr[A1+si]
        mov Sumnc4, ax
        jmp CHECK_LOOP
            
        IS_DIV_BY_4: ;if it is
        mov ax,Sumc4
        add ax,word ptr[A1+si]
        mov Sumc4,ax  
                         
        CHECK_LOOP: 
        cmp si,540
        inc si
        jb START_LOOP
        
        call GO_TO_CODE2      

Code1 ends

Code2 segment
	GO_TO_CODE2:
	cld
	mov     ax,Sumc4
    lea     edi,A2
    mov     cx,64
	rep     stosw
	
	cld
	mov     ax,Sumnc4
    lea     edi,A3
    mov     cx,64
	rep     stosw
	ret

Code2 ends
end _start