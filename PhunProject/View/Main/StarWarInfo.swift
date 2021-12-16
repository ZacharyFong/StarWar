//
//  StarWarInfo.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI

struct StarWarInfo: View {
    let starWar: StarWarEntities
    
    var body: some View {
        GeometryReader(content: {geometry in
            VStack(alignment: .leading, spacing: 5) {
                Text(formatStringDate(date: starWar.date ?? ""))
                    .font(regularFont(in: geometry.size))
                    .fontWeight(.medium)
                Text(starWar.title ?? "")
                    .fontWeight(.bold)
                    .font(titleFont(in: geometry.size))
                    .minimumScaleFactor(0.7)
                    .padding(.vertical, DrawingConstants.fontPadding)
                    .lineLimit(1)
                (Text(starWar.firstlocationline ?? "")
                 + Text(", ")
                 + Text(starWar.secondlocationline ?? ""))
                    .font(regularFont(in: geometry.size))
                    .padding(.bottom, DrawingConstants.fontPadding)
                    .lineLimit(2)
                Text(starWar.story ?? "")
                    .font(regularFont(in: geometry.size))
                    .lineLimit(2)
            }
            .padding(5)
            .scaledToFit()
            .foregroundColor(.white)
            .brightness(2)
        })
    }
    
    private func regularFont(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.regularFontSize)
    }
    
    private func titleFont(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.titleFontSize)
    }
    
    private struct DrawingConstants {
        static let regularFontSize: CGFloat = 0.10
        static let titleFontSize: CGFloat = 0.18
        static let fontPadding: CGFloat = 5
    }
}
