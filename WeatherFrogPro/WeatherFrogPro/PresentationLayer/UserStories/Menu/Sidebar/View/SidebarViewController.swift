//
//  Sidebar - SidebarViewController.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 06/10/2017.
//  Copyright © 2017 IC Servis, s.r.o.. All rights reserved.
//

import UIKit

protocol SidebarTransitionHandler: TransitionHandler { }

class SidebarViewController: UIViewController {
    var output: SidebarViewOutput

    init(viewOutput output: SidebarViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

extension SidebarViewController: SidebarViewInput {
    func setupInitialState() {
    }
}

extension SidebarViewController: SidebarTransitionHandler {
}
