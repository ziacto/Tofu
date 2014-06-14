//
//  Expectation.swift
//  Tofu
//
//  Created by Robert Böhnke on 11/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import XCTest

import Foundation

func expect <T>(closure: @auto_closure()-> T, _ file: String = __FILE__, line: Int = __LINE__) -> Expectation<T> {
    return Expectation(closure: closure, file: file, line: line)
}

protocol Matcher {
    func resolve(value: Any) -> LogicValue

    func message(value: Any, negated: Bool) -> String
}

class Expectation<T> {
    let closure: () -> T
    var value: T {
        get {
            return self.closure()
        }
    }

    let file: String
    let line: Int
    let negated: Bool

    var to: Expectation<T> {
        get {
            return self
        }
    }

    var notTo: Expectation<T> {
        get {
            return Expectation(closure: closure, file: file, line: line, negated: !negated)
        }
    }

    init(closure: () -> T, file: String, line: Int, negated: Bool = false) {
        self.closure = closure
        self.file = file
        self.line = line
        self.negated = negated
    }

    func match(matcher: Matcher) {
        if negated {
            XCTAssertFalse(matcher.resolve(value), matcher.message(value, negated: negated), file: file, line: line)
        } else {
            XCTAssertTrue(matcher.resolve(value), matcher.message(value, negated: negated), file: file, line: line)
        }
    }
}
