import Foundation
import UIKit
import RxSwift

class PeopleViewController: UITableViewController {
  fileprivate lazy var viewModel = PeopleViewModel()
  fileprivate lazy var disposeBag = DisposeBag()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel
      .people
      .asObservable()
      .subscribe { _ in self.tableView.reloadData() }
      .addDisposableTo(disposeBag)
    viewModel.fetchPeople()
  }
}

// MARK - TableView Data Source
extension PeopleViewController {
  
  override public func tableView(_ tableView: UITableView,
                                 numberOfRowsInSection section: Int) -> Int {
    return viewModel.people.value.count
  }
  
  override public func tableView(_ tableView: UITableView,
                                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell",
                                             for: indexPath) as! PeopleCell
    let person = viewModel.people.value[indexPath.row]
    cell.configure(withViewModel: PeopleCellViewModel(withPeople: person))
    return cell
  }
}

