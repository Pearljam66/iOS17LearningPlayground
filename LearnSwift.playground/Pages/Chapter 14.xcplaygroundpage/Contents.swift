// Swift Array Initialization

var priceArray = [Float]()
print(priceArray)

var nameArray = [String] (repeating: "My String", count: 10)
print(nameArray)

let firstArray = ["Red", "Green", "Blue"]
let secondArray = ["Indigo", "Violet"]

let thirdArray = firstArray + secondArray
print(thirdArray)

// Array item count
var treeArray = ["Pine", "Oak", "Yew"]
var itemCount = treeArray.count
print(itemCount)

if !treeArray.isEmpty {
    print("treeArray is not empty")
}

// Accessing Array Items
print(treeArray)
treeArray[1] = "Redwood"
print(treeArray)

// Random Items and Shuffling
let shuffledTrees = treeArray.shuffled()
print(shuffledTrees)
let randomTree = treeArray.randomElement()
print(randomTree)

// Appending items to an array
treeArray.append("Redwood")
print(treeArray)
treeArray += ["Redwood"]
print(treeArray)
treeArray += ["Redwood", "Maple", "Birch"]
print(treeArray)

// Inserting and Deleting Array Items
treeArray.insert("Maple", at: 0)
print(treeArray)
treeArray.remove(at: 2)
print(treeArray)
treeArray.removeLast()
print(treeArray)

// Array Iteration
for tree in treeArray {
    print(tree)
}

treeArray.forEach { tree in
    print(tree)
}

treeArray.forEach {
    print($0)
}

// Swift Dictionary Initialization

var bookDictOne = ["100-432112" : "Wind in the Willows",
                "200-532874" : "Tale of Two Cities",
                "202-546549" : "Sense and Sensibility",
                "104-109984" : "Shutter Island"]

print(bookDictOne)

var bookDictTwo : [String:String] =
            ["100-432112" : "Wind in the Willows",
             "200-532874" : "Tale of Two Cities",
             "202-546549" : "Sense and Sensibility",
             "104-109934" : "Shutter Island"]

print(bookDictTwo)

// Sequence-based Dictionary Initialization
let keys = ["100-432112", "200-532874", "202-546549", "104-109834"]
let values = ["Wind in the Willows", "Tale of Two Cities", "Sense and Sensibility", "Shutter Island"]
var bookDictThree = Dictionary(uniqueKeysWithValues: zip(keys, values))
print(bookDictThree)

var bookDictFour = Dictionary(uniqueKeysWithValues: zip(1..., values))
/*
 This is the equivalent to (but a much cleaner version):
 var bookDict = [1 : "Wind in the Willows",
                 2 : "Tale of Two Cities",
                3: "Sense and Sensibility",
                4: "Shutter Island"
 */

print(bookDictThree.count)
print(bookDictThree["200-532874"])
print(bookDictThree["999-546547", default: "Book not found!"])
bookDictThree["200-532874"] = "Sense and Sensibility"
print(bookDictThree)
bookDictThree.updateValue("The Ruins", forKey: "200-532874")
print(bookDictThree)

bookDictThree["202-546549"] = nil
print(bookDictThree)
bookDictThree.removeValue(forKey: "100-432112")
print(bookDictThree)

// Dictionary Iteration
for (bookID, title) in bookDictOne {
    print("Book ID: \(bookID) Title: \(title)")
}
