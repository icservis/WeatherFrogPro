//
//  Sidebar - SidebarInteractorTests.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

@testable import WeatherFrogPro
import Quick
import Nimble

class SidebarInteractorTests: QuickSpec {
    override func spec() {
        describe("Sidebar interactor") {
            var interactor: SidebarInteractor!
            var presenter: MockPresenter!
            beforeEach {
                interactor = SidebarInteractor()
                presenter = MockPresenter()
                interactor.output = presenter
            }
        }
    }

    class MockPresenter: SidebarInteractorOutput {
    }
}
