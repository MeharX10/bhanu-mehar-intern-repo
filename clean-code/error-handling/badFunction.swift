import Foundation

// This function tries to convert a string to an Int.
// It has NO error handling, NO guard clause, and crashes on invalid input.
func convertToInt(_ text: String) -> Int {
    // Forced unwrap will cause a runtime crash if conversion fails
    let number = Int(text)!
    return number
}

// Testing the function with an invalid input
print(convertToInt("123"))
print(convertToInt("abc"))   // This will crash the program

