import Foundation
import Unbox

public struct People {
    // MARK: - Properties
    public let id: String
    public let name: String
    public let image: String
    public let birthday: Date
}

extension People: Unboxable {
  
    public init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.id = try unboxer.unbox(key: "id")
        self.image = try unboxer.unbox(key: "image")
        //Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.birthday = try unboxer.unbox(key: "birthday", formatter: dateFormatter)
    }
}
