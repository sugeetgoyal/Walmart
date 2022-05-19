//
//  HomeViewModel.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import Foundation
let CachedResponseKey = "CachedResponse"
let lastImageError = "We are not connected to the internet, showing you the last image we have."

class HomeViewModel {
    var date: String?
    var title: String?
    var description: String?
    var mediaURL: String?
    var media_type: MediaType?
    
    func getPictureOfTheDay(_ queryDate: Date, completion: @escaping (_ success: Bool,_ error:String) -> Void) {
        let aRequestModel = PictureRequest(dateStr: queryDate.toString())
        
        APIRouter().getPictureOfTheDay(for: aRequestModel) {[weak self] (response, error) in
            if let aResponse = response, error.1 == nil {
                self?.updateResponse(response: aResponse)
                self?.saveToUserDefaults(model: aResponse)
                completion(true, "")
            } else if let errorResponse = error.1 {
                self?.handleErrorResponse(isNetworkError: error.0, errorResponse: errorResponse, completion: completion)
            } else {
                completion(false, "Unknown Error")
            }
        }
    }
    
    private func handleErrorResponse(isNetworkError: Bool, errorResponse: PictureErrorResponse, completion: @escaping (_ success: Bool,_ error:String) -> Void) -> Void {
        if isNetworkError {
            guard let model = self.retreiveLastSavedResponse() else {
                completion(false, errorResponse.msg)
                return
            }
            self.updateResponse(response: model)
            
            if self.isTodaysDate(savedDate: date?.toDate() ?? Date()) {
                completion(true, "")
            } else {
                completion(true, lastImageError)
            }
        } else {
            completion(false, errorResponse.msg)
        }
    }
    
    private func updateResponse(response: PictureResponse) {
        self.date = response.date
        self.title = response.title
        self.description = response.explanation
        self.mediaURL = response.url
        self.media_type = response.media_type
    }
    
    private func saveToUserDefaults(model: PictureResponse) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(model)
            UserDefaults.standard.set(data, forKey: "lastPictureResponseModel")
            UserDefaults.standard.synchronize()
        } catch {
            debugPrint("Unable to Encode (\(error))")
        }
    }
    
    private func retreiveLastSavedResponse() -> PictureResponse? {
        if let data = UserDefaults.standard.data(forKey: "lastPictureResponseModel") {
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(PictureResponse.self, from: data)
            } catch {
                debugPrint("Unable to Decode (\(error))")
                return nil
            }
        }
        
        return nil
    }
    
    private func isTodaysDate(savedDate: Date) -> Bool {
        let currDate = Date.currentDate()
        return currDate.compare(savedDate) == ComparisonResult.orderedSame
    }

}

//extension HomeViewModel {
//    func onSuccess(_ data: AnyObject?, _ apiName: APIName) -> Void {
//        if let aResponse = data as? PictureResponse {
//            self.updateResponse(response: aResponse)
//            //TODO: Save in coredata
//
//
//            completionBlock?(true, "")
//        }
//    }
//
//    func onError(_ errorMessage: String, apiName: APIName) {
//        if errorMessage == ConnectionErrorMessage {
//            //TODO: Fetch from Core Data
////            if let savedResponse = cache.object(forKey: CachedResponseKey as NSString) {
//            let savedResponse = PictureResponse()
//                self.updateResponse(response: savedResponse)
//
//                if let savedDate = savedResponse.date?.toDate(), Date.currentDate().compare(savedDate) == ComparisonResult.orderedSame {
//                    completionBlock?(true, "")
//                    return
//                }
////            }
//        }
//
//        completionBlock?(false, errorMessage)
//    }
//}

