
import UIKit
class BannerListViewModel: NSObject {
    var homeData: [HomeData] = []
    
}
extension BannerListViewModel: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeData.count > 0 {
            return homeData[1].values?.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannersCollectionViewCell.identifier, for: indexPath) as! BannersCollectionViewCell
     
            let values = homeData[1].values ?? []
            cell.customiseDataWithModel(model: values[indexPath.item])
       
            return cell
            
        
            
        
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var collectionWidth : CGFloat?
            collectionWidth = (collectionView.bounds.width) - 10
        
        return CGSize(width: collectionWidth ?? 0, height: 250)
        
    }
    
   

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
}

    
}
