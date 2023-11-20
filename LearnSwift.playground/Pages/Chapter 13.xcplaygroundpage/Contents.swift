import Foundation

/* Property Wrappers

 When values are assigned or access via a property within a class or structure
 instance it is sometimes necessary to perform some form of transformation or
 validation on that value before it is stored or read.

 Property wrappers allow the capabilities of computed properties to be
 separated from individual classes and structures and reused throughout the
 app code base.
 */

struct Address {
    private var cityname: String = ""

    var city: String {
        get { cityname }
        set { cityname = newValue.uppercased() }
    }
}

var address = Address()
address.city = "London"
print(address.city)

/* Property wrappers are declared using the @propertyWrapper directive and are implemented in
a class or structure. Although structures are the preferred choice.

 All property wrappers must include a wrappedValue property containing the getter and setter
 code that changes or validates the validate.

 An optional initializer may also be included which is passed the value being assigned.
 */
@propertyWrapper
struct FixCase {
    private (set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased()}
    }

    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
}

var contact = Contact(name: "Beyonce Knowles", city: "Houston", country: "United States")
print("\(contact.name), \(contact.city), \(contact.country)")

@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    let max: V
    let min: V

    init(wrappedValue: V, min: V, max: V) {
        value = wrappedValue
        self.min = min
        self.max = max
    }

    var wrappedValue: V {
        get { return value }

        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

struct Demo {
    @MinMaxVal(min: "Apple", max: "Orange") var value: String = ""
}

var demo = Demo()
demo.value = "Banana"
print(demo.value)

demo.value = "Pear"
print(demo.value)

struct DateDemo {
    @MinMaxVal(min: Date(), max: Calendar.current.date(byAdding: .month, value: 1, to: Date())! ) var value: Date = Date()
}

var dateDemo = DateDemo()

print(dateDemo.value)

dateDemo.value = Calendar.current.date(byAdding: .day, value: 10, to: Date())!
print(dateDemo.value)

dateDemo.value = Calendar.current.date(byAdding: .month, value: 2, to: Date())!
print(dateDemo.value)
