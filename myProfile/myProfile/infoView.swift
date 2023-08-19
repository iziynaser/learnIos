//
//  infoView.swift
//  myProfile
//
//  Created by IZIY on 2/25/23.
//

import SwiftUI


struct infoView: View {
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text)
                    .foregroundColor(.black)
            })
            .padding(.all)
    }
}


struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView(text:"my name",imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
