//
//  Color.swift
//  20220718-LakshmiBodempudi-NYCSchools
//
//  Created by Lakshmi Praveena Bodempudi on 7/22/22.
//

import Foundation
import SwiftUI

extension Color {
    static let launchTheme = LaunchTheme()
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    let background = Color(#colorLiteral(red: 0.5607843137, green: 0.8196078431, blue: 0.7843137255, alpha: 1))
    let secondaryText = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
    let primaryTextColor = Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
}

struct LaunchTheme {
     let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
