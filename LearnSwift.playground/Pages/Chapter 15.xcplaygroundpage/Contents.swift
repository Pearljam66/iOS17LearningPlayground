// Swift Error Handling

/*
 Two sides to error handling in Swift:
 - The first involves triggering (or throwing) an error when the desired results are not achieved
   within the method of the app.
 - The second involves catching and handling the error after it is throw by a method.
 */

// Declaring Error Types
let connectionOK = true
let connectionSpeed = 30.0
let fileFound = false

enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

func fileTransfer() throws {
    guard connectionOK else {
        throw FileTransferError.noConnection
    }

    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }

    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}

func sendFile() -> String {
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return("No network connection")
    } catch FileTransferError.lowBandwidth {
        return("File Transfer Speed too Low")
    } catch FileTransferError.fileNotFound {
        return("File not Found")
    } catch {
        // Do-catch statements must be exhaustive(constructed so as to catch all possible error conditions).
        return("Unknown Error")
    }

    return("Successful transfer")
}

print(sendFile())

// Swift also allows multiple matches to be declared within a single catch statement, with the list of matches separated by commas.
func sendFileTwo() -> String {
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection, FileTransferError.lowBandwidth {
        return("Yo! There is a connection problem.")
    } catch FileTransferError.fileNotFound {
        return("The file is not found.")
    } catch {
        return("The error is unknown")
    }

    return("Great Success of the Transfer!")
}

print(sendFileTwo())

// Disabling Error Catching
/*
A throwing method may be forced to run without the need to enclose the call within a do-catch statement by
 using the try! statement like below.

 When we are using this approach we are informing the compiler that we know with absolute certainty that the method
 call will not result in an error being thrown.

 In the event that an error is thrown when using this technique, the code will fail with a runtime error. This approach should be used sparingly.
 */

try! fileTransfer

// Using the defer statement

// The defer statement allows a sequence of code statements to be declared as needing to be run as soon as the method returns.

func removeTempFiles() {
    print("Temp files have been removed.")
}

func closeConnection() {
    print("Connection has been closed.")
}

func sendFileThree() -> String {

    defer {
        // Perform these tasks before the control is returned,
        // regardless of the type of error that is returned.
        removeTempFiles()
        closeConnection()
    }

    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return("No network connection")
    } catch FileTransferError.lowBandwidth {
        return("File Transfer Speed too Low")
    } catch FileTransferError.fileNotFound {
        return("File not Found")
    } catch {
        // Do-catch statements must be exhaustive(constructed so as to catch all possible error conditions).
        return("Unknown Error")
    }

    return("Successful transfer")
}

print(sendFileThree())
