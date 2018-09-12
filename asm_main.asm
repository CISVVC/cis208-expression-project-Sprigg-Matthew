;
; file: asm_main.asm
; Evaluate: 
;	A = (A-B) + A + (B - C + D)
;	B cancels. (Communitive Property of Addition)
;	A = 2A + D - C
;


%include "asm_io.inc"
%define A [ebp+8]
%define B [ebp+12]
%define C [ebp+16]
%define D [ebp+20]
;
; initialized data is put in the .data segment
;
segment .data


; uninitialized data is put in the .bss segment
;
segment .bss

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
;	VAR TABLE
; ====================
; EBP+4 | Ret Addr | 
; EBP+8 | Param 1  | A
; EBP+12| Param 2  | B
; EBP+16| Param 3  | C
; EBP+20| Param 4  | D
        enter   0,0    ; setup routine
	push 	ebp	; save ebp.
	mov 	ebp, esp ; new EBP = ESP
;Code
	mov 	eax, A
	add	eax, A
	add	eax, D
	sub	eax, C
; next print out result message as series of steps
	; Return A in eax to C.
	pop 	ebp	; restore ebp.
        leave
        ret
