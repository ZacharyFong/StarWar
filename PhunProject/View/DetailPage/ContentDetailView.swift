//
//  ContentDetailView.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI
import Kingfisher

struct ContentDetailView: View {
    
    let starWar: StarWarEntities
    
    let processor = RoundCornerImageProcessor(cornerRadius: 20)
    let placeholder = Image("placeholder")
    
    var body: some View {
        GeometryReader(content: {geometry in
            ZStack(alignment: .center) {
                if starWar.image != nil {
                    KFImage.url(URL(string: starWar.image!))
                        .resizable()
                        .setProcessor(processor)
                        .placeholder{(placeholder.starWarDetailImageStyle())}
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geometry.size.width, height: geometry.size.width / 16 * 12)
                }else {
                    Image("placeholder")
                        .starWarDetailImageStyle()
                        .frame(width: geometry.size.width, height: geometry.size.width / 16 * 12)
                }
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color(UIColor.black).opacity(0.01), location: 0),
                            .init(color: Color(UIColor.black), location: 1)
                        ]), startPoint: .top, endPoint: .bottom)
                    )
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width)
                    .frame(maxWidth: .infinity, alignment: .bottom)
            }
            .fixedSize(horizontal: false, vertical: true)
            DetailViewInfo(starWar: starWar)
                .padding()
        }).background(.black)
    }
}
