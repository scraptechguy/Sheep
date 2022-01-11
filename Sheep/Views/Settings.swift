//
//  Settings.swift
//  Sheep
//
//  Created by Rostislav Brož on 1/11/22.
//

import SwiftUI

struct Settings: View {
    // Access data in ContentModel.swift
     
     @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        Text("show home")
            .onTapGesture {
                withAnimation(.spring()) {
                    model.offset = .zero
                    model.showingSettings.toggle()
                }
            }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
