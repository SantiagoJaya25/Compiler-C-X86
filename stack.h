#ifndef STACK
#define STACK

typedef struct _StackNode
{
	char parenteses;
	struct _StackNode *prev;

} StackNode;

typedef struct _Stack
{
	StackNode *top;
} Stack;

extern int inicializarPilha(Stack *stack);
extern int inserirElementoPilha(Stack *stack, char parenteses);
extern int apagarElementoPilha(Stack *stack);
extern int printPilha(Stack *stack);

#endif