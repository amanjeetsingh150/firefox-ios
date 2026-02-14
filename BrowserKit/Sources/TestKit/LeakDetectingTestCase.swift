// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import XCTest
import XCTestLeaksClient

open class LeakDetectingTestCase: XCTestCase, LeakCheckable {
    override open class func setUp() {
        super.setUp()
        XCTestLeaksObserver.register()
    }

    open func leakCheckDidComplete(with result: LeaksResult) {
        for leak in result.leaks {
            print("Leak: \(leak.rootTypeName ?? "Unknown") (\(leak.leakType))")
        }
    }
}