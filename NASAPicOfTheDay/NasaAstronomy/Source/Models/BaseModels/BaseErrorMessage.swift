//
//  BaseErrorMessage.swift
//  NasaAstronomy
//
//  Created by Sugeet-Home on 16/05/2022.
//

import Foundation

class BaseErrorMessage {
	var code = String()
	var message = String()

    public init(code: String, message: String) {
		self.code = code
		self.message = message
	}
}
