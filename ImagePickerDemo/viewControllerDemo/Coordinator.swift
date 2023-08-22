//
//  Coordinator.swift
//  viewControllerDemo
//
//  Created by IZIY on 8/22/23.
//

import Foundation
import SwiftUI
import UIKit

class Coordinator: NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @Binding var imagePickerVisible : Bool
    @Binding var selectedImage : Image?
    
    init(imagePickerVisible: Binding<Bool>,selectedImage:Binding<Image?>) {
        _imagePickerVisible = imagePickerVisible
        _selectedImage = selectedImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        selectedImage = Image(uiImage: uiImage)
        imagePickerVisible = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePickerVisible = false
    }
    
    
}
