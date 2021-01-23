//
//  DarkStylePresentationController.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 11.06.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

class DarkStylePresentationController: UIPresentationController, CustomPresentationProvidingInternal {

    weak var presentationDelegate: CustomPresentationProviding?

    fileprivate lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(CGFloat(0.5))
        let closeButton = UIButton(type: .custom)
        closeButton.addTarget(self, action: #selector(handleClose(_:)), for: .touchUpInside)
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        let margin = CGFloat(32)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: margin),
            closeButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: (-margin / 2))
            ])
        return view
    }()

    @IBAction fileprivate func handleClose(_ sender: UIControl) {
        if let viewController = presentedViewController as? CustomPresentationDismisable {
            close(viewController.shouldDismiss())
        } else if let navController = presentedViewController as? NavigationController,
            let topController = navController.topViewController as? CustomPresentationDismisable {
            close(topController.shouldDismiss())
        } else {
            close()
        }
    }

    private func close(_ allowed: Bool = true) {
        if allowed {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }

    override func presentationTransitionWillBegin() {
        if let containerView = containerView {
            containerView.insertSubview(dimmingView, at: 0)
            dimmingView.anchorAllEdgesToSuperview()
            let layer = presentedViewController.view.layer
            layer.cornerRadius = 10
            layer.masksToBounds = true
        }

        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1
            return
        }
        let controller = presentedViewController
        presentationDelegate?.presentationWillBegin(controller)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.dimmingView.alpha = 1
            }, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.removeFromSuperview()
            return
        }
        let controller = presentedViewController
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.dimmingView.alpha = 0
            }, completion: { [weak self] _ in
                self?.dimmingView.removeFromSuperview()
                self?.presentationDelegate?.dismissalDidFinish(controller)
        })
    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        let spacing: CGFloat = 10
        return CGSize(width: parentSize.width - 2 * spacing,
                      height: parentSize.height - 64 - spacing)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        let boundsSize = containerView!.bounds.size
        frame.size = size(forChildContentContainer: presentedViewController,
                          withParentContainerSize: boundsSize)
        frame.origin.x = (boundsSize.width - frame.size.width) / 2
        frame.origin.y = (boundsSize.height - frame.size.height - 10)
        return frame
    }
}
