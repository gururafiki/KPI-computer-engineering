; Вариант 1
; 7 6 5 4 3 2 1 0
; 5 4 5 0 6 7 2 1

;        	76543210
; source	01100110b	66
; result	10101011b	AB

.286

code SEGMENT
	ASSUME cs:code

begin:
	mov	AH,	01100110b

	; 1
	mov	BH,	AH
	and	BH,	00000010b
	shr	BH,	1
	or	AL,	BH	; 00000011b	03
	
	; 2
	mov	BH,	AH
	and	BH,	00000100b
	shr	BH,	1
	or	AL,	BH	; 00000011b	03
	
	; 7
	mov	BH,	AH
	and	BH,	10000000b
	shr	BH,	5
	or	AL,	BH	; 00000011b 03
	
	; 6
	mov	BH,	AH
	and	BH,	01000000b
	shr	BH,	3
	or	AL,	BH	; 00001011b 0B
	
	; 0
	mov	BH,	AH
	and	BH,	00000001b
	shl	BH,	4
	or	AL,	BH	; 00001011b 0B
	
	; 5_5
	mov	BH,	AH
	and	BH,	00100000b
	or	AL,	BH 	; 00101011b 2B
	shl	BH,	2
	or	AL,	BH	; 10101011b	AB
	
	; 4
	mov	BH,	AH
	and	BH,	00010000b
	shl	BH,	2
	or	AL,	BH	; 10101011b	AB

	mov	ax,	4c00h
	int	21h
code ENDS
	end begin