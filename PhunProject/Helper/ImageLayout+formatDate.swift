//
//  ImageLayout.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/21/21.
//

import Foundation
import SwiftUI

extension Image{
    func starWarImageStyle() -> some View {
        self.resizable()
            .cornerRadius(10)
            .brightness(-0.15)
    }
    
    func starWarDetailImageStyle() -> some View {
        self.resizable()
            .edgesIgnoringSafeArea(.all)
    }
}

func formatStringDate(date: String) -> String {
    let dateFormatter = DateFormatter()
    let newDate: Date?
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    if dateFormatter.date(from: date) != nil {
        newDate = dateFormatter.date(from: date)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy, h:mm a")
    }else {
        return date
    }
    return dateFormatter.string(from: newDate!)
}
