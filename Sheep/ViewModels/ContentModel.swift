//
//  ContentModel.swift
//  Sheep
//
//  Created by Rostislav Brož on 1/11/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    // SCREEN SIZE BOUNDS
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    // UI COLORS
    
    @AppStorage("theme") public var currentTheme = "dark"
    @Published var bg = Color(red: 0.05, green: 0, blue: 0)
    @Published var objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
    @Published var objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
    @Published var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
    @Published var objectClrBlue = Color(red: 0, green: 1, blue: 0.9375)
    @Published var fontClrDark = Color(red: 0.3320, green: 0.3242, blue: 0.3242)
    @Published var fontClr = Color(red: 1, green: 1, blue: 1)
    
    
    @Published var offset: CGSize = .zero
    @Published var showingSettings:Bool = false
    
    
    struct LiquidShape: Shape {
        
        var offset: CGSize
        
        var animatableData: CGSize.AnimatableData {
            get {return offset.animatableData}
            set {offset.animatableData = newValue}
        }
        
        func path(in rect: CGRect) -> Path {
            return Path {path in
                let width = rect.width + (-offset.width > 0 ? offset.width: 0)
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: rect.width, y: 0))
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: 0, y: rect.height))
                
                let from = 80 + (offset.width)
                path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80: from))
                
                var to = 180 + (offset.height) + (-offset.width)
                to = to < 180 ? 180: to
                
                let mid: CGFloat = 80 + ((to - 80) / 2)
                path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
            }
        }
    }
}
