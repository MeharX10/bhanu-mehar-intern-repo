import Foundation

/// Supported math operations
enum Operation {
    case add
    case subtract
    case multiply
}

/// Errors that can occur during calculation
enum CalculationError: Error {
    case invalidNumber
    case missingInput
}

/// Safely converts a string to an integer
func convertToInt(_ value: String?) throws -> Int {
    guard let value = value else {
        throw CalculationError.missingInput
    }

    guard let number = Int(value) else {
        throw CalculationError.invalidNumber
    }

    return number
}

/// Performs a calculation using clean code principles
func calculate(
    firstValue: String?,
    secondValue: String?,
    operation: Operation
) throws -> Int {

    let firstNumber = try convertToInt(firstValue)
    let secondNumber = try convertToInt(secondValue)

    switch operation {
    case .add:
        return firstNumber + secondNumber
    case .subtract:
        return firstNumber - secondNumber
    case .multiply:
        return firstNumber * secondNumber
    }
}

// Example usage
do {
    let result = try calculate(
        firstValue: "10",
        secondValue: "5",
        operation: .add
    )
    print("Result:", result)
} catch {
    print("Calculation failed:", error)
}
