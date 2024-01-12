import SwiftUI

struct IncomeListView: View {
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        List {
            ForEach(viewModel.incomes) { income in
                VStack(alignment: .leading) {
                    Text(income.source)
                        .font(.headline)
                    Text("Amount: \(income.amount, format: .currency(code: "EUR"))")
                    Text("Date: \(income.date, style: .date)")
                }
            }
            .onDelete(perform: viewModel.deleteIncome)
        }
        .navigationTitle("Income")
        .onAppear {
            viewModel.loadIncomes()
        }
    }
}
