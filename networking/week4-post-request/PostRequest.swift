import Foundation

// Simple model for the JSON body
struct FocusBearPayload: Codable {
    let title: String
    let description: String
    let completed: Bool
}

// Endpoint for testing POST requests
// jsonplaceholder.typicode.com is a free fake API for testing
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

let payload = FocusBearPayload(
    title: "Focus Bear onboarding",
    description: "Test POST request from Swift script",
    completed: false
)

// Encode body as JSON
do {
    let jsonData = try JSONEncoder().encode(payload)
    request.httpBody = jsonData
} catch {
    print("Failed to encode JSON body:", error)
    exit(1)
}

// Use semaphore so the script waits for async call to finish
let semaphore = DispatchSemaphore(value: 0)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Request error:", error)
    } else if let httpResponse = response as? HTTPURLResponse {
        print("Status code:", httpResponse.statusCode)
        if let data = data,
           let bodyString = String(data: data, encoding: .utf8) {
            print("Response body:")
            print(bodyString)
        }
    } else {
        print("No valid HTTP response received")
    }

    semaphore.signal()
}

task.resume()
semaphore.wait()

