// The Swift Swift Statement

// Expression represents either a value or an expression that returns a value
// Each potential match must be of the same type of the governing expression.
/*switch expression {
    case match1:
        statements
    case match2:
        statements
    case match3, match4:
        statements
    // Defines what should happen if none of the case statements present a match to the expression.
    default:
        statements
}*/

let value = 4

switch (value) {
    case 0:
        print("zero")
    case 1:
        print("one")
    case 2:
        print("two")
    case 3:
        print("three")
    case 4:
        print("four")
    case 5:
        print("five")
    default:
        print("Integer out of range")
}

// Range matching in a swift statement

let temperature = 85

switch(temperature) {
    case 0...49:
        print("Damn, it's cold outside.")
    case 50...79:
        print("The perfect warm temperature.")
    case 80...110:
        print("It's too hot out.")
    default:
        print("The temperature is out of range")
}

// Using the where statement

let outsideTemperature = 45

switch(outsideTemperature) {
    case 0...49 where outsideTemperature % 2 == 0:
        print("It's cold outside and an even temperature.")
    case 50...79 where outsideTemperature % 2 == 0:
        print("It's warm outside and an even temperature.")
    case 79...110 where outsideTemperature % 2 == 0:
        print("It's hot outside and an even temperature.")
    default:
        print("Temperature is out of range or odd")
}

// Fallthrough
// Unlike other languages, Swift automatically breaks out of the switch statement when a matching case is met.
// The fallthrough effect of other switch implementations (whereby the execution path continues through the remaining case statements) can be emulated using the fallthrough statement.

let currentTemperature = 84

switch(currentTemperature) {
    case 0...49 where currentTemperature % 2 == 0:
        print("cold and even")
        fallthrough
    case 50...79 where currentTemperature % 2 == 0:
        print("warm and even")
        fallthrough
    case 80...110 where currentTemperature % 2 == 0:
        print("hot and even")
        fallthrough
    default:
        print("temperature is out of range or odd")
}

let cTemperature = 84

switch(cTemperature) {
    case 0...49 where cTemperature % 2 == 0:
        print("cold and even")
        fallthrough
    case 50...79 where cTemperature % 2 == 0:
        print("warm and even")
        fallthrough
    case 80...110 where cTemperature % 2 == 0:
        print("ctemp is hot and even")
        fallthrough
    default:
        // Useful if no action needs to be taken in the default case.
        break
}
