//
//  BaseNetworkManager.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import UIKit

enum APIURL: String {
    //Replace the value of API key here
    case getPictures = "apod?api_key=4P4PAcxlrt6zSbZLlLlPL7MeCGObELkMao1XXaHy&date=%@"
}

class BaseNetworkManager: NSObject {
    let baseURLString = "https://api.nasa.gov/planetary/"
    
    func execute(apiPath: String,
                 completionBlock: @escaping (_ result: Data?,
                                             _ error: (Bool, Error?)) -> Void) -> Void {
        
        guard let url = URL(string: baseURLString + apiPath) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error == nil {
                completionBlock(data, (false, nil))
            } else {
                if let anError = error, (anError as NSError).isNetworkConnectionError() {
                    completionBlock(nil, (true, error))
                } else {
                    completionBlock(nil, (false, error))
                }
            }
        })
        
        task.resume()
    }
}

extension NSError {
    func isNetworkConnectionError() -> Bool {
        let networkErrors = [NSURLErrorNetworkConnectionLost, NSURLErrorNotConnectedToInternet]
        
        if self.domain == NSURLErrorDomain && networkErrors.contains(code) {
            return true
        }
        return false
    }
}

