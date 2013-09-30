#ifndef LIST
#define LIST

typedef struct _ListNode
{
	char *identificador;
	bool preenchido;
	void *valor;
	
	struct _ListNode *next;
	struct _ListNode *prev;
} ListNode;

typedef struct _List
{
	ListNode *head;
	ListNode *tail;
} List;

extern int inserirElemento(char *identificador);

#endif
