

import UIKit
class CategoryListViewModel: NSObject {
    var showhud: ((Bool) -> Void)?
    var reloadTable: (() -> Void)?
    var homeData: [HomeData] = []
   
    func getList(success: @escaping (CategoryListModel) -> Void,failure: @escaping (Any?) -> Void){
        showhud?(true)
        
        ServiceHolder.shared.categoryListAPIHandler.perform(route: .getData, success:{ (response) in
            
            self.showhud?(false)
            guard let resultValue = response as? [String:Any] else{
                failure(response)
                return
            }
            
            
            
            
            if resultValue.count > 0 {
                do {
                    let jsonResp = try JSONSerialization.data(withJSONObject: resultValue, options: [])
                    let homeData = try JSONDecoder().decode(CategoryListModel.self, from: jsonResp)
                    self.homeData = homeData.homeData ?? []
                    self.reloadTable?()
                    success(homeData)
                } catch let parsingError {
                    failure(response)
                    print("Error", parsingError)
                }
                
            }
            else{
                failure(response)
            }
            
            
        }, failure: { (error) in
            self.showhud?(false)
            failure(error)
        })
        
    }
}
extension CategoryListViewModel: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeData.count > 0 {
            return homeData[0].values?.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
       
            let values = homeData[0].values ?? []
            cell.customiseDataWithModel(model: values[indexPath.item])
        
            return cell
        }
        
       
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 120 )
        
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
