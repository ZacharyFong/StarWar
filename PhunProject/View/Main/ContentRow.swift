//
//  ContentRow.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI

struct ContentRow: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    let starWar: [StarWarEntities]
    
    var body: some View {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
            VStarWarGroup(starWar: starWar)
        }else {
            HStarWarGroup(starWar: starWar)
        }
    }
}
