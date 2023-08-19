//
//  ContentView.swift
//  myProfile
//
//  Created by IZIY on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.19, green: 0.69, blue: 0.3,opacity: 0.52)
                  .edgesIgnoringSafeArea(.all)
            VStack {
                Image("16463057")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150.0,height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white,lineWidth: 2))
                Text("Naser Iziy")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("Full Stack Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 19))
                Divider()
                infoView(text: "+98 9192008250", imageName: "phone.fill")
                infoView(text: "iziy.naser@gmail.com", imageName:"envelope.fill")
                Divider()
                Button("projects") {
                    print("projects button clicked")
                    //ProjectsUIView()
                }
                    
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

