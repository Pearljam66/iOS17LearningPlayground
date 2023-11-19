// An Overview of Swift Structures

/*
 Structure declarations resemble classes with the exception that the struct keyword is used
 in place of the class keyword.

 Like Classes, Structures can:
 - Be extended.
 - Adopt protocols.
 - Contain initializers.
 */

/* Unlike Class, Structures DO NOT:
 - Have inheritance, which enables one class to inherit the characteristics of another.
- Have type casting, which enables you to check and interpret the type of a class instance at runtime.
 - Have de-initializers, which enable an instance of a class to free up any resources is has assigned.
 - Have reference counting, which allows more than one reference to a class instance.
 */

/*
 - Structure -
 Structure is a value type

 When a structure instance is copied or passed to a method, an actual copy of the instance
 is created, together with any data contained in the instance.

 This means that the copy has its own version of the data which is unconnected with the original
 structure instance. So there can be multiple copies of a structure instance within a running app,
 each with its own local copy of the associated data.
 */

/*
 - Class -
 Class is a reference type
 When a class instance is copied or passed as an argument, the only thing duplicated or passed is a reference
 to the location in memory where the class resides.
 Any changes made to the instance using those references will be performed on the same instance.
 */

struct SampleStruct {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildHelloMsg() {
        "Hello " + name
    }
}

// The equivalent class declaration:
class SampleClass {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildHelloMsg() {
        "Hello " + name
    }
}

let myStruct1 = SampleStruct(name: "Mark")
print(myStruct1.name)

var myStruct2 = myStruct1
myStruct2.name = "David"
print(myStruct1.name)
print(myStruct2.name)

let myClass1 = SampleClass(name: "Mark")
print(myClass1.name)
var myClass2 = myClass1
print(myClass1.name)
myClass2.name = "David"

print(myClass1.name)
print(myClass2.name)

// When to Use Structures and Classes

/* Structures are recommended whenever possible because they are both more efficient than classes
and safer to use in multi-threaded code.

 Classes should be used when:
 - Inheritance is needed.
 - When only one instance of the encapsulated data is required.
 - Extra steps need to be taken to free up resources when an instance
   is de-initialized.
 */

// Enumerations
/*
 Used to create custom data types consisting of pre-defined sets of values.

 They are typically used for making decisions within code such as when using
 switch statements.
 */
enum HairColor {
    case red
    case blue
    case purple
}

// Since an emum has a definitive set of valid member values, the switch statement doesn't need to include a default case.
// An attempt to pass an invalid enum case through the switch will be caught by the compiler long before it has a chance
// to cause a runtime error.
func displayColorInfo(hairColor: HairColor) {
    switch hairColor {
        case .red:
            print("It is red.")
        case .blue:
            print("It is blue.")
        case .purple:
            print("It is purple.")
    }
}

displayColorInfo(hairColor: HairColor.blue)
