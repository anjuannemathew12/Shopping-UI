

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    static let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    
    @IBOutlet weak var imageCovrView: UIView!
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCovrView.setRoundedCorner(radius: imageCovrView.frame.width/2)
        
    }
    
    func customiseDataWithModel(model: Values) {
        imageView.sd_setImage(with: URL(string:model.image_url ?? ""), placeholderImage: UIImage(named: "nodata"))
        categoryName.text = model.name
    }
}
