import SwiftUI

struct IncomeListView: View {
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        List(viewModel.incomes) { income in
            VStack(alignment: .leading) {
                Text(income.source)
                    .font(.headline)
                Text("Amount: \(income.amount, format: .currency(code: "USD"))")
                Text("Date: \(income.date.formatted(date: .abbreviated, time: .omitted))")
            }
        }
        .navigationTitle("Incomes")
        .onAppear {
            viewModel.loadIncomes()
        }
    }
}
