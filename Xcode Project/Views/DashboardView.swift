import SwiftUI

struct DashboardView: View {
    @ObservedObject var incomeViewModel: IncomeViewModel
    @ObservedObject var billViewModel: BillViewModel
    @Binding var userName: String // Corrected to Binding

    private var personalizedGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        let partOfDay = hour < 12 ? "Morgen" : hour < 18 ? "Middag" : "Avond"
        let greetingName = userName.isEmpty ? "" : ", \(userName)"
        return "Goede \(partOfDay)\(greetingName)"
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {

                    Text(personalizedGreeting)
                        .font(.largeTitle)
                        .padding()

                    Group {
                        Text("Recente Inkomsten")
                            .font(.headline)
                            .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(incomeViewModel.incomes.prefix(8)) { income in
                                    IncomeCard(income: income)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    Group {
                        Text("Aankomende Rekeningen")
                            .font(.headline)
                            .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(billViewModel.bills.prefix(8)) { bill in
                                    BillCard(bill: bill)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("")
        }
    }
}


struct IncomeCard: View {
    var income: Income
    
    var body: some View {
        VStack {
            Text(income.source)
                .font(.headline)
            Text("\(income.amount, format: .currency(code: "EUR"))")
                .font(.subheadline)
            Text("Ontvangen op \(income.date.formatted(date: .abbreviated, time: .omitted))")
                .font(.caption)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

struct BillCard: View {
    var bill: Bill
    
    var body: some View {
        VStack {
            Text(bill.category)
                .font(.headline)
            Text("\(bill.amount, format: .currency(code: "EUR"))")
                .font(.subheadline)
            Text("Verekend \(bill.dueDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.caption)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .background(Color.red.opacity(0.1))
        .cornerRadius(10)
    }
}

extension DashboardView {
    static func create(incomeViewModel: IncomeViewModel, billViewModel: BillViewModel, userName: Binding<String>) -> some View {
        DashboardView(incomeViewModel: incomeViewModel, billViewModel: billViewModel, userName: userName)
    }
}
