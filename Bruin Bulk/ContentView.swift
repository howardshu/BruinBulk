//
//  ContentView.swift
//  Bruin Bulk
//
//  Created by Howard on 7/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Bruin Bulk")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding().background(.blue)
                
            Spacer()
            
            HStack(alignment: .lastTextBaseline) {
                Spacer()
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.caption)
                        .fontWeight(.regular)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "fork.knife")
                    Text("Log Food")
                        .font(.caption)
                        .fontWeight(.regular)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "calendar")
                    Text("Plan")
                        .font(.caption)
                        .fontWeight(.regular)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "ellipsis.circle")
                    Text("More")
                        .font(.caption)
                        .fontWeight(.regular)
                }
                Spacer()
            }.padding().background(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
