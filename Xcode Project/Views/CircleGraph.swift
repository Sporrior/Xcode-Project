import SwiftUI

struct SegmentedCircleGraph: View {
    var income: CGFloat
    var bills: CGFloat
    private var total: CGFloat { max(income + bills, 0) } // Ensure total is never zero

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.gray)

            if income > 0 {
                // Income segment
                Circle()
                    .trim(from: 0, to: income / total)
                    .stroke(Color.green, lineWidth: 20)
                    .rotationEffect(Angle(degrees: -90))
            }
            
            if bills > 0 {
                // Bills segment
                Circle()
                    .trim(from: income / total, to: 1)
                    .stroke(Color.red, lineWidth: 20)
                    .rotationEffect(Angle(degrees: -90 + (360 * Double(income / total))))
            }

            VStack {
                Text("Totaal")
                    .font(.headline)
                Text("\(total, specifier: "%.2f") EUR")
                    .font(.title)
            }
        }
    }
}
