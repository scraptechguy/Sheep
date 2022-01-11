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
}
