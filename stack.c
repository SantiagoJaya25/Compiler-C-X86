#include "stack.h"
#include <stdlib.h>
#include <stdio.h>

int inicializarPilha(Stack *stack)
{
	stack->top = 0;

	return 0;
}

int inserirElemento(Stack *stack, char parenteses)
{
	if(!stack)
		return -1;

	StackNode *node;
	node = (StackNode*)malloc(sizeof(StackNode));
	if(!node)
	{
		return -1;
	}
	node->parenteses = parenteses;
	node->prev = stack->top;
	stack->top = node;

	return 0;
}
int apagarElemento(Stack *stack)
{
	if(!stack || !stack->top)
	{
		return -1;
	}
	StackNode *temp;
	temp = stack->top;
	stack->top = temp->prev;

	free(temp);
	return 0;
}

int printPilha(Stack *stack)
{
	StackNode *temp = (StackNode*)malloc(sizeof(StackNode));;
	
	for (temp = stack->top; temp; temp = temp->prev)
	{
		printf("%c ", temp->parenteses);
	}
	printf("\n");

	return 0;
}
