//
//  ViewControllerTests.swift
//  CodingTest-AlbertsonsTests
//
//  Created by Ram on 22/03/22.
//

import XCTest
@testable import CodingTest_Albertsons

class ViewControllerTests:  XCTestCase {
    
    var vc: ViewController? = nil
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        _ = vc?.view
        XCTAssertNotNil(vc?.acromineList)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }
    
    private func createSUT() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        return vc ?? ViewController()
    }
    
    func testView() {
        let sut = createSUT()
        XCTAssertNotNil(sut.view, "view doesn't exist")
    }
    
    func testTableView() {
        XCTAssertNotNil(vc?.acromineList, "tableview instance doesn't exist")
    }
    
    func testViewMOdel() {
        XCTAssertNotNil(vc?.viewModel, "viewmodel instance doesn't exist")
    }
    
    func testDataSourceElements() {
        XCTAssertEqual(vc?.dataSource.count, 0)
    }
}
