import Foundation

struct PeopleCellViewModel {
    
    let name: String?
    let id: String?
    let birthday: String?
    let imageURL: URL?
    
    init(withPeople people: People) {
        name = people.name
        id = people.id
        birthday = people.birthday.ddmmyyyFormatted()
        imageURL = URL(string: "\(people.image)")!
    }
}
