import Foundation
import PromiseKit
import RxSwift

public class PeopleViewModel: NSObject {
    public var people = Variable<[People]>([])
  
    func fetchPeople() {
        FileService.fetchDataFromFile().then { people -> Void in
            self.people.value = people
            print("Fetched")
            debugPrint(people)
            }.catch { error in
                print(error)
        }
    }
}
