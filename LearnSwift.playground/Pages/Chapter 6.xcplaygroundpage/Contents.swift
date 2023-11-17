var x: Int?
var y = 10

x = 10
// Assign the result of x + y to x
x = x! + y
x = y

var a: Int
var b: Int

a = 5
b = 8

//a = a + b
a += b
a -= b

// Closed range operator
let d = 5
let g = 8
d...g

// Half open range operation
// it encompasses all numbers 5 and up but not 8, so 5, 6, 7
d..<g

// One sided operator
d...
...g
print (d...)

// Ternary operator
let h = 10
let i = 20

print("Largest number is \(h > i ? h : i)")

// nil coalescing operator
// allows a default value to be used in the event that an optional has a nil value
let customerName: String? = nil
//let customerName = "Megan Thee Stallion"
print("Welcome back, \(customerName ?? "customer")")
