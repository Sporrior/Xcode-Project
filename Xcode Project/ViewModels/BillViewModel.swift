import Foundation

class BillViewModel: ObservableObject {
    @Published var bills: [Bill] = [] {
        didSet {
            saveBills()
        }
    }

    init() {
        loadBills()
    }

    func loadBills() {
        if let savedBills = UserDefaults.standard.object(forKey: "bills") as? Data {
            if let decodedBills = try? JSONDecoder().decode([Bill].self, from: savedBills) {
                self.bills = decodedBills
            }
        }
    }

    func addBill(_ bill: Bill) {
        bills.append(bill)
    }

    func deleteBill(at offsets: IndexSet) {
        bills.remove(atOffsets: offsets)
    }

    func toggleIsPaid(for bill: Bill) {
        if let index = bills.firstIndex(where: { $0.id == bill.id }) {
            bills[index].isPaid.toggle()
        }
    }

    private func saveBills() {
        if let encoded = try? JSONEncoder().encode(bills) {
            UserDefaults.standard.set(encoded, forKey: "bills")
        }
    }
}
