//
//  Sidebar - SidebarViewTests.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

@testable import WeatherFrogPro
import Quick
import Nimble

class SidebarViewTests: QuickSpec {
    override func spec() {
        describe("Sidebar view") {
            var view: SidebarViewController!
            var presenter: MockPresenter!
            beforeEach {
                presenter = MockPresenter()
                view = SidebarViewController(viewOutput: presenter)
            }
        }
    }

    class MockPresenter: SidebarViewOutput {
        var didCallViewIsReady = false
        func viewIsReady() {
            didCallViewIsReady = true
        }
    }
}
