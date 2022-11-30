
import Foundation

protocol CategoryListAPIService {
    func perform(route:CategoryListRouter, success:@escaping (Any)->Void, failure:@escaping (Any?)->Void)
  
}
