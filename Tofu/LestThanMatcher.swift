//
//  LestThanMatcher.swift
//  Tofu
//
//  Created by Robert Böhnke on 14/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct LessThanMatcher<M: Comparable> : Matcher {
    let expected: M

    init(expected: M) {
        self.expected = expected
    }

    func resolve(x: Any) -> LogicValue {
        if let eq = x as? M {
            return eq < self.expected
        }

        return false
    }

    func message(value: Any, negated: Bool) -> String {
        if negated {
            return "Expected \(value) not to be less than \(self.expected)"
        } else {
            return "Expected \(value) to be less than \(self.expected)"
        }
    }
}

extension Expectation {
    func beLessThan<T: Comparable>(expected: T) {
        self.match(LessThanMatcher(expected: expected))
    }
}
