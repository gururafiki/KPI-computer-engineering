code	segment			; 76543210	10011101
		assume	cs:code ; 52731305	01110110

begin:
	mov dl, 10011101b	; вносим входной операнд в регистр dl

	; 7, 0
	mov ah, dl			
	and ah, 00100000b
	mov cl, 2
	shl ah, cl			; выбираем нужный нам разряд и переносим его в указанное место согласно условию
	or  dh, ah			; дальше производятся те же действия

	mov cl, 7
	shr ah, cl
	or  dh, ah

	; 6
	mov ah, dl
	and ah, 00000100b
	mov cl, 4
	shl ah, cl
	or  dh, ah

	; 5
	mov ah, dl
	and ah, 10000000b
	mov cl, 2
	shr ah, cl
	or  dh, ah

	; 4, 2
	mov ah, dl
	and ah, 00001000b
	shl ah, 1
	or  dh, ah
	mov cl, 2
	shr ah, cl
	or  dh, ah

	; 3
	mov ah, dl
	and ah, 00000010b
	mov cl, 2
	shl ah, cl
	or  dh, ah

	; 1
	mov ah, dl
	and ah, 00000001b
	shl ah, 1
	or  dh, ah
	
	nop

	mov ax, 4c00h		; заносим в регистр ax функцию 4c с результатом выполнения 00
	int 21h				; вызываем прерывание 21, выполняя функцию в регистре ax
code ends
	 end begin

