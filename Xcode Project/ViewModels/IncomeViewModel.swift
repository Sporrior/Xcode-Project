import Foundation

class IncomeViewModel: ObservableObject {
    @Published var incomes: [Income] = [] {
        didSet {
            saveIncomes()
        }
    }

    init() {
        loadIncomes()
    }

    func loadIncomes() {
        if let savedIncomes = UserDefaults.standard.object(forKey: "incomes") as? Data {
            if let decodedIncomes = try? JSONDecoder().decode([Income].self, from: savedIncomes) {
                self.incomes = decodedIncomes
            }
        }
    }

    func addIncome(_ income: Income) {
        incomes.append(income)
    }

    func deleteIncome(at offsets: IndexSet) {
        incomes.remove(atOffsets: offsets)
    }

    private func saveIncomes() {
        if let encoded = try? JSONEncoder().encode(incomes) {
            UserDefaults.standard.set(encoded, forKey: "incomes")
        }
    }
}
