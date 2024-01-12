import Foundation

class IncomeViewModel: ObservableObject {
    @Published var incomes: [Income] = []
    
    // Function to load incomes from persistence.
    func loadIncomes() {
        // Load incomes from UserDefaults or CoreData (to be implemented).
    }

    // Function to add a new income.
    func addIncome(_ income: Income) {
        incomes.append(income)
        // Save to UserDefaults or CoreData (to be implemented).
    }
}
