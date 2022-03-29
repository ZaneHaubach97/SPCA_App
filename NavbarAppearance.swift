//
//  NavbarAppearance.swift
//  
//
//  Created by Edward Haubach on 3/23/22.
//

import SwiftUI

struct navbarAppearance: ViewModifier{
    init(){
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = SPCABlueUI
    }
    
    func body(content: Content) -> some View{
        content
    }
}

extension View{
    func navigationAppearance() -> some View{
        self.modifier(navbarAppearance)
    }
}
