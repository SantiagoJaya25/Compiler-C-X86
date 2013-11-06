#include <stdio.h>
#include "list.h"
#include <stdlib.h>
#include <string.h>

int inicializarLista(List *list)
{
	list->head = 0;
	list->tail = 0;
	
	return 0;
}

ListNode *inserirElemento(List *list, char *identificador, char *tipo)
{
	if(!list || !identificador)
		return NULL;

	if(procuraElemento(list, identificador))
		return NULL;

	ListNode *node;
	node = (ListNode*)malloc(sizeof(ListNode));

	node->identificador = identificador;
	node->tipo = tipo;

	if(!list->head)
	{
		list->head = node;
		node->prev = NULL;
	}
	else
	{
		list->tail->next = node;
		node->prev = list->tail;
	}

	node->next = NULL;
	list->tail = node;

	return node;
}

int alterarElemento(List *list, char *identificador, char *valorNovo)
{
	if(!list)
		return -1;

	ListNode *temp = (ListNode*)malloc(sizeof(ListNode));

	temp = procuraElemento(list, identificador);

	temp->valor = valorNovo;

	temp->preenchido = 1;

	return 0;
		
}

ListNode* procuraElemento(List *list, char *identificador)
{
	if(!list || !identificador)
		return NULL;

	ListNode *node = list->head;

	while(node)
	{
		if(!strcmp(node->identificador, identificador))
		{
			return node;
		}

		node = node->next;
	}

	return NULL;
}

void printList(List *list)
{
	if(!list)
		return;

	ListNode *temp = list->head;

	while(temp)
	{
		printf("%s ", temp->identificador);
		temp = temp->next;
	}
	printf("\n");
}
