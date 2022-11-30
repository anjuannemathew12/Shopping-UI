

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var searchcoverView: UIView!
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionview: UICollectionView!
    let catViewModel = CategoryListViewModel()
    let productListViewModel = ProductListViewModel()
    let bannerListViewModel = BannerListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDelegates()
        self.viewModelClosures()
        self.setUpViews()
        self.getData()
    }
    
    func setUpDelegates() {
        
        self.categoryCollectionView.delegate = catViewModel
        self.categoryCollectionView.dataSource = catViewModel
        
        self.bannerCollectionView.delegate = bannerListViewModel
        self.bannerCollectionView.dataSource = bannerListViewModel
        
        self.productCollectionview.delegate = productListViewModel
        self.productCollectionview.dataSource = productListViewModel
        categoryCollectionView.register(CategoryCollectionViewCell.nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        bannerCollectionView.register(BannersCollectionViewCell.nib, forCellWithReuseIdentifier: BannersCollectionViewCell.identifier)
        productCollectionview.register(ProductsCollectionViewCell.nib, forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
        
    }
    func setUpViews() {
        searchcoverView.setRoundedCorner(radius: 5.0)
        searchcoverView.setBorder(width: 1.5,color: #colorLiteral(red: 0.8980392157, green: 0.9176470588, blue: 0.9333333333, alpha: 1))
    }
    func viewModelClosures() {
        catViewModel.showhud = { showhud in
            if showhud {
                self.view.showHud()
            }else {
                self.view.hideHud()
            }
            
        }
        catViewModel.reloadTable = {
            self.productListViewModel.homeData = self.catViewModel.homeData
            self.bannerListViewModel.homeData = self.catViewModel.homeData
            self.categoryCollectionView.reloadData()
            self.bannerCollectionView.reloadData()
            self.productCollectionview.reloadData()
        }
    }
    func getData() {
        catViewModel.getList(success: { model in
            
        }, failure: { error in
            
            if let errorMsg = (error as? [String:Any])?["message"] as? String {
                self.showAlertMessage(title: "failed", message: errorMsg, okButtonTitle: "OK")
            }
        })
    }
}

