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

	printList(&mylist);

	return 0;
}