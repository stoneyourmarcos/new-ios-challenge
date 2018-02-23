import Foundation
import PromiseKit
import Unbox

public class FileService {
  public class func fetchDataFromFile() -> Promise<[People]> {
    
    let filePath = Bundle.main.path(forResource: "ios_challenge", ofType: "json")!
    let data = try! Data(contentsOf: URL(fileURLWithPath:filePath), options: .uncached)
    let people = self.startParsingJson(data: data)
    return people
  }
  
  public class func startParsingJson(data: Data) -> Promise<[People]> {
    return Promise { fulfill, reject in
      do {
        let rawData: [People] = try unbox(data: data)
        var uniques: [People] = []
        var ids: [String] = []
        uniques = rawData.flatMap { person -> People? in
          if !ids.contains(person.id) {
            ids.append(person.id)
            return person
          }
          return nil
        }
        return fulfill(uniques)
      } catch let error {
        return reject(error)
      }
    }
  }
}
