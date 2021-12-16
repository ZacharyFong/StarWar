//
//  StarWarImage.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI
import Kingfisher

struct StarWarImage: View {
    
    let starWar: StarWarEntities
    
    let processor = RoundCornerImageProcessor(cornerRadius: 20)
    
    let placeholder = Image("placeholder")
    
    var body: some View {
        ZStack(alignment: .leading) {
            if starWar.image != nil  {
                KFImage.url(URL(string: starWar.image!))
                    .setProcessor(processor)
                    .placeholder{(placeholder.starWarImageStyle())}
                    .resizable()
                    .cornerRadius(10)
                    .brightness(-0.15)
            }else {
                Image("placeholder")
                    .starWarImageStyle()
            }
            StarWarInfo(starWar: starWar)
                .padding()
        }
        .aspectRatio(1.6, contentMode: .fit)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
