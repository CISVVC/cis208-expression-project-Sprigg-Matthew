;
; file: asm_main.asm
; Evaluate: 
;	A = (A-B) + A + (B - C + D)
;	B cancels. (Communitive Property of Addition)
;	A = 2A + D - C


%include "asm_io.inc"
%define A ebp+12
%define B ebp+16
%define C ebp+20
%define D ebp+24
;
;---------------------------------------------------
; initialized data is put in the .data segment
;
segment .data


;---------------------------------------------------
; uninitialized data is put in the .bss segment
;
segment .bss

;
;---------------------------------------------------
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
;---------------------------------------------------
; PROLOGUE					   ;
;---------------------------------------------------
;	VAR TABLE
; ====================
; EBP+4 | Ret EBP  | 
; EBP+8 | Ret Addr | 
; EBP+12| Param 1  | A
; EBP+16| Param 2  | B
; EBP+20| Param 3  | C
; EBP+24| Param 4  | D
        enter   0,0      ; setup routine
	push 	ebp   	 ; save ebp.
	mov 	ebp, esp ; new EBP = ESP
;---------------------------------------------------
; FUNCTION					   ;
;---------------------------------------------------
	mov 	eax, [A]	 ; eax =  A
	add	eax, [A]	 ; eax += A
	add	eax, [D] 	 ; eax += D
	sub	eax, [C] 	 ; eax -= C

;---------------------------------------------------
; EPILOGUE					   ;
;---------------------------------------------------
	; Return A in eax to C.
	pop 	ebp	; restore ebp.
        leave
        ret
