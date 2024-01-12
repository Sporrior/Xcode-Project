import SwiftUI

struct MainTabView: View {
    // Create instances of the ViewModels
    @StateObject private var incomeViewModel = IncomeViewModel()
    @StateObject private var billViewModel = BillViewModel()

    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }

            IncomeListView(viewModel: incomeViewModel)
                .tabItem {
                    Label("Incomes", systemImage: "plus.rectangle")
                }

            BillsListView(viewModel: billViewModel)
                .tabItem {
                    Label("Bills", systemImage: "doc.text")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
