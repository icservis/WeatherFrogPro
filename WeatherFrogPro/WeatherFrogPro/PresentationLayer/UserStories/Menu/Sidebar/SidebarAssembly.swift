//
//  Sidebar - SidebarAssembly.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//
import Foundation
import Swinject

// swiftlint:disable force_cast line_length identifier_name
class SidebarModule {
    fileprivate(set) var assembler: Assembler?
    fileprivate(set) var view: SidebarViewController?
    weak fileprivate(set) var input: SidebarModuleInput?
    static func assemble(root: Assembler?, output: SidebarModuleOutput? = nil) -> SidebarModule {
        let assembler = Assembler([
            SidebarInteractorAssembly(),
            SidebarRouterAssembly(),
            SidebarPresenterAssembly(),
            SidebarViewAssembly(),
            SidebarModuleAssembly()
            ], parent: root)
        return assembler.resolver.resolve( SidebarModule.self, arguments: assembler, output )!
    }
}

private class SidebarInteractorAssembly: Assembly {
    func assemble(container: Container) {
    	// argument Bool if persists, means that need to create-only object,
    	// without resolving properties.
    	// used in SidebarModuleAssembly's `assemble(container:)`
    	// because there it resolving properties by self avoiding cycles
        container.register(SidebarInteractor.self) { (_, _: Bool) in
            return SidebarInteractor()
        }
        // If call resolve without argument
        // will automatically resolve properties at initCompleted
        container.register(SidebarInteractor.self) { r in
            return r.resolve( SidebarInteractor.self, argument: true )!
        }.initCompleted { r, interactor in
            interactor.output = r.resolve()
        }

        container.register(SidebarInteractorInput.self) { r in
            return r.resolve( SidebarInteractor.self )!
        }
    }
}

private class SidebarRouterAssembly: Assembly {
    func assemble(container: Container) {
        // argument Bool if persists, means that need to create-only object,
    	// without resolving properties.
    	// used in SidebarModuleAssembly's `assemble(container:)`
    	// because there it resolving properties by self avoiding cycles
        container.register(SidebarRouter.self) { (_, _: Bool) in
            return SidebarRouter()
        }
        // If call resolve without argument
        // will automatically resolve properties at initCompleted
        container.register(SidebarRouter.self) { r in
            return  r.resolve( SidebarRouter.self, argument: true )!
        }.initCompleted { (r, router) in
            router.transitionHandler = r.resolve()
        }

        container.register(SidebarRouter.self) { (r, assembler: Assembler) in
            let router = r.resolve(SidebarRouter.self)!
            router.assembler = assembler
            return router
        }

        container.register(SidebarRouterInput.self) { r in
            return r.resolve( SidebarRouter.self )!
        }
    }
}

private class SidebarPresenterAssembly: Assembly {
    func assemble(container: Container) {
    	// used in SidebarModuleAssembly's `assemble(container:)`
    	// because there it resolving properties by self avoiding cycles
        container.register(SidebarPresenter.self) { (_, output: SidebarModuleOutput?, interactorInput: SidebarInteractorInput, routerInput: SidebarRouterInput) in
            let presenter = SidebarPresenter(interactorInput: interactorInput, routerInput: routerInput)
            presenter.output = output
            return presenter
        }
        // If call resolve without argument
        // will automatically resolve properties at initCompleted
        container.register(SidebarPresenter.self) { r in
        	let moduleOutput: SidebarModuleOutput? = nil // need to send nil as concrete type
            return r.resolve( SidebarPresenter.self, arguments: moduleOutput, r.resolve( SidebarInteractorInput.self )!, r.resolve( SidebarRouterInput.self )! )!
        }.initCompleted { (r, presenter) in
            presenter.view = r.resolve()
        }

        container.register(SidebarModuleInput.self) { r in
            return r.resolve( SidebarPresenter.self )!
        }

        container.register(SidebarInteractorOutput.self) { r in
            return r.resolve( SidebarPresenter.self )!
        }

        container.register(SidebarViewOutput.self) { r in
            return r.resolve( SidebarPresenter.self )!
        }
    }
}

private class SidebarViewAssembly: Assembly {
    func assemble(container: Container) {
    	container.register(SidebarViewController.self) { (_, viewOutput: SidebarViewOutput) in
            return SidebarViewController(viewOutput: viewOutput)
        }

        container.register(SidebarViewController.self) { r in
            return r.resolve( SidebarViewController.self, argument: r.resolve( SidebarViewOutput.self )! )!
        }

        container.register(SidebarViewInput.self) { r in
            return r.resolve( SidebarViewController.self )!
        }

        container.register(SidebarTransitionHandler.self) { r in
            return r.resolve( SidebarViewController.self )!
        }
    }
}

private class SidebarModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SidebarModule.self, factory: { (r, assembler: Assembler, output: SidebarModuleOutput?) in
        	// create only object without resolving properties
        	let interactor = r.resolve( SidebarInteractor.self, argument: true )!
        	// create only object without resolving properties
            let router = r.resolve( SidebarRouter.self, argument: true )!
            router.assembler = assembler

            let presentener = r.resolve( SidebarPresenter.self, arguments: output, interactor as SidebarInteractorInput, router as SidebarRouterInput )!
			interactor.output = presentener

            let view = r.resolve( SidebarViewController.self, argument: presentener as SidebarViewOutput)
            router.transitionHandler = view
            presentener.view = view

            let module: SidebarModule = SidebarModule()
            module.view = view
            module.input = presentener
            module.assembler = assembler
            return module
        })
    }
}
// swiftlint:enable force_cast line_length identifier_name
