// Swift Inheritance Example

class BankAccount {
    var accountBalance: Float
    var accountNumber: Int

    init(number: Int, balance: Float) {
        self.accountBalance = balance
        self.accountNumber = number
    }

    func displayBalance() {
        print("Number: \(accountNumber)")
        print("Current balance is\(accountBalance)")
    }
}


// Overriding inherited methods
/*
 There are two rules when overriding a method:
 - The subclass must take exactly the same number and type of parameters as the overridden
 method in the parent class.
 - The new method must have same return type as the parent method.
 */
class SavingsAccount: BankAccount {
    var interestRate:  Float

    init(number: Int, balance: Float, rate: Float) {
        interestRate = rate
        super.init(number: number, balance: balance)
    }

    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }

    override func displayBalance() {
        super.displayBalance()
        print("Prevailing interest is \(interestRate)")
    }
}

let savings1 = SavingsAccount(number: 12345, balance: 600.00, rate: 0.07)
print(savings1.calculateInterest())
savings1.displayBalance()

// Swift class extensions
/* Extensions can be used to add features such as methods, initializers, computed properties and subscripts
 to an existing class without the need to create and reference a subclass.
This is particularly powerful when using extensions to add function to the built-in class of the Swift language
 and iOS SDK frameworks.
 */
extension Double {
    var squared: Double {
        return self * self
    }

    var cubed: Double {
        return self * self * self
    }
}

// Having extended the Double class with two new computed properties we can now make use of the
// properties as we would any other properties of the Double class.
let myValue: Double = 3.0
print(myValue.squared)

// Because these properties were added as an extension, rather than using a subclass,
// we can now access these properties directly on Double values.
print(3.0.squared)
print(6.0.cubed)

/* Extension drawbacks:
- You can't override the existing functionality of a class in an extension like you can with a subclass.
- Extensions cannot contain stored properties.
 */
