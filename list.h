#ifndef LIST
#define LIST

typedef struct _ListNode
{
	char *tipo;
	char *identificador;
	int preenchido;
	char *valor;
	
	struct _ListNode *next;
	struct _ListNode *prev;
} ListNode;

typedef struct _List
{
	ListNode *head;
	ListNode *tail;
} List;

extern int inicializarLista(List *list);
extern ListNode *inserirElementoLista(List *list, char *identificador, char *tipo);
extern int alterarElementoLista(List *list, char *identificador, char *valorNovo);
extern ListNode* procuraElementoLista(List *list, char *identificador);
extern void printList(List *list);

#endif
