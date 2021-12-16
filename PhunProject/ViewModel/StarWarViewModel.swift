//
//  ViewModel.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation
import Combine
import SwiftUI

class StarWarViewModel: ObservableObject, StarWarService {
    
    internal var apiSession: APIService
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var showAlert = false
    
    // Load for storage
    @Published var storedStarWars = DatabaseManager.shared.fetchAllStarWarItems()
    
    var alertMessage = "Unknown error"
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getStarWarList() {
        let cancellable = self.getStarWarList()
            .sink(receiveCompletion: {[weak self] result in
                switch result {
                case .failure:
                    self?.alertMessage =  "No Internet Connection"
                    self?.showAlert = true
                case .finished:
                    break
                }
            }) { (starwars) in
                // Store into storage
                DatabaseManager.shared.addStarWarListItems(starwars)
                // Set from storage
                self.storedStarWars = DatabaseManager.shared.fetchAllStarWarItems()
        }
        cancellables.insert(cancellable)
    }
}
