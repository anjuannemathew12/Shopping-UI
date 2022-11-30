

import UIKit
import SDWebImage
class ProductsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductsCollectionViewCell"
    static let nib = UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
    
    @IBOutlet weak var truckImageView: UIView!
    
    @IBOutlet weak var oldPriceLine: UILabel!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var newPricelbl: UILabel!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var offerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        addBtn.setRoundedCorner(radius: 5.0)
        coverView.setRoundedCorner(radius: 5.0)
        coverView.setBorder(width: 1.5,color: #colorLiteral(red: 0.8980392157, green: 0.9176470588, blue: 0.9333333333, alpha: 1))
        // Initialization code
    }
    
    
    func customiseData(model: Values) {
        
        itemNameLbl.text = model.name
        newPricelbl.text = model.offer_price
        oldPriceLbl.text = model.actual_price
        offerLabel.text = "\(model.offer ?? 0)" + "% OFF"
        imageView.sd_setImage(with: URL(string:model.image ?? ""), placeholderImage: UIImage(named: "nodata"))
        if model.is_express ?? false {
            truckImageView.isHidden = false
        }else {
            truckImageView.isHidden = true
        }
        if model.offer ?? 0 > 0 {
            offerView.isHidden = true
        }else {
            offerView.isHidden = false
        }
        if model.actual_price == model.offer_price {
            oldPriceLbl.isHidden = true
            oldPriceLine.isHidden = true
            offerView.isHidden = true
        }else {
            oldPriceLbl.isHidden = false
            oldPriceLine.isHidden = false
            offerView.isHidden = false
        }
        
    }
    

}
