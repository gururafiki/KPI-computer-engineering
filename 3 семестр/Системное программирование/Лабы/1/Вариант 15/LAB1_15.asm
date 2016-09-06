code Segment      	   ;7 6 5 4 3 2 1 0     01010100
   	Assume cs:code     ;3 0 4 3 6 3 1 7     00101000

begin:
	mov dl,01010100b
	xor dh,dh

	; 3 - rozryad

	mov ah,dl
	and ah,00001000b
	mov cl,1
	shr ah,cl
	or dh,ah

	
	shl ah,cl
	or dh,ah 


	mov cl,4
	shl ah,cl
	or dh,ah

	xor ah,ah

	; 0 - rozryad

	mov ah,dl
	and ah,00000001b
	mov cl,6
	shl ah,cl
	or dh,ah

	xor ah,ah

 	; 4 - rozryad

 	mov ah,dl             
 	and ah,00010000b
 	mov cl,1
 	shl ah,cl
 	or dh,ah

 	xor ah,ah 

 	; 6 -rozryad             

 	mov ah,dl
 	and ah,01000000b
 	mov cl,3
 	shr ah,cl
 	or dh,ah

 	xor ah,ah


 	;7 - rozryad

 	mov ah,dl
 	and ah,000000001b
 	mov cl,7
 	shr ah,cl
 	or dh,ah

 	xor ah,ah


 	mov ax,4c00h
 	int 21h
 code Ends
 	end begin 






