//
//  Date.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import UIKit
import CoreMedia

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }

    static func currentDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: Date().toString()) ?? Date()
    }
}
