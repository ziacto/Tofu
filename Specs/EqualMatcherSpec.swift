//
//  EqualMatcherSpec.swift
//  Specs
//
//  Created by Robert Böhnke on 11/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import XCTest

import Tofu

class EqualMatcherSpec: XCTestCase {
    func testEqual() {
        expect(1).to.equal(1)
        expect("a").to.equal("a")
    }

    func testNotEqual() {
        expect(1).notTo.equal(10)
        expect("a").notTo.equal("ab")
    }
}
