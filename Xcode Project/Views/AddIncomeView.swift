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
                TextField("Hoeveel", text: $amount)
                    .keyboardType(.decimalPad)
                TextField("Van", text: $source)
                DatePicker("Wanneer", selection: $date, displayedComponents: .date)
                Button("Voeg rekening toe") {
                    if let amountDouble = Double(amount) {
                        let newIncome = Income(amount: amountDouble, source: source, date: date)
                        viewModel.addIncome(newIncome)
                        isPresented = false // Dismiss the sheet
                    }
                }
            }
            .navigationTitle("Voeg rekening toe")
        }
    }
}
