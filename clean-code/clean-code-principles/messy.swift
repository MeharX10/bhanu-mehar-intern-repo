import Foundation

func calc(a: String?, b: String?, t: String) -> Int {
    var r = 0

    if t == "add" {
        r = Int(a!)! + Int(b!)!
    } else if t == "sub" {
        r = Int(a!)! - Int(b!)!
    } else if t == "mul" {
        r = Int(a!)! * Int(b!)!
    } else {
        r = 0
    }

    return r
}

// Example usage
let x = calc(a: "10", b: "5", t: "add")
print(x)
