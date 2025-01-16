//
//  CGPointTests.swift
//  SpackleTests
//
//  Created by Tim Oliver on 15/5/2022.
//

import XCTest
@testable import CoreLayoutExample

class CGPointTests: XCTestCase {

    func testOffset() {
        let point = CGPoint(x: 50.0, y: 50.0)

        // Positive offsetting
        XCTAssertEqual(point.offsetBy(dx: 10, dy: 10),
                       CGPoint(x: 60, y: 60))

        // Negative offsetting
        XCTAssertEqual(point.offsetBy(dx: -10, dy: -10),
                       CGPoint(x: 40, y: 40))

        // Only X offset
        XCTAssertEqual(point.offsetBy(dx: 10),
                       CGPoint(x: 60, y: 50))

        // Only Y offset
        XCTAssertEqual(point.offsetBy(dy: 10),
                       CGPoint(x: 50, y: 60))
    }

    func testOffsetBy() {
        let point = CGPoint(x: 50.0, y: 50.0)

        // Positive offsetting
        XCTAssertEqual(point.offsetBy(10),
                       CGPoint(x: 60, y: 60))

        // Negative offsetting
        XCTAssertEqual(point.offsetBy(-10),
                       CGPoint(x: 40, y: 40))

    }

    func testLeadingOffset() {

        // Forcefully set our environment to the default left-to-right
        CGPoint.setIsRightToLeftLayoutDirection(false)

        // Define a dummy point
        let point = CGPoint(x: 50.0, y: 50.0)

        // Positive offsetting
        XCTAssertEqual(point.leadingOffsetBy(dx: 10, dy: 10),
                       CGPoint(x: 60, y: 60))

        // Negative offsetting
        XCTAssertEqual(point.leadingOffsetBy(dx: -10, dy: -10),
                       CGPoint(x: 40, y: 40))

        // Force the environment to flip directions
        CGPoint.setIsRightToLeftLayoutDirection(true)

        // Positive offsetting
        XCTAssertEqual(point.leadingOffsetBy(dx: 10, dy: 10),
                       CGPoint(x: 40, y: 60))

        // Negative offsetting
        XCTAssertEqual(point.leadingOffsetBy(dx: -10, dy: -10),
                       CGPoint(x: 60, y: 40))
    }

    func testLeadingOffsetBy() {

        // Forcefully set our environment to the default left-to-right
        CGPoint.setIsRightToLeftLayoutDirection(false)

        // Define a dummy point
        let point = CGPoint(x: 50.0, y: 50.0)

        // Positive offsetting
        XCTAssertEqual(point.leadingOffsetBy(10),
                       CGPoint(x: 60, y: 60))

        // Negative offsetting
        XCTAssertEqual(point.leadingOffsetBy(-10),
                       CGPoint(x: 40, y: 40))

        // Force the environment to flip directions
        CGPoint.setIsRightToLeftLayoutDirection(true)

        // Positive offsetting
        XCTAssertEqual(point.leadingOffsetBy(10),
                       CGPoint(x: 40, y: 60))

        // Negative offsetting
        XCTAssertEqual(point.leadingOffsetBy(-10),
                       CGPoint(x: 60, y: 40))
    }

}
