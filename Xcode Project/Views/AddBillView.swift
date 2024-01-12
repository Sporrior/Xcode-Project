import SwiftUI

struct AddBillView: View {
    @State private var amount: Double = 0.0
    @State private var category: String = ""
    @State private var dueDate: Date = Date()
    @State private var isPaid: Bool = false
    @ObservedObject var viewModel: BillViewModel

    var body: some View {
        Form {
            TextField("Amount", value: $amount, format: .currency(code: "USD"))
            TextField("Category", text: $category)
            DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            Toggle("Paid", isOn: $isPaid)
            Button("Add Bill") {
                let newBill = Bill(amount: amount, category: category, dueDate: dueDate, isPaid: isPaid)
                viewModel.addBill(newBill)
            }
        }
        .navigationTitle("Add Bill")
    }
}
