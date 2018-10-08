//
//  PDFGraphics_iOSTests.swift
//  PDFGraphics-iOSTests
//
//  Created by HASHIMOTO Wataru on 2018/10/08.
//  Copyright © 2018 HASHIMOTO Wataru. All rights reserved.
//

import XCTest
@testable import PDFGraphics

class PDFGraphics_iOSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testZeroSize() {
        let data = PDFGraphics(with: CGSize.zero, render: {_ in })
        XCTAssertNotNil(data)
    }

}
