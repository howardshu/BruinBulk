//
//  APIService.swift
//  Bruin Bulk
//
//  Created by Howard on 8/19/24.
//

import Foundation

//enum request {
//    static let url = "http://127.0.0.1:5000"
//    
//    case get
//    case post
//}

class APIService {
    // Intend to access APIService from many different Views
    // This ensures APIService only has one instance that can be accessed globally (singleton)
    static let shared = APIService()
    private let baseURL = "http://127.0.0.1:5000"
    
    func fetchDiningHalls(completion: @escaping ([DiningHall]?) -> Void) {
        // Use guard let because struct URL has init? constructor
        guard let url = URL(string: "\(baseURL)/dining_halls")
        else {
            print("Cannot access API")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching dining halls: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let halls = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(halls)
//                let diningHalls = try JSONDecoder().decode([String: String].self, from: data)
//                let halls = diningHalls.map { DiningHall(name: $0.key, url: $0.value) }
//                completion(halls)
                completion(nil)
            } catch {
                print("Error decoding dining halls: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    // Fetch Menu for a specific dining hall
    func fetchMenu(for hall: DiningHall, completion: @escaping ([MenuItem]?) -> Void) {
        guard let encodedName = hall.name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: "\(baseURL)/menu/\(encodedName)")
        else {
            print("Error creating URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching menu: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let menu = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(menu)
                completion(nil)
//                let menuItems = try JSONDecoder().decode([MenuItem].self, from: data)
//                completion(menuItems)
            } catch {
                print("Error decoding menu: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
