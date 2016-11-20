#include "ListNode.h"
#include <cstring>

ListNode::ListNode()
{
	prev = nullptr;
	next = nullptr;
	data = nullptr;
}

ListNode::ListNode(char *_data)
{
	if (_data != nullptr)
	{
		data = new char[strlen(_data) + 1];
		strcpy(data, _data);
	}
	else
	{
		data = nullptr;
	}

	prev = nullptr;
	next = nullptr;
}

ListNode::~ListNode(void)
{
	if (data == nullptr)
	{
		delete[] this->data;
	}
}