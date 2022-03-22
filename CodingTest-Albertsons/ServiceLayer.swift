//
//  ServiceLayer.swift
//  CodingTest-Albertsons
//
//  Created by Ram on 21/03/22.
//

import Foundation

struct AcromineLoader {

    @discardableResult
    static func loadAcromines(from url: URL) async throws -> Acromines {
        let (data, _) = try await URLSession.shared.data(from: url)
        let acromines = try  JSONDecoder().decode(Acromines.self, from: data)
        return acromines
    }
}
