//
//  HomeView.swift
//  Sheep
//
//  Created by Rostislav Brož on 1/11/22.
//

import SwiftUI

struct HomeView: View {
    // Access data in ContentModel.swift
     
     @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        VStack {
            Text("Is **THIS** person\na **SHEEP**?")
                .foregroundColor(model.fontClr)
                .font(.system(size: model.screenSize.width / 10))
            
            Text("Let's find out!")
                .foregroundColor(model.fontClr)
                .padding([.top], model.screenSize.width / 100)
            
            TextField("Phone number", text: $model.phone)
            
            Button(action: {}, label: {
                ZStack {
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 8)
                        .cornerRadius(model.screenSize.width / 28)
                    
                    Text("Send the request")
                        .foregroundColor(model.fontClrDark)
                        .font(.system(size: model.screenSize.width / 20))
                }
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
