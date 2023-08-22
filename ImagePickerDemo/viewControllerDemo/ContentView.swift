//
//  ContentView.swift
//  viewControllerDemo
//
//  Created by IZIY on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var imagePickerVisible : Bool = false
    @State var selectedImage : Image? = Image(systemName: "photo")
    
    var body: some View {
        ZStack{
            VStack {
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action:{
                    withAnimation{
                        self.imagePickerVisible.toggle()
                    }
                }) {
                    Text("Select an Image")
                }
            }
            .padding()
            
            if(imagePickerVisible){
                MyImagePicker(imagePickerVisisble: $imagePickerVisible, selectedImage: $selectedImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
