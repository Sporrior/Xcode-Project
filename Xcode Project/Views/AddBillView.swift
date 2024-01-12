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
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                TextField("Category", text: $category)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Toggle("Paid", isOn: $isPaid)
                Button("Add Bill") {
                    if let amountDouble = Double(amount) {
                        let newBill = Bill(amount: amountDouble, category: category, dueDate: dueDate, isPaid: isPaid)
                        viewModel.addBill(newBill)
                        isPresented = false // Dismiss the sheet
                    }
                }
            }
            .navigationTitle("Add Bill")
        }
    }
}
