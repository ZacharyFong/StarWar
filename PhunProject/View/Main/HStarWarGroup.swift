//
//  HStarWarGroup.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI

struct HStarWarGroup: View {
    
    let starWar: [StarWarEntities]
    let width: CGFloat = 100
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [adaptiveGridItm(width: width),adaptiveGridItm(width: width)], spacing: 15) {
                    ForEach(starWar, id: \.self) {starWar in
                        NavigationLink(destination: ContentDetailView(starWar: starWar)) {
                            StarWarImage(starWar: starWar)
                        }
                    }
                }
            }
            .padding(15)
            .navigationTitle("Star War")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private func adaptiveGridItm(width: CGFloat) -> GridItem{
    var gridItem = GridItem(.flexible(minimum: width))
    gridItem.spacing = 15
    return gridItem
}

