import SwiftUI

struct BillsListView: View {
    @ObservedObject var viewModel: BillViewModel

    var body: some View {
        List(viewModel.bills) { bill in
            VStack(alignment: .leading) {
                Text(bill.category)
                    .font(.headline)
                Text("Amount: \(bill.amount, format: .currency(code: "USD"))")
                Text("Due Date: \(bill.dueDate.formatted(date: .abbreviated, time: .omitted))")
                Text("Paid: \(bill.isPaid ? "Yes" : "No")")
            }
        }
        .navigationTitle("Bills")
        .onAppear {
            viewModel.loadBills()
        }
    }
}
