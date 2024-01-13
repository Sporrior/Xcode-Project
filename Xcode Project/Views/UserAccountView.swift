import SwiftUI

struct UserAccountView: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""

    var body: some View {
        Form {
            Section(header: Text("Account informatie")) {
                TextField("Naam", text: $userName)
                TextField("Email", text: $userEmail)
                // Add more fields as necessary
            }
            // Add more sections for additional settings or account management features
        }
        .navigationTitle("Account")
    }
}
