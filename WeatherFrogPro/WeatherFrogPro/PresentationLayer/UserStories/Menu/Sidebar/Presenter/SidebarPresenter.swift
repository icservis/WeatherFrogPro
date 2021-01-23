//
//  Sidebar - SidebarPresenter.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

class SidebarPresenter {
    weak var output: SidebarModuleOutput?
    weak var view: SidebarViewInput?
    var interactor: SidebarInteractorInput
    var router: SidebarRouterInput

    init(interactorInput interactor: SidebarInteractorInput,
         routerInput router: SidebarRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension SidebarPresenter: SidebarModuleInput {
}

extension SidebarPresenter: SidebarViewOutput {
    func viewIsReady() {
    }
}

extension SidebarPresenter: SidebarInteractorOutput {
}
