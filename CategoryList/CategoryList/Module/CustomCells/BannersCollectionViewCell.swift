

import UIKit
import SDWebImage
class BannersCollectionViewCell: UICollectionViewCell {
    static let identifier = "BannersCollectionViewCell"
    static let nib = UINib(nibName: "BannersCollectionViewCell", bundle: nil)
    @IBOutlet weak var itemNameLbl: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemDescLabel: UILabel!
    
    @IBOutlet weak var priceCoverView: UIView!
    
    @IBOutlet weak var priceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        priceCoverView.setRoundedCorner(radius: 5.0)
    }
    func customiseDataWithModel(model: Values) {
        imageView.sd_setImage(with: URL(string:model.banner_url ?? ""), placeholderImage: UIImage(named: "nodata"))
        itemNameLbl.text = model.name
    }
}
