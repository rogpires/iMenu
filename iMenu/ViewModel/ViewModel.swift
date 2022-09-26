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
    
    var loadMonitor = SystemLoadMonitor() //monitor cpu
}
