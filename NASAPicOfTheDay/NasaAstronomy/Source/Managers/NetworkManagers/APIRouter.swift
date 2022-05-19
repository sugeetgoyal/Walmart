//
//  APIRouter.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

class APIRouter {
    func getPictureOfTheDay(for requestModel: PictureRequest, onCompletion: @escaping (_ response: PictureResponse?, _ error: (Bool, PictureErrorResponse?)) -> Void) {
        PictureNetworkManager().getPictureOfTheDay(for: requestModel, onCompletion: onCompletion)
    }
}
