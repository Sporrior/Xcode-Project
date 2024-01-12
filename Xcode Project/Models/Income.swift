import Foundation

struct Income: Identifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var source: String
    var date: Date
}
