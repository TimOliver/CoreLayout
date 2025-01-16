//
//  CGRect.swift
//  SpackleTests
//
//  Created by Tim Oliver on 15/5/2022.
//

import XCTest
@testable import CoreLayoutExample

class CGRectTests: XCTestCase {

    func testCorners() throws {
        // Define the rectangle
        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)

        // Outer corners
        XCTAssertEqual(rect.topLeft, CGPoint(x: 10, y: 10))
        XCTAssertEqual(rect.topRight, CGPoint(x: 110, y: 10))
        XCTAssertEqual(rect.bottomLeft, CGPoint(x: 10, y: 110))
        XCTAssertEqual(rect.bottomRight, CGPoint(x: 110, y: 110))

        // Middle edges
        XCTAssertEqual(rect.topCenter, CGPoint(x: 60, y: 10))
        XCTAssertEqual(rect.centerRight, CGPoint(x: 110, y: 60))
        XCTAssertEqual(rect.centerLeft, CGPoint(x: 10, y: 60))
        XCTAssertEqual(rect.bottomCenter, CGPoint(x: 60, y: 110))
    }

    func testSemanticCorners() throws {
        // Forcefully set our environment to the default left-to-right
        CGPoint.setIsRightToLeftLayoutDirection(false)

        // Define the rectangle
        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)

        // Outer corners
        XCTAssertEqual(rect.topLeading, CGPoint(x: 10, y: 10))
        XCTAssertEqual(rect.topTrailing, CGPoint(x: 110, y: 10))
        XCTAssertEqual(rect.bottomLeading, CGPoint(x: 10, y: 110))
        XCTAssertEqual(rect.bottomTrailing, CGPoint(x: 110, y: 110))

        // Middle edges
        XCTAssertEqual(rect.topCenter, CGPoint(x: 60, y: 10))
        XCTAssertEqual(rect.centerTrailing, CGPoint(x: 110, y: 60))
        XCTAssertEqual(rect.centerLeading, CGPoint(x: 10, y: 60))
        XCTAssertEqual(rect.bottomCenter, CGPoint(x: 60, y: 110))

        // Forcefully set our environment to be flipped
        CGPoint.setIsRightToLeftLayoutDirection(true)

        // Outer corners
        XCTAssertEqual(rect.topLeading, CGPoint(x: 110, y: 10))
        XCTAssertEqual(rect.topTrailing, CGPoint(x: 10, y: 10))
        XCTAssertEqual(rect.bottomLeading, CGPoint(x: 110, y: 110))
        XCTAssertEqual(rect.bottomTrailing, CGPoint(x: 10, y: 110))

        // Middle edges
        XCTAssertEqual(rect.topCenter, CGPoint(x: 60, y: 10))
        XCTAssertEqual(rect.centerTrailing, CGPoint(x: 10, y: 60))
        XCTAssertEqual(rect.centerLeading, CGPoint(x: 110, y: 60))
        XCTAssertEqual(rect.bottomCenter, CGPoint(x: 60, y: 110))
    }
}
