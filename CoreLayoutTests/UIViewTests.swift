//
//  UIViewTests.swift
//  SpackleTests
//
//  Created by Tim Oliver on 15/5/2022.
//

import XCTest
@testable import CoreLayoutExample

class UIViewTests: XCTestCase {

    func testGeometry() {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))

        // Basic geometry
        XCTAssertEqual(view.x, 10)
        XCTAssertEqual(view.y, 10)
        XCTAssertEqual(view.width, 100)
        XCTAssertEqual(view.height, 100)

        // Dimensions
        XCTAssertEqual(view.origin, CGPoint(x: 10, y: 10))
        XCTAssertEqual(view.size, CGSize(width: 100, height: 100))
    }

    func testViewCorners() throws {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))

        // Outer corners
        XCTAssertEqual(view.topLeft, CGPoint(x: 10, y: 10))
        XCTAssertEqual(view.topRight, CGPoint(x: 110, y: 10))
        XCTAssertEqual(view.bottomLeft, CGPoint(x: 10, y: 110))
        XCTAssertEqual(view.bottomRight, CGPoint(x: 110, y: 110))

        // Middle edges
        XCTAssertEqual(view.topCenter, CGPoint(x: 60, y: 10))
        XCTAssertEqual(view.centerRight, CGPoint(x: 110, y: 60))
        XCTAssertEqual(view.centerLeft, CGPoint(x: 10, y: 60))
        XCTAssertEqual(view.bottomCenter, CGPoint(x: 60, y: 110))
    }

    func testSemanticViewCorners() throws {
        // Forcefully set our environment to the default left-to-right
        CGPoint.setIsRightToLeftLayoutDirection(false)

        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))

        // Outer corners
        XCTAssertEqual(view.topLeading, CGPoint(x: 10, y: 10))
        XCTAssertEqual(view.topTrailing, CGPoint(x: 110, y: 10))
        XCTAssertEqual(view.bottomLeading, CGPoint(x: 10, y: 110))
        XCTAssertEqual(view.bottomTrailing, CGPoint(x: 110, y: 110))

        // Middle edges
        XCTAssertEqual(view.topCenter, CGPoint(x: 60, y: 10))
        XCTAssertEqual(view.centerTrailing, CGPoint(x: 110, y: 60))
        XCTAssertEqual(view.centerLeading, CGPoint(x: 10, y: 60))
        XCTAssertEqual(view.bottomCenter, CGPoint(x: 60, y: 110))

        // Forcefully set our environment to be flipped
        CGPoint.setIsRightToLeftLayoutDirection(true)

        // Outer corners
        XCTAssertEqual(view.topLeading, CGPoint(x: 110, y: 10))
        XCTAssertEqual(view.topTrailing, CGPoint(x: 10, y: 10))
        XCTAssertEqual(view.bottomLeading, CGPoint(x: 110, y: 110))
        XCTAssertEqual(view.bottomTrailing, CGPoint(x: 10, y: 110))

        // Middle edges
        XCTAssertEqual(view.topCenter, CGPoint(x: 60, y: 10))
        XCTAssertEqual(view.centerTrailing, CGPoint(x: 10, y: 60))
        XCTAssertEqual(view.centerLeading, CGPoint(x: 110, y: 60))
        XCTAssertEqual(view.bottomCenter, CGPoint(x: 60, y: 110))
    }

    func testOffsetting() {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))

        // Test positive offset
        view.offsetBy(dx: 10, dy: 10)
        XCTAssertEqual(view.origin, CGPoint(x: 20, y: 20))

        view.offsetBy(dx: -5, dy: -5)
        XCTAssertEqual(view.origin, CGPoint(x: 15, y: 15))
    }

    func testSemanticOffsetting() {
        // Forcefully set our environment to the default left-to-right
        CGPoint.setIsRightToLeftLayoutDirection(false)

        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))

        // Test positive offset
        view.leadingOffsetBy(dx: 10, dy: 10)
        XCTAssertEqual(view.origin, CGPoint(x: 20, y: 20))

        view.leadingOffsetBy(dx: -5, dy: -5)
        XCTAssertEqual(view.origin, CGPoint(x: 15, y: 15))

        // Forcefully set our environment to be flipped
        CGPoint.setIsRightToLeftLayoutDirection(true)

        // Reset the position
        view.origin = CGPoint(x: 10, y: 10)

        // Test positive offset
        view.leadingOffsetBy(dx: 10, dy: 10)
        XCTAssertEqual(view.origin, CGPoint(x: 0, y: 20))

        view.leadingOffsetBy(dx: -5, dy: -5)
        XCTAssertEqual(view.origin, CGPoint(x: 5, y: 15))
    }
}
