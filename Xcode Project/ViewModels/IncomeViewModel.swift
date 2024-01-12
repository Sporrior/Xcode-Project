import Foundation

class IncomeViewModel: ObservableObject {
    @Published var incomes: [Income] = []
    
    func loadIncomes() {
        // Load incomes from UserDefaults or CoreData (to be implemented).
    }

    func addIncome(_ income: Income) {
        incomes.append(income)
        // Save to UserDefaults or CoreData (to be implemented).
    }

    func deleteIncome(at offsets: IndexSet) {
        incomes.remove(atOffsets: offsets)
        // Update the persistence layer accordingly if needed.
    }
}
