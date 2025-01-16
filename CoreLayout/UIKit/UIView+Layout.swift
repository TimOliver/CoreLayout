//
//  UIView+Layout.swift
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

import UIKit

// swiftlint:disable identifier_name

// MARK: - Basic Geometry -

/// A collection of convenience properties and methods
/// to help simplify and streamline configuring, sizing and laying out views
public extension UIView {

    /// The X position of this view in points
    var x: CGFloat {
        get { frame.minX }
        set { frame.origin.x = newValue }
    }

    /// The Y position of this view in points
    var y: CGFloat {
        get { frame.minY }
        set { frame.origin.y = newValue }
    }

    /// The position of this view in its superview's coordinates
    var origin: CGPoint {
        get { frame.origin }
        set { frame.origin = newValue }
    }

    /// The width of this view in points
    var width: CGFloat {
        get { frame.width }
        set { frame.size.width = newValue }
    }

    /// The height of this view in points
    var height: CGFloat {
        get { frame.height }
        set { frame.size.height = newValue }
    }

    /// The width and height size of this view
    var size: CGSize {
        get { frame.size }
        set { frame.size = newValue }
    }
}

// MARK: - Positioning -

extension UIView {

    /// The position of the top left corner of this rectangle
    var topLeft: CGPoint {
        get { return frame.topLeft }
        set { frame.topLeft = newValue }
    }

    /// The position of the middle of the top edge of this rectangle
    var topCenter: CGPoint {
        get { return frame.topCenter }
        set { frame.topCenter = newValue }
    }

    /// The position of the top right corner of this rectangle
    var topRight: CGPoint {
        get { return frame.topRight }
        set { frame.topRight = newValue }
    }

    /// The position of the middle of the left-hand edge of this rectangle
    var centerLeft: CGPoint {
        get { return frame.centerLeft }
        set { frame.centerLeft = newValue }
    }

    /// The position of the middle of the rectangle
    var center: CGPoint {
        get { return frame.center }
        set { frame.center = newValue }
    }

    /// The position of the middle of the right-hand edge of this rectangle
    var centerRight: CGPoint {
        get { return frame.centerRight }
        set { frame.centerRight = newValue }
    }

    /// The position of the bottom left of this rectangle
    var bottomLeft: CGPoint {
        get { return frame.bottomLeft }
        set { frame.bottomLeft = newValue }
    }

    /// The position of the middle of the bottom edge of this rectangle
    var bottomCenter: CGPoint {
        get { return frame.bottomCenter }
        set { frame.bottomCenter = newValue }
    }

    /// The position of the bottom right corner of this rectangle
    var bottomRight: CGPoint {
        get { return frame.bottomRight }
        set { frame.bottomRight = newValue }
    }
}

// MARK: - Semantic Positioning -

extension UIView {

    /// The position of this view from its top, leading position
    /// (Top-left by default, top-right in RTL layouts)
    var topLeading: CGPoint {
        get { frame.topLeading }
        set { frame.topLeading = newValue }
    }

    /// The position of this view from its top, trailing position
    /// (Top-right by default, top-left in RTL layouts)
    var topTrailing: CGPoint {
        get { frame.topTrailing }
        set { frame.topTrailing = newValue }
    }

    /// The position of this view from its top, leading position
    /// (Top-left by default, top-right in RTL layouts)
    var centerLeading: CGPoint {
        get { frame.centerLeading }
        set { frame.centerLeading = newValue }
    }

    /// The position of this view from its top, trailing position
    /// (Top-right by default, top-left in RTL layouts)
    var centerTrailing: CGPoint {
        get { frame.centerTrailing }
        set { frame.centerTrailing = newValue }
    }

    /// The position of this view from its top, leading position
    /// (Top-left by default, top-right in RTL layouts)
    var bottomLeading: CGPoint {
        get { frame.bottomLeading }
        set { frame.bottomLeading = newValue }
    }

    /// The position of this view from its top, trailing position
    /// (Top-right by default, top-left in RTL layouts)
    var bottomTrailing: CGPoint {
        get { frame.bottomTrailing }
        set { frame.bottomTrailing = newValue }
    }
}

// MARK: - Translation & Transformation -

extension UIView {

    /// Offsets the position of the view.
    /// - Parameters:
    ///   - x: The offset value of the X position
    ///   - y: The offset value of the Y position
    func offsetBy(dx: CGFloat = 0.0, dy: CGFloat = 0.0) {
        frame = frame.offsetBy(dx: dx, dy: dy)
    }

    /// Offset the position of the view from its leading position
    /// (eg, the left side by default, the right side on RtL layouts)
    func leadingOffsetBy(dx: CGFloat = 0.0, dy: CGFloat = 0.0) {
        frame.origin = origin.leadingOffsetBy(dx: dx, dy: dy)
    }

    /// Scales the view independently in both directions
    /// - Parameter dw: The fraction to scale the width
    /// - Parameter dh: The fraction to scale the height
    func scaleBy(dw: CGFloat = 1.0, dh: CGFloat = 1.0) {
        frame.size.width *= dw
        frame.size.height *= dh
    }

    /// Scales the view consistently in both directions
    /// - Parameter scale: The scale fraction to apply (1.0 is default)
    func scaleBy(_ scale: CGFloat = 1.0) {
        frame.size.width *= scale
        frame.size.height *= scale
    }
}

// MARK: - Layout Margins -

public extension UIView {

    /// Returns the combined width of the horizontal layout margins
    var layoutMarginsWidth: CGFloat { layoutMargins.width }

    /// Returns the combined height of the vertical layout margins
    var layoutMarginsHeight: CGFloat { layoutMargins.height }
}

// MARK: - Corner Radius -

public extension UIView {

    /// The rounded corner radius of this view.
    /// Automatically applies Apple's continuous rounding style at the same time.
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerCurve = .continuous; layer.cornerRadius = newValue }
    }

    /// Apply an appropriate corner radius in relation to provided view's distance and radius
    func applyCornerRadius(relativeTo view: UIView) {
        let distance = min(self.x - view.bounds.minX, self.y - view.bounds.minY)
        cornerRadius = view.cornerRadius - distance
    }
}

// swiftlint:enable identifier_name
