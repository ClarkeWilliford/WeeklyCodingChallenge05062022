//
//  main.swift
//  WeeklyCodingChallenge05062022
//
//  Created by Clarke Williford on 5/6/22.
//

import Foundation

public class Node<T> {
    var value: T
    
    var next: Node<T>?
    
    init(value: T) {
        
        
        self.value = value
        
        
    }
}

class SingleLinkedList<T>{
    
    var head: Node<T>?
    
    public var isEmpty:Bool {
        
        return head == nil
        
    }
    
    public var first: Node<T>?{
        
        return head
        
    }
    
    public func append(value: T) {
        
        let newNode = Node(value: value)
        
        if var temp = head {
            
            while temp.next != nil {
                
                temp = temp.next!
                
            }
            
            temp.next = newNode
            
        } else {
            
            head = newNode
            
        }
    }
    
    func insert(data: T, at position: Int) {
        
        let newNode = Node(value: data)
        
        if (position == 0) {
            newNode.next = head

            head = newNode
            
        }
        else {
            var previous = head
            
            var current = head
            
            for _ in 0..<position {
                
                previous = current
                
                current = current?.next
            }
            
            newNode.next = previous?.next
            
            previous?.next = newNode
            
        }
    }
    
    func deleteNode( at position: Int){
        
        if head == nil{
            return
        }
        
        var temp = head
        
        if (position == 0){
            
            for _ in 0..<position-1 where temp != nil {
                
                temp = temp?.next
                
            }
        }
        
        if temp == nil || temp?.next == nil{
            return
        }
        
        let nextToNextNode = temp?.next?.next
        
        temp?.next = nextToNextNode
        
    }
        
    func printList() {
        
        var current: Node? = head
        
        while (current != nil) {
            
            print("SLL item is: \(current?.value as? String ?? "")")
            
            current = current?.next
        }
    }
    
    
}


func testIntersection(list1: SingleLinkedList<String>, list2: SingleLinkedList<String>) -> Int{
    
    let position = 3
    
    let temp1 = list1.head
    
    let temp2 = list2.head
    
    for i in 0..<position where temp1 != nil{
        if temp1 === temp2 {
            return i
        }
    }
    return 0
}


let sll = SingleLinkedList<String>()

sll.append(value: "Kim")

sll.append(value: "Sally")

sll.append(value: "Ishusa")

//sll.printList()

//sll.insert(data: "Johnny", at: 1)

//sll.printList()

//sll.deleteNode(at: 2)

//sll.printList()

let sll2 = SingleLinkedList<String>()

sll2.append(value: "Jim")

sll2.append(value: "Jack")

sll2.append(value: "Roger")

sll2.append(value: "Sally")

print(testIntersection(list1: sll, list2: sll2))




