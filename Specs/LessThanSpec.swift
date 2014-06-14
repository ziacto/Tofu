//
//  LessThanSpec.swift
//  Tofu
//
//  Created by Robert Böhnke on 14/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import XCTest

import Tofu

class LessThanSpec: XCTestCase {
    func testLessThan() {
        expect(1).to.beLessThan(2)
        expect("a").to.beLessThan("ab")
    }

    func testNotLessThan() {
        expect(1).notTo.beLessThan(1)
        expect("a").notTo.beLessThan("a")
    }
}
