#include <iostream>
#include "DoublyLinkedList.h"
#include <cstring>

using namespace std;

DoublyLinkedList::DoublyLinkedList() :head(nullptr) {};

DoublyLinkedList::~DoublyLinkedList()
{
	ListNode *curr;

	if (head != nullptr)
	{
		curr = head;
		while (head != nullptr)
		{
			delete curr;
			head = head->next;
		}
	}
}

int DoublyLinkedList::size()
{
	ListNode *curr = head;
	int num = 0;

	for (curr = head; curr != nullptr; curr = curr->next)
		num++;

	return num;
}

bool DoublyLinkedList::empty()
{
	return head == nullptr;
}

void DoublyLinkedList::clear()
{
	ListNode *curr = head;

	while (curr != nullptr)
	{
		head = head->next;
		delete curr;
		curr = head;
	}

	head = nullptr;
}

void DoublyLinkedList::push_back(const ListNode &nd)
{
	ListNode *last, *ptr = new ListNode(nd.data);

	if (head == nullptr)
	{
		head = ptr;
	}
	else
	{
		last = head;

		while (last->next != nullptr)
		{
			last = last->next;
		}

		ptr->prev = last;
		last->next = ptr;
	}
}

void DoublyLinkedList::push_front(const ListNode &nd)
{
	ListNode *ptr = new ListNode(nd.data);

	if (head == nullptr)
	{
		head = ptr;
	}
	else
	{
		head->prev = ptr;
		ptr->next = head;
		head = ptr;
	}
}

void DoublyLinkedList::pop_front()
{
	ListNode *node;

	if (head != nullptr)
	{
		if (head->next == nullptr)
		{
			delete head;
			head = nullptr;
		}
		else
		{
			node = head;
			head = head->next;
			delete node;
		}
	}
}

void DoublyLinkedList::pop_back()
{
	ListNode *node, *last;

	if (head != nullptr)
	{
		if (head->next == nullptr)
		{
			delete head;
			head = nullptr;
		}
		else
		{
			last = head;

			while (last->next != nullptr)
			{
				last = last->next;
			}

			node = last;
			last = last->prev;
			delete node;
			last->next = nullptr;
		}
	}
}

void DoublyLinkedList::insert_ord(const ListNode &nd)
{
	ListNode *prev, *ptr, *node = new ListNode(nd.data);

	if (head != nullptr)
	{
		ptr = head;
		prev = nullptr;

		while (ptr != nullptr && strcmp(ptr->data, node->data) < 0)
		{
			prev = ptr;
			ptr = ptr->next;
		}

		if (ptr == head)
		{
			push_front(*node);
		}
		else
		{
			node->next = ptr;
			prev->next = node;
		}

	}
	else head = node;
}

void DoublyLinkedList::sort()
{
	DoublyLinkedList *dl = new DoublyLinkedList();
	ListNode *source = this->head;
	
	if (head != nullptr && head->next != nullptr)
	{
		while (source != nullptr)
		{
			dl->insert_ord(*(new ListNode(source->data)));
			source = source->next;
		}

		this->operator=(*dl);
		dl->clear();
		delete dl;
	}
}

bool DoublyLinkedList::insert_after(char *dat, const ListNode &nd)
{
	bool result = false;
	ListNode *curr = head, *node;

	while (curr != nullptr)
	{
		if (strcmp(curr->data, dat) == 0)
		{
			node = new ListNode(nd.data);

			if (curr->next == nullptr)
			{
				curr->next = node;
				node->prev = curr;
			}
			else
			{
				node->next = curr->next->next;
				node->prev = curr;
				curr->next->prev = node;
				curr->next = node;
			}

			result = true;
		}

		curr = curr->next;
	}

	return result;
}

void DoublyLinkedList::operator=(const DoublyLinkedList &dl)
{
	ListNode *curr;

	if (this != &dl)
	{
		this->clear();

		for (curr = dl.head; curr != nullptr; curr = curr->next)
			this->push_back(*(new ListNode(curr->data)));
	}
}

void DoublyLinkedList::merge(DoublyLinkedList &dl)
{
	while (dl.head != nullptr)
	{
		this->push_back(*(new ListNode(dl.head->data)));
		dl.pop_front();
	}
}

void DoublyLinkedList::erase(char *dat)
{
	ListNode *curr = head, *buff;

	while (curr != nullptr)
	{
		if (strcmp(curr->data, dat) == 0)
		{
			if (curr == head)
			{
				head = head->next;
				delete curr;
				curr = head;
				continue;
			}
			else if (curr->next == nullptr)
			{
				curr->prev->next = nullptr;
				delete curr;
				curr = nullptr;
			}
			else
			{
				curr->prev->next = curr->next;
				curr->next->prev = curr->prev;
				buff = curr->next;
				delete curr;
				curr = buff;
			}
		}
		else curr = curr->next;
	}
}

