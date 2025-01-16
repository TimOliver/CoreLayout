//
//  CGSizeTests.swift
//  SpackleTests
//
//  Created by Tim Oliver on 15/5/2022.
//

import XCTest
@testable import CoreLayoutExample

class CGSizeTests: XCTestCase {

    func testAspectFit() {

        // Set a default size
        let size = CGSize(width: 500, height: 800)

        // Test scaling down to fit
        XCTAssertEqual(size.fittingSize(CGSize(width: 160, height: 230)),
                       CGSize(width: 144, height: 230))

        // Test scaling up without the limiter
        XCTAssertEqual(size.fittingSize(CGSize(width: 2000, height: 2000), upscale: true),
                       CGSize(width: 1250, height: 2000))

        // Test scaling up with the limiter
        XCTAssertEqual(size.fittingSize(CGSize(width: 2000, height: 2000), upscale: false),
                       CGSize(width: 500, height: 800))
    }

    func testAspectFill() {

        // Set a default size
        let size = CGSize(width: 500, height: 800)

        // Test scaling down to fill
        XCTAssertEqual(size.fillingSize(CGSize(width: 160, height: 230)),
                       CGSize(width: 160, height: 256))

        // Test scaling up without the limiter
        XCTAssertEqual(size.fillingSize(CGSize(width: 2000, height: 2000), upscale: true),
                       CGSize(width: 2000, height: 3200))

        // Test scaling up with the limiter
        XCTAssertEqual(size.fillingSize(CGSize(width: 2000, height: 2000), upscale: false),
                       CGSize(width: 500, height: 800))
    }
}
