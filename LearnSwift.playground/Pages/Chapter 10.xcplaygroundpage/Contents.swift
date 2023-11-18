// The Basics of Swift Object-Oriented Programming

class BankAccount {
    // stored properties
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00

    // computed property
    // Implemented by creating getter and optional corresponding setter methods containing
    // the code to perform the computation.
    // They are accessed in the same way as stored properties using dot-notation
    var balanceLessFees: Float {
        get {
            return accountBalance - fees
        }

        set(newBalance) {
            accountBalance = newBalance - fees
        }
    }

    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }

    deinit {
        // Perform any necessary clean up here.
    }

    // Instance method - only operate on the instances of the class
    // Declared within the opening and closing braces of the class to which they belong are declared using the
    // standard Swift function declaration syntax.
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }

    // type method
    // Declared in the same way as instance methods with the exception that the declaration is preceded by the class keyword.
    // Great for the case that you don't want to have to go through the process of first creating a class instance
    class func getMaxBalance() -> Float {
        return 100000.00
    }
}

var account1 = BankAccount(number: 45, balance: 88.88)
var balance1 = account1.accountBalance
print(balance1)
// Instance method
account1.displayBalance()

// Type method
BankAccount.getMaxBalance()
var maxAllowed = BankAccount.getMaxBalance()
print(maxAllowed)

// Class properties in Swift fall into two categories.
// stored properties - values contained within a constant or a variable
// computed property - a value that is derived based on some form of calculation or logic at the point at
// which the property is set or retrieved
var balance2 = account1.balanceLessFees
account1.balanceLessFees = 12123.12
print(account1.accountBalance)

// Lazy Stored Properties

// Ways to initialize a property:

var myProperty = 10

// Or assign a value within the initializer:
class MyClass {
    let title: String

    init(title: String) {
        self.title = title
    }
}

// Or for more complex requirements, a property may be initialized as a closure:
/* In the case of a complex closure, there is the potential for the initialization to be resource intensive
 and time consuming. When declared this way, the initialization will be performed every time an instance of
 the class is created.*/
class MySecondClass {
    var myProperty: String = {
        var result = resourceIntensiveTask()
        result = processedData(data: result)
        return result
    }()
}

/* In the situation where the value assigned to the property may not be known until a later
 stage in the execution process, for example after data has been retrieved from a database or
 user input has been obtained from the user.

 A far more efficient solution in such situations would be for the initialization to take place only
 when the property is first accessed.*/

// Declare the property as lazy like so:
class MyThirdClass {
    lazy var myProperty: String = {
        var result = resourceIntensiveTask()
        result = processData(data: result)
        return result
    }()
}

// Self - indicates that the method or property belongs to the current class instance
// It is no longer necessary to use self in most situations since this is now assumed to be the default
// for references to properties and methods.

// One situation where it is still necessary to use self is when referencing a property or method
// from within a closure expression.

document?.openWithCompletionHandler({ (success: Bool) -> Void in
    if success {
        self.ubiquityURL
    }
})

// It is also necessary to use self to resolve ambiguity such as when a function parameter
// has the same name as a class property.

class MyClass {
    var myNumber = 10

    func addTen(myNumber: Int) {
        print(myNumber)
        print(self.myNumber)
    }
}

// Swift protocols
/* A set of rules that define the minimum requirements that suit a particular task or piece of functionality.
 Any type that satisfies the requirements of a protocol is said to conform to that protocol.

 A protocol is declared using the protocol keyword and simply defines the methods and properties that
 a class must contain in order to be in conformance.

 Use cases:
 - Interface
 - Delegate patterns
 - Adopting multiple behaviors
 - Generics and type constraints
 - Swift Standard Library, types like Equatable and Comparable.
 */

protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildMessage() -> String {
        "Hello" + name
    }
}

// Opaque return types

// Function with a concrete return type:
func doubleFunc1(value: Int) -> Int {
    return value + 2
}

/* Function with an opaque return type:
Opaque return types allow a function to return any type as long it conforms to a specified protocol.

 To conform to the Equatable protocol, a type must allow the underlying values to be compared for equality.
 */
func doubleFunc2(value: Int) -> some Equatable {
    value * 2
}

// Given that both the Int and String concrete types are in conformance with the Equatable protocol, it
// is possible to also create a function that returns a String result.
func doubleFunc3(value: String) -> some Equatable {
    value + value
}
