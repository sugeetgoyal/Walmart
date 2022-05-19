//
//  PictureResponse.swift
//  NasaAstronomy
//
//  Created by Sugeet Goyal on 16/05/2022.
//

import Foundation

enum MediaType: String, Codable {
    case video, audio, image, unknown
}

struct PictureErrorResponse: Codable {
    let msg: String
    let code: Int
}

struct PictureResponse: Codable {
    let date: String
    let title: String
    let explanation: String
    let hdurl: String
    let url: String
    var media_type = MediaType.unknown
}

//class PictureResponse {
//    var date: String?
//    var title: String?
//    var explanation: String?
//    var hdurl: String?
//    var url: String?
//    var media_type = MediaType.unknown
//
//    func updateData(_ data: Dictionary<String, AnyObject>) -> PictureResponse {
//        if let aVal = data["date"] as? String {
//            self.date = aVal
//        }
//
//        if let aVal = data["title"] as? String {
//            self.title = aVal
//        }
//
//        if let aVal = data["explanation"] as? String {
//            self.explanation = aVal
//        }
//
//        if let aVal = data["hdurl"] as? String {
//            self.hdurl = aVal
//        }
//
//        if let aVal = data["url"] as? String {
//            self.url = aVal
//        }
//
//        if let aVal = data["media_type"] as? String {
//            if aVal == "audio" {
//                self.media_type = .audio
//            } else if aVal == "video" {
//                self.media_type = .video
//            } else if aVal == "image" {
//                self.media_type = .image
//            } else {
//                self.media_type = .unknown
//            }
//        }
//
//        return self
//    }
//}
