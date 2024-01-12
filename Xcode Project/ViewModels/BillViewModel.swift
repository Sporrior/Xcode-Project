import Foundation

class BillViewModel: ObservableObject {
    @Published var bills: [Bill] = []
    
    // Function to load bills.
    func loadBills() {
        // Load bills from UserDefaults or CoreData (to be implemented).
    }

    // Function to add a new bill.
    func addBill(_ bill: Bill) {
        bills.append(bill)
        // Save to UserDefaults or CoreData (to be implemented).
    }
}
