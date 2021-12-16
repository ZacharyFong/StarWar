//
//  VStarWarGroup.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI

struct VStarWarGroup: View {
    
    let starWar: [StarWarEntities]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(starWar, id: \.self)  {starWar in
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

