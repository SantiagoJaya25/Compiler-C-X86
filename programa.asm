section .bss
	a resb 4
	b resb 4
	c resb 4
	d resb 4
	e resb 8
	f resb 8
	g resb 8
	h resb 8
	testeVariavel resb 4

section .text
	global _start
_start:
	mov [a], 5
	mov [b], 6
	mov [g], 1.4
	mov [h], 2.5
	mov [c], 1


	CMP [a], [b]
	JE Condicao0
	JNE Condicao1

	Condicao0:
		mov [a], 7
		JMP fimCondicao1

	Condicao1:
		mov [b], 4
		fimCondicao1:

	Enquanto0:

	CMP [c], [d]
	JE Condicao2
	JNE Condicao3