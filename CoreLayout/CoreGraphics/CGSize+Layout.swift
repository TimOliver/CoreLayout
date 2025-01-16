//
//  CGSize+Layout.swift
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

// MARK: - Aspect Sizing -

extension CGSize {

    /// Returns a size of the same aspect ratio, but scaled up or down
    /// to completely fit inside the requested size.
    /// - Parameters:
    ///   - size: The size to fit the current size to
    ///   - upscale: Whether the size can be larger than the current size,
    ///              or capped at the current size
    /// - Returns: The final size, scaled down to fit the requested size.
    public func fittingSize(_ size: CGSize, upscale: Bool = true) -> CGSize {
        // In order to fit the size, we need the smaller scale
        let scale = min(size.width / self.width, size.height / self.height)

        // If the scale was larger than 1 (ie upscaling),
        // and we explicitly don't want that, just return the original size
        if !upscale && scale > 1.0 + .ulpOfOne { return self }

        // Multiply this size by the scale
        return CGSize(width: ceil(self.width * scale),
                      height: ceil(self.height * scale))
    }

    /// Returns a size of the same aspect ratio, but scaled up or down
    /// to fill the bounds of the requested size, with overflow.
    /// - Parameters:
    ///   - size: The size to fill the current size to
    ///   - upscale: Whether the size can be larger than the current size,
    ///              or capped at the current size
    /// - Returns: The final size, scaled down to fill the requested size.
    public func fillingSize(_ size: CGSize, upscale: Bool = true) -> CGSize {
        // In order to fill the size, we need the larger scale
        let scale = max(size.width / self.width, size.height / self.height)

        // If the scale was larger than 1 (ie upscaling),
        // and we explicitly don't want that, just return the original size
        if !upscale && scale > 1.0 + .ulpOfOne { return self }

        // Multiply this size by the scale
        return CGSize(width: ceil(self.width * scale),
                      height: ceil(self.height * scale))
    }
}

// MARK: - Convenience Initializers -

extension CGSize {

    /// Creates a new size struct with equal width and height
    /// - Parameter size: The value for both width and height
    static func box(size: CGFloat) -> CGSize {
        CGSize(width: size, height: size)
    }
}
