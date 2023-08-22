//
//  myImagePicker.swift
//  viewControllerDemo
//
//  Created by IZIY on 8/22/23.
//

import SwiftUI
import UIKit

struct MyImagePicker: UIViewControllerRepresentable {
    
    @Binding var imagePickerVisisble : Bool
    @Binding var selectedImage: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePickerVisible: $imagePickerVisisble, selectedImage: $selectedImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController:UIImagePickerController,context: UIViewControllerRepresentableContext<MyImagePicker>){
        
    }
    
}

/*
struct myImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        MyImagePicker()
    }
}
*/
