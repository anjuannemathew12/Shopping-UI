
import UIKit
import AVFoundation
class Utils: NSObject {
    
   
   class func getDataFromJsonFile(name:String) -> [String:Any]{
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResultValue = jsonResult as? [String:Any]  {
                    
                    return jsonResultValue
                }
            } catch {
                return [:]
            }
        }
    return [:]
    }
}

func convertToString(fromDictionary dicData: [String : Any]?) -> String? {
  var jsonData: Data? = nil
  do {
      if let dicData {
          jsonData = try JSONSerialization.data(withJSONObject: dicData, options: .prettyPrinted)
      }
  } catch {
  }
  var jsonString: String? = nil
  if let jsonData {
      jsonString = String(data: jsonData, encoding: .utf8)
  }
  jsonString = (jsonString as NSString?)?.addingPercentEscapes(using: String.Encoding.utf8.rawValue)
  return jsonString
}



