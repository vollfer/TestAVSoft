//
//  SecondMenuViewController.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 24.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol SecondMenuViewControllerOutput: ViewOutput {
    func tapEditMenu()
    func tapViewMenu()
    func tapApplicationMenu()
}

final class SecondMenuViewController: UIViewController {
    
    //MARK: - Properties
    var presenter: SecondMenuViewControllerOutput?
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    private var widthConstraint: NSLayoutConstraint?
    private let customView = CustomView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
    }
    
    private func drawSelf() {
        
        panGestureRecognizer.maximumNumberOfTouches = 1
        panGestureRecognizer.addTarget(self, action: #selector(handelPanGesture(gestureRecognizer:)))
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.addGestureRecognizer(panGestureRecognizer)
        customView.delegate = self
        view.addSubview(customView)
        view.backgroundColor = .white
        
        widthConstraint = customView.widthAnchor.constraint(equalToConstant: 172)
        widthConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.topAnchor),
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func handelPanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else { return }
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let widthConstraint = widthConstraint,
                panGestureAnchorPoint != nil else { return }
            let gesturePoint = gestureRecognizer.location(in: view)
            
            if widthConstraint.constant < 201 && widthConstraint.constant > 29 {
                widthConstraint.constant += gesturePoint.x - (panGestureAnchorPoint?.x ?? 0)
                self.panGestureAnchorPoint = gesturePoint
            } else if widthConstraint.constant >= 200 {
                widthConstraint.constant = 200
            } else {
                self.widthConstraint?.constant = 30
            }
        default:
            break
            
        }
    }
}

//MARK: - SecondMenuInput
extension SecondMenuViewController: SecondMenuInput {
    
}

//MARK: - CustomViewDelegate
extension SecondMenuViewController: CustomViewDelegate {
    func didTapAboutApplication(_ customView: UIView) {
        presenter?.tapApplicationMenu()
    }
    
    func didTapEditButton(_ customView: UIView) {
        presenter?.tapEditMenu()
    }
    
    func didTapViewButton(_ customView: UIView) {
        presenter?.tapViewMenu()
    }
}
