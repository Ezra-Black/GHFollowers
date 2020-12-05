//
//  GFError.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/2/20.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername            = "This username created an invalid request. Please try again."
    case unableToComplete           = "Unable to complete your request. Please check your internet connection"
    case invalidResponse            = "Invalid response from the server. Please try again."
    case invalidData                = "The data received from the server was invalid. Please try again."
    case favoriteError              = "Error saving user to favorites data file. please try again"
    case favoriteErrorDuplicate     = "You already have this GitHub user in your Favorites. You can not add the same person twice!"
}
