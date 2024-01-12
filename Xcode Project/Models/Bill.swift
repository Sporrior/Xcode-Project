import Foundation

struct Bill: Identifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var category: String
    var dueDate: Date
    var isPaid: Bool
}
