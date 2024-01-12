import SwiftUI

struct AddIncomeView: View {
    @Binding var isPresented: Bool
    @State private var amount: String = ""
    @State private var source: String = ""
    @State private var date: Date = Date()
    @ObservedObject var viewModel: IncomeViewModel

    var body: some View {
        NavigationView {
            Form {
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                TextField("Source", text: $source)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                Button("Add Income") {
                    if let amountDouble = Double(amount) {
                        let newIncome = Income(amount: amountDouble, source: source, date: date)
                        viewModel.addIncome(newIncome)
                        isPresented = false // Dismiss the sheet
                    }
                }
            }
            .navigationTitle("Add Income")
        }
    }
}
