import Foundation

// MARK: - Custom Error Definition
enum LoginError: Error {
    case emptyUsername
    case emptyPassword
    case invalidCredentials
}

// MARK: - Function that throws errors
func login(username: String?, password: String?) throws -> String {
    
    // Guard clauses for validation
    guard let username = username, !username.isEmpty else {
        throw LoginError.emptyUsername
    }
    
    guard let password = password, !password.isEmpty else {
        throw LoginError.emptyPassword
    }
    
    // Simulated credential check
    if username != "focusbear" || password != "internbhanumacdev" {
        throw LoginError.invalidCredentials
    }
    
    return "Login successful. Welcome, \(username)."
}

// MARK: - try / catch usage
func performLogin(username: String?, password: String?) {
    do {
        let result = try login(username: username, password: password)
        print(result)
    } catch LoginError.emptyUsername {
        print("Error: Username cannot be empty.")
    } catch LoginError.emptyPassword {
        print("Error: Password cannot be empty.")
    } catch LoginError.invalidCredentials {
        print("Error: Invalid username or password.")
    } catch {
        print("Unexpected error: \(error)")
    }
}

// MARK: - Test cases
print("Test Case 1:")
performLogin(username: nil, password: "123")

print("\nTest Case 2:")
performLogin(username: "focusbear", password: nil)

print("\nTest Case 3:")
performLogin(username: "wrong", password: "wrong")

print("\nTest Case 4:")
performLogin(username: "focusbear", password: "internbhanumacdev")

