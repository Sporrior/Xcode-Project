import SwiftUI

struct MainTabView: View {
    @StateObject private var incomeViewModel = IncomeViewModel()
    @StateObject private var billViewModel = BillViewModel()
    @State private var showingAddIncomeView = false
    @State private var showingAddBillView = false

    var body: some View {
        TabView {
            DashboardView(incomeViewModel: incomeViewModel, billViewModel: billViewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                }

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
                Label("Incomes", systemImage: "plus.rectangle")
            }

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
                Label("Bills", systemImage: "doc.text")
            }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
