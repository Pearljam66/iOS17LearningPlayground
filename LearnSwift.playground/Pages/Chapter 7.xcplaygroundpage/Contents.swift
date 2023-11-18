for index in 1...5 {
    print("Value of index is \(index)")
}

var i = 10

repeat {
    i -= 1
    print(i)
} while (i > 0)

var j = 10

for _ in 0 ..< 100 {
    j += j
    if j > 100 {
        // breaks out of the current loop and resumes execution at the code directly after the loop
        break
    }

    print("j = \(j)")
}

var k = 1

while k < 20 {
    k += 1

    if (k % 2) != 0 {
        continue
    }

    print ("i = \(k)")
}

func multiplyByTen(value: Int?) {
    guard let number = value, number < 10 else {
        print("Number is too high.")
        return
    }

    let result = number * 10
    print(result)
}

multiplyByTen(value: 5)
multiplyByTen(value: 10)
