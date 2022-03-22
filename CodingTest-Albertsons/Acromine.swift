//
//  Acromine.swift
//  CodingTest-Albertsons
//
//  Created by Ram on 21/03/22.
//

import Foundation


// MARK: - Acromine
struct Acromine: Codable {
    let sf: String?
    let lfs: [AcromineElement]?
}

// MARK: - AcromineElement
struct AcromineElement: Codable {
    let lf: String?
    let freq, since: Int?
    let vars: [AcromineElement]?
}

typealias Acromines = [Acromine]
