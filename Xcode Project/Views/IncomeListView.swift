import SwiftUI

struct IncomeListView: View {
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        List {
            ForEach(viewModel.incomes) { income in
                VStack(alignment: .leading) {
                    Text(income.source)
                        .font(.headline)
                    Text("+ \(income.amount, format: .currency(code: "EUR"))")
                    Text("Datum: \(income.date, style: .date)")
                }
            }
            .onDelete(perform: viewModel.deleteIncome)
        }
        .navigationTitle("")
        .onAppear {
            viewModel.loadIncomes()
        }
    }
}
