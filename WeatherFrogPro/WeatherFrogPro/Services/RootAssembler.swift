//
//  RootAssembler.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 03.10.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import Foundation
import Swinject

class RootAssembler {
    let assembler: Assembler
    init() {
        assembler = Assembler([
            DataManagerAssembly(),
            ConfiguratorAssembly()
            ])
    }
}

private class DataManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataProviding.self) { _ in
            return DataManager.shared
        }
    }
}

private class ConfiguratorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ConfigProviding.self) { _ in
            return Configurator.shared
        }
    }
}
