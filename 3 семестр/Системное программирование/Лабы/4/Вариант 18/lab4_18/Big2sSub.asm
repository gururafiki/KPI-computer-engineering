
.386
.model flat, C

.code
Big2sSub proc
	push ebp
	mov ebp, esp;// базова адреса фактичних параметрів
	mov esi,0
    mov si, [ebp + 16]  ;length
    and si, 00000011b
	mov ebx, esi
	;mov edi , [ebp + 4]  ;m3
	mov edx, [ebp + 8]  ;m1
	mov ecx, [ebp + 12] ;m2

	clc
    start_32_loop:
        cmp ebx,esi
        je NEW_FIRST_ITER
        popf
        NEW_FIRST_ITER:
        mov eax, dword ptr [edx + ebx]
        sbb eax, dword ptr [ecx + ebx]
        pushf
        mov [edx + ebx], eax
		add ebx,4
        cmp ebx,[ebp + 16]
        jl start_32_loop

	cmp si,0
	je END_LABEL
	mov bx,0

    start_8_loop:
        cmp bx,0
        je FIRST_ITER
        popf
        FIRST_ITER:
		mov ah,byte ptr [edx + ebx]
        sbb ah,byte ptr [ecx + ebx]
        pushf
        mov byte ptr [edx + ebx], ah
        inc bx
        cmp bx, si
        jl start_8_loop
	END_LABEL:
	popf
	pop ebp
	ret
Big2sSub endp
end
