//
//  ViewModels.swift
//  Bruin Bulk
//
//  Created by Howard on 8/27/24.
//

import Foundation

@Observable
class DiningHallViewModel {
    var diningHalls: [DiningHall] = []
    
    func loadDiningHalls() {
        APIService.shared.fetchDiningHalls { [weak self] halls in
            DispatchQueue.main.async {
                // [weak self] makes self an optional type
                // ?? is nil-coalescing operator: if items is nil, default value of empty array ([]) will be assigned to menuItems
                self?.diningHalls = halls ?? []
            }
        }
    }
}

@Observable
class MenuViewModel {
    var menuItems: [MenuItem] = []
    
    func loadMenu(for hall: DiningHall) {
        APIService.shared.fetchMenu(for: hall) { [weak self] items in
            DispatchQueue.main.async {
                self?.menuItems = items ?? []
            }
        }
    }
}

