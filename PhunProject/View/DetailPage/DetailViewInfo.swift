//
//  DetailViewInfo.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/21/21.
//

import SwiftUI

struct DetailViewInfo: View {
    
    let starWar: StarWarEntities
    
    var body: some View {
        GeometryReader(content: {geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    Text(formatStringDate(date: starWar.date ?? ""))
                        .font(regularFont(in: geometry.size))
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(starWar.title ?? "")
                        .fontWeight(.bold)
                        .font(titleFont(in: geometry.size))
                        .minimumScaleFactor(0.7)
                        .padding(.top, DrawingConstants.fontPadding)
                        .padding(.bottom, 30)
                        .fixedSize(horizontal: false, vertical: true)
                    (Text(starWar.firstlocationline ?? "")
                     + Text(", ")
                     + Text(starWar.secondlocationline ?? ""))
                        .font(regularFont(in: geometry.size))
                        .padding(.bottom, DrawingConstants.fontPadding)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(starWar.story ?? "")
                        .font(regularFont(in: geometry.size))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(20)
                .scaledToFit()
                .foregroundColor(.white)
                .brightness(2)
            }
        })
    }
    
    private func regularFont(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.regularFontSize)
    }
    
    private func titleFont(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.titleFontSize)
    }
    
    private struct DrawingConstants {
        static let regularFontSize: CGFloat = 0.05
        static let titleFontSize: CGFloat = 0.10
        static let fontPadding: CGFloat = 10
    }
}
