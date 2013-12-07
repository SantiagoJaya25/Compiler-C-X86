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

	CMP [f], [g]
	JE Condicao2
	JNE Condicao3

	Condicao2:
		mov [b], 4
		JMP fimCondicao3

	CMP [a], [d]
	JE Condicao4
	JNE Condicao5

	Condicao4:
		mov [d], 10
		JMP fimCondicao5

	Condicao5:
		mov [f], 44
		fimCondicao5:

	Enquanto0:

	CMP [c], [d]
	JE Condicao6
	JNE Condicao7

	Condicao6:
	mov [b], 4
	JMP Enquanto0

	Condicao7: