//
//  String.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date ?? Date()
    }
}
