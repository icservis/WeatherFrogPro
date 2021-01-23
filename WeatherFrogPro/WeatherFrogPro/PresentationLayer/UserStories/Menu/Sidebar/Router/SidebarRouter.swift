//
//  Sidebar - SidebarRouter.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

import Swinject

class SidebarRouter: SidebarRouterInput {
    weak var transitionHandler: SidebarTransitionHandler?
    var assembler: Assembler?
}
