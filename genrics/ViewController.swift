//
//  ViewController.swift
//  genrics
//
//  Created by Keshav Raj Kashyap on 09/02/22.
//

import UIKit

class ViewController: UIViewController {
    var someInt = 3
    var anotherInt = 107
    var stackOfStrings = Stack<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        /* without genric
         swapTwoInts(&someInt, &anotherInt)
         print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")        // Do any additional setup after loading the view.*/
        swapTwoVal(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        print("<===================>")
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        _ = stackOfStrings.pop()
        print(stackOfStrings)
        
    }
    
  /*  func swapTwoInts(_ a : inout Int, _ b: inout Int){
        let tempA = a
        a = b
        b = tempA
    }*/
    
    func swapTwoVal<T>(_ a : inout T, _ b: inout T){
          let tempA = a
          a = b
          b = tempA
      }
   /// non genric type stack
    struct IntStack{
        var items :[Int] = []
        mutating func push(_ item: Int) -> Int{
            return items.removeLast()
        }
    }
    
    ///genric type stack
    struct Stack<Element>{
        var items:[Element] = []
        mutating func push(_ item:Element){
            items.append(item)
        }
        mutating func pop() -> Element{
            items.removeLast()
        }
    }

}

//Extending a Generic Type
//When you extend a generic type, you don’t provide a type parameter list as part of the extension’s definition. Instead, the type parameter list from the original type definition is available within the body of the extension, and the original type parameter names are used to refer to the type parameters from the original definition.
//
//The following example extends the generic Stack type to add a read-only computed property called topItem, which returns the top item on the stack without popping it from the stack:
//
//extension Stack {
//    var topItem: Element? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//The topItem property returns an optional value of type Element. If the stack is empty, topItem returns nil; if the stack isn’t empty, topItem returns the final item in the items array.
//
//Note that this extension doesn’t define a type parameter list. Instead, the Stack type’s existing type parameter name, Element, is used within the extension to indicate the optional type of the topItem computed property.
//
//The topItem computed property can now be used with any Stack instance to access and query its top item without removing it.
//
//if let topItem = stackOfStrings.topItem {
//    print("The top item on the stack is \(topItem).")
//}
//// Prints "The top item on the stack is tres."
//Extensions of a generic type can also include requirements that instances of the extended type must satisfy in order to gain the new functionality, as discussed in Extensions with a Generic Where Clause below.
