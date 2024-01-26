import SwiftUI

struct DashboardView: View {
    @ObservedObject var incomeViewModel: IncomeViewModel
    @ObservedObject var billViewModel: BillViewModel
    @Binding var userName: String

    private var totalIncome: Double {
        incomeViewModel.incomes.reduce(0) { $0 + $1.amount }
    }

    private var totalBills: Double {
        billViewModel.bills.reduce(0) { $0 + $1.amount }
    }

    private var netBalance: Double {
        totalIncome - totalBills
    }

    private var balanceColor: Color {
        netBalance >= 0 ? .green : .red
    }

    private var personalizedGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        let partOfDay = hour < 12 ? "Morgen" : hour < 18 ? "Middag" : "Avond"
        let greetingName = userName.isEmpty ? "" : ", \(userName)"
        return "Goede \(partOfDay)\(greetingName)"
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(personalizedGreeting)
                            .font(.largeTitle)
                            .padding()

                        // Adaptive Financial Summary
                        if geometry.size.width > 600 { // Threshold for layout change
                            // Use 2x2 Grid Layout
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                SummaryCard(title: "Totaal Inkomen", value: totalIncome, color: .green, iconName: "arrow.up.circle")
                                SummaryCard(title: "Totaal Rekeningen", value: totalBills, color: .red, iconName: "arrow.down.circle")
                                SummaryCard(title: "Netto Saldo", value: netBalance, color: balanceColor, iconName: "wallet.pass")
                            }
                            .padding()
                        } else {
                            VStack {
                                SummaryCard(title: "Totaal Inkomen", value: totalIncome, color: .green, iconName: "arrow.up.circle")
                                SummaryCard(title: "Totaal Rekeningen", value: totalBills, color: .red, iconName: "arrow.down.circle")
                                SummaryCard(title: "Netto Saldo", value: netBalance, color: balanceColor, iconName: "wallet.pass")
                            }
                            .padding()
                        }

                        Group {
                            HStack {
                                Spacer()
                                SegmentedCircleGraph(income: CGFloat(totalIncome), bills: CGFloat(totalBills))
                                    .frame(width: 200, height: 200)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

// SummaryCard View
struct SummaryCard: View {
    var title: String
    var value: Double
    var color: Color
    var iconName: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(color)
                Text(title)
                    .font(.headline)
            }
            Text("\(value, specifier: "%.2f") EUR")
                .font(.title)
                .foregroundColor(color)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
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
