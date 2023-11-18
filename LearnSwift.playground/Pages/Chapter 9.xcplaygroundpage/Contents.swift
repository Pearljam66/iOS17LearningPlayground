// A method is essentially a function that is associated with a particular class, structure, or enumeration.
// parameters - values that a function is able to accept
// arguments - at the point that is that the function is actually called and passed those values

func buildMessageFor(name: String, count: Int) -> String {
    // The return statement can be omitted if the function contains a single expression.
    ("\(name), you are customer number \(count)")
}

buildMessageFor(name: "Sarah", count: 984)

// When the result being returned by a method or function is not used, the value may be discarded by using '_'.
// For example:

_ = buildMessageFor(name: "Beyonce", count: 67)
print(buildMessageFor(name: "Beyonce", count: 67))

// The default external parameter names assigned to parameters may be removed by preceding the local parameter names with the
// underscore character.

func buildCustomMessageFor(_ name: String, _ count: Int) -> String {
    return("\(name), you are customer number \(count)")
}

let customerMessage = buildCustomMessageFor("Timmy", 23)
print(customerMessage)

// External parameter names can also be added by declaring the external parameter name before the local parameter name.

func buildSpecialMessageFor(username name: String, usercount count: Int) -> String {
    return("\(name), you are special customer number \(count)")
}

let specialMessage = buildSpecialMessageFor(username: "Rachel", usercount: 34)
print(specialMessage)

// Swift provides the ability to designate a default parameter value to be use in the even that the value
// is not provided as an argument when the function is called.
func buildYetAnotherMessageFor(_ name: String = "Customer", count: Int) -> String {
    return ("\(name), you are customer number \(count)")
}

// The function can now be called without passing through a name argument:
let messageTwo = buildYetAnotherMessageFor(count: 100)
print(messageTwo)

// Returning multiple results from a function
// A function can return multiple result values by wrapping those results in a tuple.
func sizeConverter(_ length: Float) -> (yards: Float, centimeters: Float, meters: Float) {
    let yards = length * 0.0277778
    let centimeters = length * 2.54
    let meters = length * 0.0254

    return (yards, centimeters, meters)
}

let lengthTuple = sizeConverter(20)
print(lengthTuple.yards)
print(lengthTuple.centimeters)
print(lengthTuple.meters)

// Variable numbers of function parameters
// variadic parameters are used when the number of parameters a function will need to accept
// is NOT known in advance.
func displayStrings(_ strings: String...) {
    for string in strings {
        print(string)
    }
}

displayStrings("one", "two", "three", "four")

// Parameters as Variables
// All parameters accepted by a function are treated as constants by default.
// This prevents changes being made to those parameter values within the function code.
// If changes to parameters need to made within the function body you need to created shadow copies of those parameters.
func calculateArea(length: Float, width: Float) -> Float {
    var length = length
    var width = width

    length = length * 2.54
    width = width * 2.54
    return length * width
}

print(calculateArea(length: 56.5, width: 20.0))

// Working with In-Out Parameters
var myValue = 10

func doubleValue(_ value: Int) -> Int {
    var value = value
    value += value
    return (value)
}

print("Before function call myValue = \(myValue)")
print("doubleValue call returns \(doubleValue(myValue))")
print("After function call returns \(myValue)")

var myValue2 = 20
// The correct way to keep the new value you created around:
func doubleValueV2(_ value: inout Int) -> Int {
    value += value
    return value
}

print("Before function call myValue = \(myValue2)")
print("doubleValueV2 call returned \(doubleValueV2(&myValue2))")
print("After function call returns \(myValue2)")


// Functions as parameters:
func inchesToFeet(_ inches: Float) -> Float {
    return inches * 0.0833333
}

func inchesToYards(_ inches: Float) -> Float {
    return inches * 0.0277778
}

let toFeet = inchesToFeet
let toYards = inchesToYards

func outputConversion(_ converterFunc: (Float) -> Float, value: Float) {
    let result = converterFunc(value)
    print("Result of the conversion is \(result)")
}

print(toYards(10))
print(toFeet(20))

//outputConversion(toYards, value: 21)
outputConversion(toFeet, value: 3)

// Functions can also be returned as a data type simply by declaring the type of function as the return type.
func decideFunction(_ feet: Bool) -> (Float) -> Float
{
    if feet {
        return toFeet
    } else {
        return toYards
    }
}

// Call decideFunction to get the appropriate conversion function.
let useFeet = true
let conversionFunction = decideFunction(useFeet)

// Use the returned closure to perform the conversion.
let inputValue: Float = 10.0
let result = conversionFunction(inputValue)

print("Result: \(result)")

// Closure expressions - self contained blocks of code.

// The following code declares a closure expression and assigns it to a constant named sayHello and then
// calls the function via the constant reference.
let sayHello = { print ("Hello") }
sayHello()

// Closure expressions may also be configured to accept parameters and return results.
// The following closure expression, for example, accepts two integer parameters and returns an integer result.
// Closure expression does not have a name.
// The parameter and return type are included in the braces.
// The in keyword is used to indicate the start of the closure expression code.
// Functions are just closure expressions.
let multiply = { (_ val1: Int, _ val2) -> Int in
    return val1 * val2
}

let multiplyResult = multiply(10, 20)
print(multiplyResult)

// Before the introduction of structured concurrency in Swift 5.5, closure expressions were often used when declaring completion handlers
// for asynchronous method calls.

// Shorthand Argument Names
// Without shorthand:
let join = { (string1: String, string2: String) -> String in
    string1 + string2
}

// Can also be written using shorthand:
let joinTwo: (String, String) -> String = {
    $0 + $1
}

// Closures in Swift

// A closure in computer science terminology generally refers to the combination of a self-contained block of code
// (for example a function or a closure expression) and one or more variables that exist in the context surrounding
// the code block.

func functionA() -> () -> Int {
    var counter = 0

    func functionB() -> Int {
        return counter + 10
    }
    return functionB
}

let myClosure = functionA()
let resultTwo = myClosure()
