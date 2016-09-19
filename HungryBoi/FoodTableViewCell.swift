import Foundation
import UIKit
import HungryBoiCommon

class FoodTableViewCell: UITableViewCell {
  static var identifier = "FoodTableViewCell"
  @IBOutlet weak var foodNameLabel: UILabel! {
    didSet {
//      guard let foodNameLabel = foodNameLabel else {
//        return
//      }
//      sportNameLabel.font = UIFont.boldItalicSoft(size: 30)
    }
  }

  @IBOutlet weak var foodImageView: UIImageView!
  
  var recipe:Recipe? {
    didSet {
      
      guard let foodNameLabel = foodNameLabel else {
        return
      }
      
      foodNameLabel.text = recipe?.name.uppercased()
//      foodImageView.image = recipe?.image
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    preservesSuperviewLayoutMargins = false
    layoutMargins = UIEdgeInsets.zero
    layoutIfNeeded()
  }
  
}
