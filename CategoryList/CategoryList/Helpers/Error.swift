

import Foundation
class Errors {
    
    // MARK: - General Errors
    
    struct General {
        
        static func returnErrorMessage(forErrorCode errorCode: String) -> String {
            
            var errorMessage = String()
            
            switch errorCode {
                
            case "TIMEOUT_ERROR":
                errorMessage = "Something went wrong. Please try again later"
                
            case ErrorCode.INTERNAL_SERVER_ERROR.rawValue:
                errorMessage = "Something went wrong. Please try again later"
                
            case ErrorCode.UNAUTHORIZED_USER.rawValue:
                errorMessage = "Unauthorized User"
                
            case ErrorCode.FORBIDDEN.rawValue:
                errorMessage = "You do not have the privilege to access this"
                
            case ErrorCode.BAD_REQUEST.rawValue:
                errorMessage = "Bad Request"
                
            case ErrorCode.USER_NOT_FOUND.rawValue:
                errorMessage = "We are not able to find an account associated with this user"
                
            case ErrorCode.NOT_FOUND.rawValue:
                errorMessage = "Not found"
                
            case ErrorCode.INVALID_URL.rawValue:
                errorMessage = "Please share a valid url"
                
            case ErrorCode.INVALID_TAG.rawValue:
                errorMessage = "Invalid tag name"
                
            case ErrorCode.FILE_MISSING.rawValue:
                errorMessage = "Missing file"
                
            case ErrorCode.INVALID_INPUT_FORMAT.rawValue:
                errorMessage = "Invalid input format"
                
            case ErrorCode.MISSING_TAG.rawValue:
                errorMessage = "Tag is missing"
                
            case ErrorCode.MISSING_DEVICE_TYPE.rawValue:
                errorMessage = "Missing device type"
                
            case ErrorCode.MISSING_DEVICE_REGISTRATION_ID.rawValue:
                errorMessage = "Missing deviceregistrationid"
                
            case ErrorCode.MISSING_LAT_OR_LONG.rawValue:
                errorMessage = "Missing latitude / longitude"
                
            case ErrorCode.MISSING_URLS_OF_FILES.rawValue:
                errorMessage = "Missing urls of files to be deleted"
                
            case ErrorCode.NULL_DATA.rawValue:
                errorMessage = "No Data Available"

            default:
                errorMessage = "Something went wrong. Please try again later"
                break
            }
            
            return errorMessage
        }
        
        enum ErrorCode: String {
            
            //case TIMEOUT_ERROR
            case INTERNAL_SERVER_ERROR
            case UNAUTHORIZED_USER
            case FORBIDDEN
            case BAD_REQUEST
            case USER_NOT_FOUND
            case NOT_FOUND
            case INVALID_URL
            case INVALID_TAG
            case FILE_MISSING
            case INVALID_INPUT_FORMAT
            case MISSING_TAG
            case MISSING_DEVICE_TYPE
            case MISSING_DEVICE_REGISTRATION_ID
            case MISSING_LAT_OR_LONG
            case MISSING_URLS_OF_FILES
            case NULL_DATA
        }
    }
    
    // MARK: - Network Errors
    
    struct Network {
        
        static func returnErrorMessage(forErrorCode errorCode: String) -> String {
            
            var errorMessage = String()
            
            switch errorCode {
                
            case ErrorCode.NETWORK_NOT_REACHABLE.rawValue:
                errorMessage = AppMessages.networkNotReachable
                
            default:
                break
            }
            
            return errorMessage
        }
        
        enum ErrorCode: String {
            
            case NETWORK_NOT_REACHABLE
        }
    }

}
