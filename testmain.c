#include <stdio.h>
#include <stdlib.h>
#include "list.h"

int main(void)
{
	List mylist;
	inicializarLista(&mylist);
	inserirElemento(&mylist, "AlexGay");
	inserirElemento(&mylist, "FodaSePerigo");
	inserirElemento(&mylist, "MarcosPunheteiro");
	inserirElemento(&mylist, "AlexGay");
	inserirElemento(&mylist, "MarcosPunheteiro");

	alterarElemento(&mylist, "AlexGay", "CarlosBiroba");        
        ListNode *temp = (ListNode*)malloc(sizeof(ListNode));
        temp = procuraElemento(&mylist, "AlexGay");

        printf("O valor do identificador %s eh %s\n", (char*) temp->identificador, (char*) temp->valor);

	printList(&mylist);

	return 0;
}
