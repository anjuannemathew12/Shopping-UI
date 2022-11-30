
import Foundation
import Alamofire
class BaseService {

    func
    performRequest(router: URLRequestConvertible, success: @escaping (Any) -> Void, failure: @escaping (Any?) -> Void) {
        if !Connectivity.isReachable() {
            failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
            return
        }
    
        AF.request(router).responseJSON { response in
           print(response)

            if !Connectivity.isReachable() {
                failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
                return
            }
            
            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                
                if response.response?.statusCode == 401 {
                   
                    self.performRequest(router: router, success: { (response) in
                    
                        success(response)
                    }, failure: { (error) in
                       failure(error)
                    })
                    
                
                    
                    
                    
                }
                else{
                    let error = response.error!

                    if error._code == NSURLErrorTimedOut {
                        let timeoutError = ["error": Errors.General.returnErrorMessage(forErrorCode: "TIMEOUT_ERROR")] as [String: Any]
                        failure(timeoutError)
                        return
                    }
                    failure(error)
                   
                }
                
                
                
              return
            }
            
            guard let json = response.value else {

                let error = ["error": Errors.General.returnErrorMessage(forErrorCode: "UNKNOWN_ERROR")] as [String: Any]
                
//                self.performRequest(router: route) { (response: Any) in
//                    success(response)
//                } failure: { (error: Any) in
//                    failure(error)
//                }
                failure(error)
                return
            }
            
            if let status = (json as? [String : Any])?["status"] {

                if status as? Bool ?? false {
                    print("inside okkeeeeee")
                }
                else {
                        
                        failure(json as? [String: Any])
                        return
                    }
            
            }
            
            if let error = (json as? [String: Any])?["error"] as? String {
                
                if error == "invalid_grant" {
                    failure(response)
                    return
                }
            }
            else if let error = (json as? [String: Any])?["error"] as? [String: Any] {
                
                failure(error)
                return
            }

            

            
            
          
            success(json)
        }
    }
    

    
    func performUpload(data: Data, router: URLRequestConvertible, success: @escaping (Any) -> Void, failure: @escaping (Any?) -> Void, progressBlock: ((Any) -> Void)?) {
        
        if !Connectivity.isReachable() {
            
            failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
            return
        }
        
        let uploadRequest = AF.upload(data, with: router)
        
        uploadRequest.uploadProgress(closure: { (progress) in
            
            progressBlock!(progress.fractionCompleted)
        })
        
        uploadRequest.responseString { (response) in
            if !Connectivity.isReachable() {
                
                failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
                return
            }

            guard response.error == nil else {
                // got an error in getting the data, need to handle it

                let error = response.error!
                if error._code == NSURLErrorTimedOut {
                    let timeoutError = ["error": Errors.General.returnErrorMessage(forErrorCode: "TIMEOUT_ERROR")] as [String: Any]
                    failure(timeoutError)
                    return
                }
                failure(error)
                return
            }
            
            guard response.response?.statusCode == 200 else {
                failure(response.response)
                return
            }
            success(true)
        }
    }
    
    func performRequestForStringResponse(router: URLRequestConvertible, success:@escaping (Any)->Void, failure:@escaping (Any?)->Void) {
        
        if !Connectivity.isReachable() {
            
            failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
            return
        }
        
        AF.request(router).responseString { response in
            //debugPrint(response)
            if !Connectivity.isReachable() {
                
                failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
                return
            }


            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                
                let error = response.error!
                if error._code == NSURLErrorTimedOut {
                    let timeoutError = ["error": Errors.General.returnErrorMessage(forErrorCode: "TIMEOUT_ERROR")] as [String: Any]
                    failure(timeoutError)
                    return
                }
                failure(error)
                return
            }
            guard response.response?.statusCode == 200 else {
                failure(response.response)
                return
            }
            success(true)
        }
    }
    
    func performDownloadRequest(router: URLRequestConvertible, success: @escaping(Any) -> Void, failure: @escaping(Any?) -> Void) {
        
        if !Connectivity.isReachable() {
            
            failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
            return
        }
        
        AF.request(router).responseData { response in
            //debugPrint(response)
            if !Connectivity.isReachable() {
                
                failure(["error": Errors.Network.returnErrorMessage(forErrorCode: "NETWORK_NOT_REACHABLE")])
                return
            }


            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                let error = response.error!
                if error._code == NSURLErrorTimedOut {
                    let timeoutError = ["error": Errors.General.returnErrorMessage(forErrorCode: "TIMEOUT_ERROR")] as [String: Any]
                    failure(timeoutError)
                    return
                }
                failure(error)
                return
            }
            guard response.response?.statusCode == 200 else {
                failure(response.response)
                return
            }
            
            guard let data = response.data else {
                failure(response.response)
                return
            }
            success(data)
        }
    }
    
    
    
  
    
}

