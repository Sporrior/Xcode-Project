import Foundation

class BillViewModel: ObservableObject {
    @Published var bills: [Bill] = []
    
    func loadBills() {
        // Load bills from UserDefaults or CoreData (to be implemented).
    }

    func addBill(_ bill: Bill) {
        bills.append(bill)
        // Save to UserDefaults or CoreData (to be implemented).
    }

    func deleteBill(at offsets: IndexSet) {
        bills.remove(atOffsets: offsets)
        // Update the persistence layer accordingly if needed.
    }

    func toggleIsPaid(for bill: Bill) {
        if let index = bills.firstIndex(where: { $0.id == bill.id }) {
            bills[index].isPaid.toggle()
            // Update the persistence layer accordingly if needed.
        }
    }
}
