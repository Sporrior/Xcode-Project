import SwiftUI

struct AddIncomeView: View {
    @State private var amount: Double = 0.0
    @State private var source: String = ""
    @State private var date: Date = Date()
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        Form {
            TextField("Amount", value: $amount, format: .currency(code: "USD"))
            TextField("Source", text: $source)
            DatePicker("Date", selection: $date, displayedComponents: .date)
            Button("Add Income") {
                let newIncome = Income(amount: amount, source: source, date: date)
                viewModel.addIncome(newIncome)
            }
        }
        .navigationTitle("Add Income")
    }
}
