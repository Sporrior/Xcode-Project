import SwiftUI

struct DashboardView: View {
    @ObservedObject var incomeViewModel: IncomeViewModel
    @ObservedObject var billViewModel: BillViewModel

    var body: some View {
        NavigationView {
            VStack {
                // Recent Incomes Summary
                Text("Recente Inkomsten")
                List(incomeViewModel.incomes.prefix(5)) { income in
                    Text("\(income.source): \(income.amount, format: .currency(code: "EUR"))")
                }

                // Upcoming Bills Summary
                Text("Aankomende Rekeningen")
                List(billViewModel.bills.prefix(5)) { bill in
                    Text("\(bill.category): \(bill.amount, format: .currency(code: "EUR"))")
                }

                // Quick Actions can be added here
            }
            .navigationTitle("Dashboard")
        }
    }
}
