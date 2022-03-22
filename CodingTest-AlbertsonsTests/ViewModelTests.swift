//
//  ViewModelTests.swift
//  CodingTest-AlbertsonsTests
//
//  Created by Ram on 22/03/22.
//

import XCTest
@testable import CodingTest_Albertsons

class ViewModelTests: XCTestCase {

    fileprivate var viewModel: ViewModel!
    var tableView: UITableView!

    override func setUp() {
        super.setUp()
        viewModel = ViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testAcrominesListCount() {
        XCTAssertEqual(viewModel.acrominesList.count, 0)
    }
}
