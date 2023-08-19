//
//  TabUIView.swift
//  myProfile
//
//  Created by IZIY on 8/18/23.
//

import SwiftUI

struct TabUIView: View {
    
    @State private var selecttion = 1
    
    var body: some View {
        TabView(selection: $selecttion) {
                ContentView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Overvoew")
                }.tag(1)
            Text("Second Content View")
                .tabItem{
                    Image(systemName: "2.circle")
                    Text("screen two")
                }
                .tag(2)
                GridUIView()
                .tabItem{
                    Image(systemName: "3.circle")
                    Text("screen three")
                }
                .tag(3)
        }
        .font(.title3)
        //.tabViewStyle(PageTabViewStyle())
    }
}

struct TabUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView()
    }
}
