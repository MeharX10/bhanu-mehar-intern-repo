import Foundation

// Define a custom error type for invalid conversion
enum ConversionError: Error {
    case invalidNumber
}

// Updated function with proper error handling
func safeConvertToInt(_ text: String) throws -> Int {
    // Guard clause checks input immediately and exits cleanly on failure
    guard let number = Int(text) else {
        throw ConversionError.invalidNumber
    }
    return number
}

// Example usage with do-catch
do {
    print(try safeConvertToInt("123"))
    print(try safeConvertToInt("abc"))
} catch {
    print("Could not convert the input. Reason: \(error)")
}

