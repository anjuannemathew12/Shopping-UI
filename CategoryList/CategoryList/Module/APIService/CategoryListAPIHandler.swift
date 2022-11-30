

import Foundation
import Alamofire
class CategoryListAPIHandler: BaseService,CategoryListAPIService {
   
    func perform(route: CategoryListRouter, success: @escaping (Any) -> Void, failure: @escaping (Any?) -> Void) {
        
        performRequest(router: route, success: { (response:Any) in
            switch route {
            case .getData:
                success(response)
          
            }
            
        }) { (error:Any?) in
            failure(error)
        }
    }
}
enum CategoryListRouter: URLRequestConvertible {
   
    case getData
    var method: HTTPMethod {
        switch self {
        case .getData:
            return .get
       
       
        }
    }
    var path: String {
        switch self {
        case .getData:
            return "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
            
        }
    }
  
    func asURLRequest() throws -> URLRequest {
        
        let urlString = path
        
        let url = try urlString.asURL()
        print("Url....\(urlString)")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getData:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        }
        return urlRequest
    }
    
}

