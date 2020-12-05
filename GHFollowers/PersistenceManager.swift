//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/4/20.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completion: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completion(.favoriteErrorDuplicate)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                completion(save(favorites: favorites))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    
    static func retrieveFavorites(completion: @escaping (Result<[Follower], GFError>) -> Void ) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completion(.success(favorites))
        } catch {
            completion(.failure(.favoriteError))
        }
    }
    
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encdodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encdodedFavorites, forKeyPath: Keys.favorites)
            return nil
        } catch {
            return .favoriteError
        }
    }
}
