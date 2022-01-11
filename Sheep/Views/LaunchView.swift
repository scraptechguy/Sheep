//
//  LaunchView.swift
//  Sheep
//
//  Created by Rostislav Brož on 1/11/22.
//

import SwiftUI

struct LaunchView: View {
    // Access data in ContentModel.swift
     
     @EnvironmentObject var model: ContentModel
     
     
     var body: some View {
         ZStack {
             model.bg.overlay(
                    HomeView()
                 )
                 .clipShape(ContentModel.LiquidShape(offset: model.offset))
                 .overlay(
                     Image(systemName: "gearshape")
                         .font(.system(size: model.screenSize.width / 18))
                         .frame(width: model.screenSize.width / 8, height: model.screenSize.width / 8)
                         .contentShape(Rectangle())
                         .gesture(DragGesture().onChanged({ (value) in
                             withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                    model.offset = value.translation
                             }
                         }).onEnded({ (value) in
                             withAnimation(.spring()) {
                                 if -model.offset.width > model.screenSize.width / 2 {
                                     model.offset.width = -model.screenSize.height
                                     model.showingSettings.toggle()
                                 }
                                 
                                 else {
                                     model.offset = .zero
                                 }
                             }
                         })
                         )
                         .foregroundColor(model.objectsClrDark)
                         .offset(x: model.screenSize.width / 50, y: model.screenSize.width / 3.6)
                        .opacity(model.offset == .zero ? 1 : 0),
                     alignment: .topTrailing
                 )
                 .ignoresSafeArea()
             
             if model.showingSettings == true {
                 Text("show home")
                     .onTapGesture {
                         withAnimation(.spring()) {
                             model.offset = .zero
                             model.showingSettings.toggle()
                         }
                     }
             }
         }
     }
 }


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
