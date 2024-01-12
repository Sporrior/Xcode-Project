import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            // Add settings sections here
            Section(header: Text("Notificaties")) {
                Toggle("Zet notificaties aan", isOn: .constant(true))
            }
            Section(header: Text("Data Management")) {
                Button("Export Data") {}
                Button("Clear Data") {}
            }
            Section(header: Text("Uiterlijk")) {
                Toggle("Dark Mode", isOn: .constant(true))
            }
        }
        .navigationTitle("Settings")
    }
}
