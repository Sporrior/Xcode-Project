import SwiftUI

struct BillsListView: View {
    @ObservedObject var viewModel: BillViewModel

    var body: some View {
        List {
            ForEach(viewModel.bills) { bill in
                HStack {
                    VStack(alignment: .leading) {
                        Text(bill.category)
                            .font(.headline)
                        Text("- \(bill.amount, format: .currency(code: "EUR"))")
                        Text("Datum: \(bill.dueDate, style: .date)")
                    }
                    Spacer()
                    Button(action: {
                        viewModel.toggleIsPaid(for: bill)
                    }) {
                        Image(systemName: bill.isPaid ? "checkmark.square" : "square")
                    }
                }
            }
            .onDelete(perform: viewModel.deleteBill)
        }
        .navigationTitle("")
        .onAppear {
            viewModel.loadBills()
        }
    }
}
