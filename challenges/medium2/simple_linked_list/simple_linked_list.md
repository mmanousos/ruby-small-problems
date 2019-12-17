Simple Linked List
Write a simple linked list implementation that uses Elements and a List.

The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list to contain the range (1..10), and provide functions to reverse a linked list and convert to and from arrays.


* functionality:
add elements to the linked list
reverse the linked list
convert linked list to an array
convert from an array to a linked list


* Two classes:
  * Element
  takes 1 or 2 arguments at instantiation

methods:
  `datum`
    returns value of element
  `next`
    returns the next element object older than the caller (the previous element in the array)
  `tail?`
    true or false that it is the final element (?)


  * SimpleLinkedList
  can be initialized with no argument - creates empty array, returns nil
  holds multiple elements
  follows last in-first out principle

methods:
  `size`
    returns number of elements in the list
  `empty?`
    checks if the list is empty
  `push`
    returns new list with argument element added to the end of the list
   - get the last element in the list, pass in the new value with the last element
  `pop`
    returns last added element - list is mutated  
  `peek`
    returns the value of the element at the end of the list (gets the value without removing the element)
  `head`
    return the element at the start of the list (first element in the list)
  `from_a` - _class method_
    converts an array to a linked list by sequentially adding each element in the array to the list
    - instantiate a new list object, then push new values into it - in reverse - and return
  `reverse` - _instance method_
    - creates new linked list in reverse
    - or get the datum of each element in sequence and rebuilds the list in reverse
    - or iterates through the list backwards without changing the order of the list itself
    - *reverses order of pointers, not elements*
    - definitely creates a new `SimpleLinkedList` object
    current head points to first element in the array
    if index == 0
      set `next` = nil
    else
      `next` = list[index - 1]


  `to_a` - _instance method_
    returns a new array object from the list object - iterates through the `list` object, fetching the `datum` from each `element` sequentially


Problem
  list object made up of element objects

Example / Tests


Data Structure
object elements in an array
