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
            Spacer()
            
            Group {
                Text("Is **THIS** person\na **SHEEP**?")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 9))
                
                Text("Let's find out!")
                    .foregroundColor(model.fontClr)
                    .padding([.top], model.screenSize.width / 100)
            }
            
            Spacer()
            
            TextField("Phone number", text: $model.phone)
            
            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 8)
                        .cornerRadius(model.screenSize.width / 28)
                    
                    Text("Send the request")
                        .foregroundColor(.black)
                        .font(.system(size: model.screenSize.width / 20))
                }
            }).padding([.bottom], model.screenSize.width / 8)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
