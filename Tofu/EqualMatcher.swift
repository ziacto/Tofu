//
//  EqualMatcher.swift
//  Tofu
//
//  Created by Robert Böhnke on 14/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct EqualMatcher<M: Equatable> : Matcher {
    let expected: M

    init(expected: M) {
        self.expected = expected
    }

    func resolve(x: Any) -> LogicValue {
        if let eq = x as? M {
            return eq == self.expected
        }

        return false
    }

    func message(value: Any, negated: Bool) -> String {
        if negated {
            return "Expected \(value) not to equal \(self.expected)"
        } else {
            return "Expected \(value) to equal \(self.expected)"
        }
    }
}

extension Expectation {
    func equal<T: Equatable>(expected: T) {
        self.match(EqualMatcher(expected: expected))
    }
}
