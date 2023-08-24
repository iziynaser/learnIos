//
//  ContentView.swift
//  demoMapApp3
//
//  Created by IZIY on 8/23/23.
//

import SwiftUI
import MapKit

struct ContentView:View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
