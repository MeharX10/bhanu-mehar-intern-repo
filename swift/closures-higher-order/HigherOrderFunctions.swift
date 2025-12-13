// HigherOrderFunctions.swift
// Task 6.5 – Closures & Higher Order Functions

import Foundation

// Sample data
let numbers = [1, 2, 3, 4, 5, 6]

// MARK: - map
// Multiply each number by 2
let doubledNumbers = numbers.map { number in
    number * 2
}

print("Map result (doubled numbers):")
print(doubledNumbers)

// MARK: - filter
// Keep only even numbers
let evenNumbers = numbers.filter { number in
    number % 2 == 0
}

print("\nFilter result (even numbers):")
print(evenNumbers)

// MARK: - reduce
// Sum all numbers
let totalSum = numbers.reduce(0) { partialResult, number in
    partialResult + number
}

print("\nReduce result (sum of numbers):")
print(totalSum)

