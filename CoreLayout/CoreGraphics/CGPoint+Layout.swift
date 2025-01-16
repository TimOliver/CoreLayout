//
//  CGPoint+Layout.swift
//
//  Copyright 2022-2024 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import CoreGraphics
import UIKit

// swiftlint:disable identifier_name

// MARK: - Translations -

public extension CGPoint {

    /// Returns an offset of this point by separate X and Y values
    /// - Parameters:
    ///   - x: The number of points to offset the X value
    ///   - y: The number of points to offset the Y value
    func offsetBy(dx: CGFloat = 0.0, dy: CGFloat = 0.0) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }

    /// Returns an offset of this point with the same length for both X and Y
    /// - Parameters:
    ///   - length: The length in points for both X and Y to offset this point
    func offsetBy(_ length: CGFloat) -> CGPoint {
        return CGPoint(x: x + length, y: y + length)
    }

    /// Returns an offset of this point by separate X and Y values, while also
    /// semantically adjusting for right-to-left UI environments
    /// - Parameters:
    ///   - x: The number of points to offset the X value
    ///   - y: The number of points to offset the Y value
    func leadingOffsetBy(dx: CGFloat = 0.0, dy: CGFloat = 0.0) -> CGPoint {
        var output = CGPoint.zero
        output.y = self.y + dy
        output.x = self.x + (CGPoint.isRightToLeftLayoutDirection ? -dx : dx)
        return output
    }

    /// Returns an offset of this point with the same length for both X and Y values,
    /// while also semantically adjusting for right-to-left UI environments
    /// - Parameters:
    ///   - length: The length in points for both X and Y to offset this point
    func leadingOffsetBy(_ length: CGFloat) -> CGPoint {
        var output = CGPoint.zero
        output.y = self.y + length
        output.x = self.x + (CGPoint.isRightToLeftLayoutDirection ? -length : length)
        return output
    }
}

// MARK: - Private State -

internal extension CGPoint {

    /// Lazily loads and returns whether the current UI
    /// environment is flipped for specific languages or not
    static var isRightToLeftLayoutDirection: Bool {
        if let isRTL = _isRightToLeftLayoutDirection {
            return isRTL
        }
        let isRTL = (UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft)
        _isRightToLeftLayoutDirection = isRTL
        return isRTL
    }

    /// For unit testing purposes, override the singleton value
    /// and inject an explicit value
    static func _setIsRightToLeftLayoutDirection(_ isRTL: Bool?) {
        _isRightToLeftLayoutDirection = isRTL
    }
}

var _isRightToLeftLayoutDirection: Bool?
