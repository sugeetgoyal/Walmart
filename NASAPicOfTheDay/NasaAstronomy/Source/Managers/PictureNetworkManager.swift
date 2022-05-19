//
//  PictureNetworkManager.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import UIKit

class PictureNetworkManager: BaseNetworkManager {
    override init() {
        
    }
    
    func getPictureOfTheDay(for requestModel: PictureRequest, onCompletion: @escaping (_ response: PictureResponse?, _ error: (Bool, PictureErrorResponse?)) -> Void) -> Void {
        
        let anAPIPath = String(format: APIURL.getPictures.rawValue, requestModel.dateStr)
        
        super.execute(apiPath: anAPIPath, completionBlock: { (data, error) in
            if error.1 == nil {
                do {
                    let pictureResponse = try JSONDecoder().decode(PictureResponse.self, from: data ?? Data())
                    onCompletion(pictureResponse, (false, nil))
                } catch {
                    do {
                        let pictureErrorResponse = try JSONDecoder().decode(PictureErrorResponse.self, from: data ?? Data())
                        onCompletion(nil, (false, pictureErrorResponse))
                    } catch {
                        onCompletion(nil, (false, self.getPictureErrorResponse(from: error)))
                    }
                }
            } else {
                onCompletion(nil, (error.0, self.getPictureErrorResponse(from: error.1)))
            }
        })
    }
    
    private func getPictureErrorResponse(from error: Error?) -> PictureErrorResponse {
        if let anError = error {
            return PictureErrorResponse(msg: anError.localizedDescription,
                                        code: (anError as NSError).code)
        } else {
            return PictureErrorResponse(msg: "UnKnown Error",
                                        code: -11111)
        }
    }
}
