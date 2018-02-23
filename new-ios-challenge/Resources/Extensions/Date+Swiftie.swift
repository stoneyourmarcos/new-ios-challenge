import Foundation

extension Date {
    func yearFormatter() -> String {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        return df.string(from: self)
    }
}
