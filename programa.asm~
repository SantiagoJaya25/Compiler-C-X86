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
		mov [c], 9
		mov [d], 12

	Condicao1:
		mov [d], 11
		mov [c], 10

	CMP [e], [f]
	JE Condicao2
	JNE Condicao3

	Condicao2:
		mov [e], 8.88
		mov [f], 9.99

	Condicao3:
		mov [f], 6

	CMP [g], [d]
	JE Condicao4
	JNE Condicao5

	Condicao4:
		mov [e], 8.88
		mov [f], 9.99