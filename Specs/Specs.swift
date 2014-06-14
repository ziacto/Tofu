//
//  Specs.swift
//  Specs
//
//  Created by Robert Böhnke on 11/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import XCTest

import Tofu

class Specs: XCTestCase {
    func testExample() {
        expect(1).to.equal(1)

        expect(1).notTo.equal(10)
    }
}
