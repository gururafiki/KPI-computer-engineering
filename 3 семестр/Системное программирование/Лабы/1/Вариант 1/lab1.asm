; Вариант 1
; 7 6 5 4 3 2 1 0
; 5 4 5 0 6 7 2 1

code SEGMENT
	ASSUME cs:code

begin:
	mov dl, 01100110b

	mov ah, dl
	add ah, 00000010b
	shr ah, 1
	mov dh, ah

	mov ah, dl
	add ah, 0000100b
	mov cl, 1
	shr ah, cl
	or dh, ah

	mov ah, dl
	add ah, 10000000b
	mov cl, 5
	shr ah, cl
	or dh, ah

	mov ah, dl
	add ah, 01000000b
	mov cl, 3
	shr ah, cl
	or dh, ah

	mov ah, dl
	add ah, 00000001b
	mov cl, 4
	shl ah, cl
	or dh, ah

	mov ah, dl
	add ah, 00100000b
	or dh, ah
	mov cl, 2
	shl ah, cl
	or dh, ah

	mov ah, dl
	add ah, 00010000b
	mov cl, 2
	shl ah, cl
	or dh, ah

	mov ax, 4c00h
	int 21h
code ENDS
	end begin