void DoublyLinkedList::unique()
{
	ListNode *curr = head, *curr2, *buff;

	while ((curr2 = curr->next) != nullptr)
	{
		while (curr2 != nullptr)
		{
			if (strcmp(curr->data, curr2->data) == 0)
			{
				if (curr2->next == nullptr)
				{
					curr2->prev->next = nullptr;
					delete curr2;
					break;
				}
				else
				{
					curr2->prev->next = curr2->next;
					curr2->next->prev = curr2->prev;
					buff = curr2->prev;
					delete curr2;
					curr2 = buff;
				}
			}

			curr2 = curr2->next;
		}

		curr = curr->next;
	}
}

void DoublyLinkedList::assign(DoublyLinkedList &dl, int first, int last)
{
	ListNode *source = dl.head, *buff;
	int i = 0;

	while (i < last && source != nullptr)
	{
		if (i > first)
		{
			source->next->prev = source->prev;
			source->prev->next = source->next;
			this->push_back(*(new ListNode(source->data)));
			buff = source->prev;
			delete source;
			source = buff;
		}

		source = source->next;
		i++;
	}
}

void DoublyLinkedList::splice(int where, const DoublyLinkedList &dl)
{
	int i = 0;
	ListNode *curr, *node, *source = dl.head;
	bool blast = false;

	if (source != nullptr)
	{
		curr = this->head;

		while (i < where)
		{
			if (curr->next == nullptr)
			{
				if (i + 1 >= where)
				{
					blast = true;
					break;
				}
				else return;
			}

			curr = curr->next;
			i++;
		}

		if (blast)
		{
			while (source != nullptr)
			{
				node = new ListNode(source->data);

				curr->next = node;
				node->prev = curr;

				curr = curr->next;
				source = source->next;
			}
		}
		else
		{
			while (source != nullptr)
			{
				node = new ListNode(source->data);

				if (curr == this->head)
				{
					curr->prev = node;
					node->next = curr;
					this->head = node;
				}
				else
				{
					node->next = curr;
					node->prev = curr->prev;
					curr->prev->next = node;
					curr->prev = node;
				}

				source = source->next;
			}
		}
	}
}

void DoublyLinkedList::splice(int where, const DoublyLinkedList &dl, int first, int last)
{
	int i = 0;
	ListNode *curr, *node, *source = dl.head;
	bool blast = false;

	if (source != nullptr)
	{
		curr = this->head;

		while (i < where)
		{
			if (curr->next == nullptr)
			{
				if (i + 1 >= where)
				{
					blast = true;
					break;
				}
				else return;
			}

			curr = curr->next;
			i++;
		}

		i = 0;

		if (blast)
		{
			while (source != nullptr)
			{
				i++;
				if (i <= first)
				{
					source = source->next;
					continue;
				}
				else if (i - 1 > last)
					break;

				node = new ListNode(source->data);

				curr->next = node;
				node->prev = curr;

				curr = curr->next;
				source = source->next;
			}
		}
		else
		{
			while (source != nullptr)
			{
				i++;
				if (i <= first)
				{
					source = source->next;
					continue;
				}
				else if (i - 1 > last)
					break;

				node = new ListNode(source->data);

				if (curr == this->head)
				{
					curr->prev = node;
					node->next = curr;
					this->head = node;
				}
				else
				{
					node->next = curr;
					node->prev = curr->prev;
					curr->prev->next = node;
					curr->prev = node;
				}

				source = source->next;
			}
		}
	}
}

void DoublyLinkedList::print()
{
	int i = 0;
	ListNode *curr;

	if (head == nullptr)
	{
		std::cout << "List is empty" << std::endl;
	}
	else
	{
		for (curr = head; curr != NULL; curr = curr->next)
		{
			std::cout << "[" << i++ << "] " << curr->data << std::endl;
		}
	}
}

void DoublyLinkedList::print_bkw()
{
	int i = 0;
	ListNode *curr;

	if (head == nullptr)
	{
		std::cout << "List is empty" << std::endl;
	}
	else
	{
		curr = head;
		while (curr->next != nullptr)
		{
			curr = curr->next;
			i++;
		}

		for (curr; curr != NULL; curr = curr->prev)
		{
			std::cout << "[" << i-- << "] " << curr->data << std::endl;
		}
	}
}