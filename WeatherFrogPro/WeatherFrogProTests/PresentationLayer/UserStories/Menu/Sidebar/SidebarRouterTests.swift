//
//  Sidebar - SidebarRouterTests.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

@testable import WeatherFrogPro
import Quick
import Nimble

class SidebarRouterTests: QuickSpec {
    override func spec() {
        describe("Sidebar router") {
            var router: SidebarRouter!
            var handler: MockSidebarTransitionHandler!
            beforeEach {
                handler = MockSidebarTransitionHandler()
                router = SidebarRouter()
                router.transitionHandler = handler
            }
        }
    }

    class MockSidebarTransitionHandler: MockTransitionHandler, SidebarTransitionHandler { }
}
