#ifndef LIST
#define LIST

typedef struct _ListNode
{
	char *tipo;
	char *identificador;
	int preenchido;
	void *valor;
	
	struct _ListNode *next;
	struct _ListNode *prev;
} ListNode;

typedef struct _List
{
	ListNode *head;
	ListNode *tail;
} List;

extern int inicializarLista(List *list);
extern ListNode *inserirElemento(List *list, char *identificador, char *tipo);
extern int alterarElemento(List *list, char *identificador, void *valorNovo);
extern ListNode* procuraElemento(List *list, char *identificador);
extern void printList(List *list);

#endif
