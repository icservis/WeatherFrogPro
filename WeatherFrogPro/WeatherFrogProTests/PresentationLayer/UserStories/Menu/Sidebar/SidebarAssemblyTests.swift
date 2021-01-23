//
//  Sidebar - SidebarAssemblyTests.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

@testable import WeatherFrogPro
import Swinject
import Quick
import Nimble

class SidebarAssemblyTests: QuickSpec {
    override func spec() {
        describe("Sidebar assembly") {
            context("separate registration") {
                var assembler: Assembler!
                var resolver: Resolver { return assembler.resolver }
                beforeEach {
                    assembler = SidebarModule.assemble(root: nil).assembler
                }
                it("register Interactor") {
                    expect({ resolver.resolve(SidebarInteractor.self) }).toNot(beNil())
                }
                it("register Interactor Input") {
                    expect({ resolver.resolve(SidebarInteractorInput.self) }).toNot(beNil())
                }
                it("register Router") {
                    expect({ resolver.resolve(SidebarRouter.self) }).toNot(beNil())
                }
                it("register Router Input") {
                    expect({ resolver.resolve(SidebarRouterInput.self) }).toNot(beNil())
                }
                it("register Presenter") {
                    expect({ resolver.resolve(SidebarPresenter.self) }).toNot(beNil())
                }
                it("register Module Input") {
                    expect({ resolver.resolve(SidebarModuleInput.self) }).toNot(beNil())
                }
                it("register Interactor Output") {
                    expect({ resolver.resolve(SidebarInteractorOutput.self) }).toNot(beNil())
                }
                it("register View Output") {
                    expect({ resolver.resolve(SidebarViewOutput.self) }).toNot(beNil())
                }
                it("register View") {
                    expect({ resolver.resolve(SidebarViewController.self) }).toNot(beNil())
                }
                it("register View Input") {
                    expect({ resolver.resolve(SidebarViewInput.self) }).toNot(beNil())
                }
            }
            context("full stack resolve") {
                var moduleOutput: SidebarModuleOutput!
                var module: SidebarModule!
                beforeEach {
                    moduleOutput = MockModuleOutput()
                    module = SidebarModule.assemble(root: nil, output: moduleOutput)
                }
                it("setup view in module") {
                    expect(module.view).toNot(beNil())
                }
                it("setup module input in module") {
                    expect(module.input).toNot(beNil())
                }
                it("resolve module input and presenter as same object") {
                    let presenter = module.view?.output as? SidebarPresenter
                    expect(presenter) === module.input
                }
                it("setup weak output for presenter") {
                    let presenter = module.view!.output as! SidebarPresenter
                    expect(presenter.output).toNot(beNil())
                }
                it("resolve presenter module output as mock object") {
                    let presenter = module.view!.output as! SidebarPresenter
                    expect(presenter.output) === moduleOutput
                }
                it("setup weak view for presenter") {
                    let presenter = module.view!.output as! SidebarPresenter
                    expect(presenter.view).toNot(beNil())
                }
                it("resolve presenter view and view as same object") {
                    let presenter = module.view!.output as! SidebarPresenter
                    expect(presenter.view) === module.view
                }
                it("setup weak interactor output") {
                    let presenter = module.view!.output as! SidebarPresenter
                    let interactor = presenter.interactor as! SidebarInteractor
                    expect(interactor.output).toNot(beNil())
                }
                it("resolve interactor output and presenter as same object") {
                    let presenter = module.view!.output as! SidebarPresenter
                    let interactor = presenter.interactor as! SidebarInteractor
                    expect(interactor.output) === presenter
                }
                it("setup router assembler") {
                    let presenter = module.view!.output as! SidebarPresenter
                    let router = presenter.router as! SidebarRouter
                    expect(router.assembler).toNot(beNil())
                }
                it("resolve router assembler and module assembler as same object") {
                    let presenter = module.view!.output as! SidebarPresenter
                    let router = presenter.router as! SidebarRouter
                    expect(router.assembler) === module.assembler
                }
                it("setup router transition handler") {
                    let presenter = module.view!.output as! SidebarPresenter
                    let router = presenter.router as! SidebarRouter
                    expect(router.transitionHandler).toNot(beNil())
                }
                it("resolve router transition handler and module view as same object") {
                    let presenter = module.view!.output as! SidebarPresenter
                    let router = presenter.router as! SidebarRouter
                    expect(router.transitionHandler) === module.view
                }
            }
        }
    }

    class MockModuleOutput: SidebarModuleOutput {
    }
}
