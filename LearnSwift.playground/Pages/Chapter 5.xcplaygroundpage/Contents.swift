import UIKit

let myTuple = (10, 422.575, "Blah blah blah")
let myString = myTuple.1
print(myString)

var (tenString, _, bString) = myTuple
print(tenString)
print(bString)
print(myTuple)

let secondTuple = (count: 20, length: 89.90, message: "parrrrppp")
print(secondTuple)
print(secondTuple.message)

var index: Int?
index = 3
var treeArray = ["Oak", "Pine", "Yew", "Birch"]

if index != nil {
    print(treeArray[index!])
} else {
    print("index does not contain a value")
}

// Use optional binding instead.
var indexTwo: Int?
indexTwo = 0
var treeArrayTwo = ["Oak", "Pine", "Yew", "Birch"]

// myValue is a temporary value known as a shadow.
// You can use the same shadow or temporary value name as the name that is assigned to the optional
// since the temporary value is only available within the scope of the if statement.
if let indexTwo = indexTwo {
    print(treeArrayTwo[indexTwo])
} else {
    print("indexTwo does not contain a value")
}

// Since using the temporary value is redundant you can use this shorthand.
// You no longer need to assign the optional to a temporary value.
var indexThree: Int?
indexThree = 1
var treeArrayThree = ["Oak", "Pine", "Yew", "Birch"]

if let indexThree {
    print(treeArrayThree[indexThree])
} else {
    print("indexThree does not contain a value")
}

// The following code uses shorthand optional binding to unwrap two options within a single statement:
var pet1: String?
var pet2: String?

pet1 = "cat"
pet2 = "dog"

if let pet1, let pet2 {
    print(pet1)
    print(pet2)
} else {
    print("Insufficient pets!!!")
}

/* Upcasting
Occurs when an object of a particular class is cast to one of it's superclasses.
Upcasting is performed using the as keyword and is also referred to as guaranteed conversion since
the compiler can tell from the code the cast will be successful.
Since UIButton is a subclass of UIControl, the object can be safely upcast as follows*/
let myButton: UIButton = UIButton()
let myControl = myButton as UIControl

/* Downcasting
Occurs when a conversion is made from one class to another where there is no guarantee that the cast
 can be made safely or that an invalid casting attempt will be caught be the compiler.

 When an invalid cast is made in downcasting and not identified by the compiler it will most likely
 lead to an error at runtime.

 Downcasting usually involves converting from a class to one of it's subclasses.
 */

// This code will compile but crash since you cannot downcast UIScrollView to UITextView
let myScrollView: UIScrollView = UIScrollView()
//let myTextView = myScrollView as! UITextView

// Safer approach to downcasting

if let myTextView = myScrollView as? UITextView {
    print("Type cast to UITextView succeeded.")
} else {
    print("Type cast to UITextView failed.")
}
