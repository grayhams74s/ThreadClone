//
//  PlacesError.swift
//  CityTourGuideApp
//
//  Created by felix angcot jr on 2/16/26.
//

import Foundation

enum LoginErrorResponse: Error {
    case wrongPassword, invalidEmail, apiError, somethingWentWrong
}
