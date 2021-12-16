//
//  ContentView.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI
import CoreData

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StarWarViewModel()
    
    var body: some View {
        ContentRow(starWar: self.viewModel.storedStarWars)
            .onAppear {
                self.viewModel.getStarWarList()
            }
            .alert(isPresented: $viewModel.showAlert) { () -> Alert in
                Alert(title: Text(viewModel.alertMessage), message: Text("Please enable WIFI or Cellular data"), dismissButton: .default(Text("Okay")))
            }
    }
}

