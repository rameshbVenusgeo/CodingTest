//
//  ViewModel.swift
//  CodingTest-Albertsons
//
//  Created by Ram on 21/03/22.
//

import Foundation
import Combine

private let urlString = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="

class ViewModel: ObservableObject {
    
    @Published var acrominesList: Acromines = []

    func getAcromineFor(searchString: String? = nil) {
        guard let inputString = searchString else {
            return
        }
        guard let url = URL(string: urlString + inputString) else {
            return
        }
        
        // async task start
        Task {
            do {
                // fetch acromines
                let acromines = try await AcromineLoader.loadAcromines(from: url)
                
                // update publisher
                acrominesList = acromines
            } catch {
                print("Request failed with error: \(error)")
            }
            
        }
    }
}
