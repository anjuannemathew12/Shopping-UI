
import Foundation
class ServiceHolder {
    
    static let shared: ServiceHolder = ServiceHolder()
    public let categoryListAPIHandler = CategoryListAPIHandler()

}
