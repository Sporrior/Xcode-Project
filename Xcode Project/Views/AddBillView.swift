import SwiftUI

struct AddBillView: View {
    @Binding var isPresented: Bool
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var dueDate: Date = Date()
    @State private var isPaid: Bool = false
    @ObservedObject var viewModel: BillViewModel

    var body: some View {
        NavigationView {
            Form {
                TextField("Hoeveel", text: $amount)
                    .keyboardType(.decimalPad)
                TextField("Wat voor rekening", text: $category)
                DatePicker("Wanneer", selection: $dueDate, displayedComponents: .date)
                Toggle("Betaald", isOn: $isPaid)
                Button("Voeg rekening toe") {
                    if let amountDouble = Double(amount) {
                        let newBill = Bill(amount: amountDouble, category: category, dueDate: dueDate, isPaid: isPaid)
                        viewModel.addBill(newBill)
                        isPresented = false // Dismiss the sheet
                    }
                }
            }
            .navigationTitle("Voeg Rekening toe")
        }
    }
}
