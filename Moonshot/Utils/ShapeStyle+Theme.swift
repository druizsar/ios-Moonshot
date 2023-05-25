//
//  ShapeStyle+Theme.swift
//  Moonshot
//
//  Created by David Ruiz on 24/05/23.
//

import SwiftUI

// SahpeStyle extension only for colors
extension ShapeStyle where Self == Color {
    
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var ligthBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
