#include <iostream>
#include "DoublyLinkedList.h"

int main()
{
	DoublyLinkedList *node = new DoublyLinkedList(), *node2 = new DoublyLinkedList();
	node->push_back(*(new ListNode("1")));
	node->push_back(*(new ListNode("2")));
	node->push_back(*(new ListNode("3")));
	node->print();
	std::cout << "-------------------\n";
	node->push_front(*(new ListNode("0")));
	node->print_bkw();
	std::cout << "-------------------\n";
	node->pop_front();
	node->pop_back();
	node->print();
	std::cout << "-------------------\n";
	node->insert_ord(*(new ListNode("4")));
	node->print();
	std::cout << "-------------------\n";
	node->erase("2");
	node->print();
	std::cout << "-------------------\n";
	node2->push_back(*(new ListNode("10")));
	node2->push_back(*(new ListNode("5")));
	node2->push_back(*(new ListNode("12")));
	node2->push_back(*(new ListNode("1")));
	node2->push_back(*(new ListNode("3")));
	node2->push_back(*(new ListNode("10")));
	node->assign(*node2, 0, 5);
	node->print();
	std::cout << "-------------------\n";
	node->sort();
	node->print();
	std::cout << "-------------------\n";
	return 0;
}