import Foundation
import SDWebImage

class PeopleCell: UITableViewCell {
  // MARK: - Properties
  @IBOutlet weak var peopleNameLbl: UILabel!
  @IBOutlet weak var peopleIDLbl: UILabel!
  @IBOutlet weak var peopleBirthdayLbl: UILabel!
  @IBOutlet weak var peopleAvatarImg: UIImageView!
}

extension PeopleCell {
  func configure(withViewModel viewModel: PeopleCellViewModel) {
    peopleNameLbl.text = viewModel.name
    peopleIDLbl.text = viewModel.id
    peopleBirthdayLbl.text = "\(viewModel.birthday!)"
    peopleAvatarImg.sd_setImage(with: viewModel.imageURL)
  }
}
