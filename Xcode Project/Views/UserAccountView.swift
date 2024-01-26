import SwiftUI

struct UserAccountView: View {
    @Binding var userName: String
    @State private var userEmail: String = UserDefaultsManager.shared.getUserEmail()

    var body: some View {
        Form {
            Section(header: Text("Account informatie")) {
                TextField("Naam", text: $userName)
                    .onSubmit {
                        UserDefaultsManager.shared.saveUserName(userName)
                    }
                TextField("Email", text: $userEmail)
                    .onSubmit {
                        UserDefaultsManager.shared.saveUserEmail(userEmail)
                    }
            }
        }
        .navigationTitle("Account")
        .onAppear {
            userName = UserDefaultsManager.shared.getUserName()
            userEmail = UserDefaultsManager.shared.getUserEmail()
        }
    }
}
