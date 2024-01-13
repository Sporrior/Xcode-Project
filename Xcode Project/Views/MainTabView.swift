import SwiftUI

struct MainTabView: View {
    @StateObject private var incomeViewModel = IncomeViewModel()
    @StateObject private var billViewModel = BillViewModel()
    @State private var showingAddIncomeView = false
    @State private var showingAddBillView = false
    @State private var userName: String = "Damien"


    var body: some View {
        TabView {
            DashboardView.create(incomeViewModel: incomeViewModel, billViewModel: billViewModel, userName: $userName)
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
                Label("Inkomen", systemImage: "plus.rectangle")
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
                Label("Rekeningen", systemImage: "doc.text")
            }
            
            UserAccountView()
                   .tabItem {
                       Label("Account", systemImage: "person.crop.circle")
                   }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
