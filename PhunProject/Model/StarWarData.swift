//
//  StarWarData.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation

struct StarWarData: Decodable, Hashable, Identifiable{
    
    let id: Int16
    let starWarExplaination: String?
    let title: String?
    let timestamp: String?
    let image: String?
    let date: String?
    let firstlocationline: String?
    let secondlocationline: String?
    
    enum CodingKeys: String, CodingKey {
       case id
       case starWarExplaination = "description"
       case title
       case timestamp
       case image
       case date
       case firstlocationline = "locationline1"
       case secondlocationline = "locationline2"
   }
    
    init(id: Int16, description: String?, title: String?, timestamp: String?, image: String?, date: String?, locationline1: String?, locationline2: String?){
        self.id = id
        self.starWarExplaination = description
        self.title = title
        self.timestamp = timestamp
        self.image = image
        self.date = date
        self.firstlocationline = locationline1
        self.secondlocationline = locationline2
        }
}
