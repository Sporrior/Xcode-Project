import SwiftUI

struct MainTabView: View {
    @StateObject private var incomeViewModel = IncomeViewModel()
    @StateObject private var billViewModel = BillViewModel()
    @State private var showingAddIncomeView = false
    @State private var showingAddBillView = false
    @State private var userName: String = "Damien"
    @State private var selectedTab = "Dashboard" // State variable for the selected tab

    var body: some View {
        TabView(selection: $selectedTab) {
            // Account Tab
            UserAccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
                .tag("Account")

            // Income Tab
            NavigationView {
                IncomeListView(viewModel: incomeViewModel)
                    .navigationBarItems(trailing: Button(action: {
                        showingAddIncomeView = true
                    }) {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showingAddIncomeView) {
                        AddIncomeView(isPresented: $showingAddIncomeView, viewModel: incomeViewModel)
                    }
            }
            .tabItem {
                Label("Inkomen", systemImage: "plus.rectangle")
            }
            .tag("Inkomen")

            // Dashboard Tab
            DashboardView.create(incomeViewModel: incomeViewModel, billViewModel: billViewModel, userName: $userName)
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }
                .tag("Dashboard")

            // Bills Tab
            NavigationView {
                BillsListView(viewModel: billViewModel)
                    .navigationBarItems(trailing: Button(action: {
                        showingAddBillView = true
                    }) {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showingAddBillView) {
                        AddBillView(isPresented: $showingAddBillView, viewModel: billViewModel)
                    }
            }
            .tabItem {
                Label("Rekeningen", systemImage: "doc.text")
            }
            .tag("Rekeningen")

            // Settings Tab
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag("Settings")
        }
        // Set the default tab to open as Dashboard
        .onAppear {
            self.selectedTab = "Dashboard"
        }
    }
}
