//
//  DiningHallListView.swift
//  Bruin Bulk
//
//  Created by Howard on 8/27/24.
//

import SwiftUI

struct DiningHallListView: View {
    var viewModel = DiningHallViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.diningHalls) { hall in
//                NavigationLink(destination: MenuViewModel(hall: hall)) {
                Text(hall.name)
//                }
            }
            .navigationTitle("Dining Halls")
            .onAppear {
                viewModel.loadDiningHalls()
            }
        }
    }
}

struct DiningHallListView_Previews: PreviewProvider {
    static var previews: some View {
        DiningHallListView()
    }
}

