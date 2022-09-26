//
//  ViewModel.swift
//  iMenu
//
//  Created by Rogerio Pires on 26/09/22.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    @Published var vm: [ViewModel] = []
    
    ///Monitor CPU
    var loadMonitor = SystemLoadMonitor()
}
