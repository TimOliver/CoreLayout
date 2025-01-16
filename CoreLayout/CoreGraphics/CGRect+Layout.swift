//
//  CGRect+Layout.swift
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

// MARK: - Corner & Edge Positions -

// A collection of extensions for accessing
// explicit corners of a rectangle in the system XY space
public extension CGRect {

    /// The position of the top left corner of this rectangle
    var topLeft: CGPoint {
        get { return CGPoint(x: minX, y: minY) }
        set { origin = newValue }
    }

    /// The position of the middle of the top edge of this rectangle
    var topCenter: CGPoint {
        get { return CGPoint(x: midX, y: minY) }
        set { origin = newValue; origin.x -= (width * 0.5) }
    }

    /// The position of the top right corner of this rectangle
    var topRight: CGPoint {
        get { return CGPoint(x: maxX, y: minY) }
        set { origin = newValue; origin.x -= width }
    }

    /// The position of the middle of the left-hand edge of this rectangle
    var centerLeft: CGPoint {
        get { return CGPoint(x: minX, y: midY) }
        set { origin = newValue; origin.y -= (height * 0.5) }
    }

    /// The position of the middle of the rectangle
    var center: CGPoint {
        get { return CGPoint(x: midX, y: midY) }
        set {
            origin = CGPoint(x: newValue.x - (width * 0.5),
                             y: newValue.y - (height * 0.5))
        }
    }

    /// The position of the middle of the right-hand edge of this rectangle
    var centerRight: CGPoint {
        get { return CGPoint(x: maxX, y: midY) }
        set {
            origin = CGPoint(x: newValue.x - width,
                             y: newValue.y - (height * 0.5))
        }
    }

    /// The position of the bottom left of this rectangle
    var bottomLeft: CGPoint {
        get { return CGPoint(x: minX, y: maxY) }
        set { origin = newValue; origin.y -= height }
    }

    /// The position of the middle of the bottom edge of this rectangle
    var bottomCenter: CGPoint {
        get { return CGPoint(x: midX, y: maxY) }
        set {
            origin = CGPoint(x: newValue.x - (width * 0.5),
                             y: newValue.y - height)
        }
    }

    /// The position of the bottom right corner of this rectangle
    var bottomRight: CGPoint {
        get { return CGPoint(x: maxX, y: maxY) }
        set {
            origin = CGPoint(x: newValue.x - width,
                             y: newValue.y - height)
        }
    }
}

// MARK: - Semantic Positions -

// A collection of extensions for accessing
// semantic corners of a rectangle that will change in right-to-left environments
extension CGRect {

    /// The position of the top leading corner of this rectangle
    /// (Top left by default, top right in RTL languages)
    var topLeading: CGPoint {
        get { CGPoint.isRightToLeftLayoutDirection ? topRight : topLeft }
        set {
            if CGPoint.isRightToLeftLayoutDirection {
                topRight = newValue
            } else {
                topLeft = newValue
            }
        }
    }

    /// The position of the top leading corner of this rectangle
    /// (Top right by default, top left in RTL languages)
    var topTrailing: CGPoint {
        get { CGPoint.isRightToLeftLayoutDirection ? topLeft : topRight }
        set {
            if CGPoint.isRightToLeftLayoutDirection {
                topLeft = newValue
            } else {
                topRight = newValue
            }
        }
    }

    /// The position of the middle of the leading edge of this rectangle
    /// (Center left by default, center right in RTL languages)
    var centerLeading: CGPoint {
        get { CGPoint.isRightToLeftLayoutDirection ? centerRight : centerLeft }
        set {
            if CGPoint.isRightToLeftLayoutDirection {
                centerRight = newValue
            } else {
                centerLeft = newValue
            }
        }
    }

    /// The position of the top leading corner of this rectangle
    /// (Center right by default, center left in RTL languages)
    var centerTrailing: CGPoint {
        get { CGPoint.isRightToLeftLayoutDirection ? centerLeft : centerRight }
        set {
            if CGPoint.isRightToLeftLayoutDirection {
                centerLeft = newValue
            } else {
                centerRight = newValue
            }
        }
    }

    /// The position of the bottom leading corner of this rectangle
    /// (Bottom left by default, bottom right in RTL languages)
    var bottomLeading: CGPoint {
        get { CGPoint.isRightToLeftLayoutDirection ? bottomRight : bottomLeft }
        set {
            if CGPoint.isRightToLeftLayoutDirection {
                bottomRight = newValue
            } else {
                bottomLeft = newValue
            }
        }
    }

    /// The position of the top leading corner of this rectangle
    /// (Top left by default, top right in RTL languages)
    var bottomTrailing: CGPoint {
        get { CGPoint.isRightToLeftLayoutDirection ? bottomLeft : bottomRight }
        set {
            if CGPoint.isRightToLeftLayoutDirection {
                bottomLeft = newValue
            } else {
                bottomRight = newValue
            }
        }
    }
}
