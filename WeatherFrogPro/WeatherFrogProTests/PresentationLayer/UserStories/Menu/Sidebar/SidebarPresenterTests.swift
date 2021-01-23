//
//  Sidebar - SidebarPresenterTests.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

@testable import WeatherFrogPro
import Quick
import Nimble

class SidebarPresenterTest: QuickSpec {
    override func spec() {
        describe("Sidebar presenter") {
            var presenter: SidebarPresenter!
            var view: MockViewController!
            var interactor: MockInteractor!
            var router: MockRouter!
            beforeEach {
                interactor = MockInteractor()
                router = MockRouter()
                view = MockViewController()
                presenter = SidebarPresenter(interactorInput: interactor, routerInput: router)
                presenter.view = view
            }
        }
    }

    class MockInteractor: SidebarInteractorInput {
    }

    class MockRouter: SidebarRouterInput {
    }

    class MockViewController: SidebarViewInput {
        var didCallSetupInitialState = false
        func setupInitialState() {
            didCallSetupInitialState = true
        }
    }
}
