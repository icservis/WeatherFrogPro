//
//  PagePopStylePresentationController.swift
//  csob-ceb-ios
//
//  Created by Minh on 9/26/17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

class PagePopStylePresentationController: UIPresentationController, CustomPresentationProvidingInternal {

    weak var presentationDelegate: CustomPresentationProviding?
    fileprivate lazy var snapshotBgView: UIView = {
        let view = AppDelegate.shared.window?.snapshotView(afterScreenUpdates: true) ?? UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    fileprivate lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
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

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        presentedViewController.modalPresentationCapturesStatusBarAppearance = true
    }

    override func presentationTransitionWillBegin() {
        if let containerView = containerView {
            containerView.insertSubview(dimmingView, at: 0)
            containerView.insertSubview(snapshotBgView, aboveSubview: dimmingView)
            dimmingView.anchorAllEdgesToSuperview()
            snapshotBgView.anchorAllEdgesToSuperview(insets: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16))
        }

        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1
            snapshotBgView.alpha = 0.75
            return
        }
        let controller = presentedViewController
        presentationDelegate?.presentationWillBegin(controller)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.dimmingView.alpha = 1
            self?.snapshotBgView.alpha = 0.75
            }, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.removeFromSuperview()
            snapshotBgView.removeFromSuperview()
            return
        }
        let controller = presentedViewController
        snapshotBgView.alpha = 0
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.dimmingView.alpha = 0
            }, completion: { [weak self] _ in
                self?.dimmingView.removeFromSuperview()
                self?.snapshotBgView.removeFromSuperview()
                self?.presentationDelegate?.dismissalDidFinish(controller)
        })
    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        let spacing: CGFloat = 10
        return CGSize(width: parentSize.width,
                      height: parentSize.height - 32 - spacing)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        let boundsSize = containerView!.bounds.size
        frame.size = size(forChildContentContainer: presentedViewController,
                          withParentContainerSize: boundsSize)
        frame.origin.x = (boundsSize.width - frame.size.width) / 2
        frame.origin.y = (boundsSize.height - frame.size.height)
        return frame
    }
}
