//
//  GreenViewController.swift
//  SwiftSideNavBar
//
//  Created by MacBook on 1/10/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit


protocol GreenViewControllerDelegate: class{
    func greenViewControllerDidTapMenuButton(_ controller: GreenViewController)
}

class GreenViewController: UIViewController {
    
    weak var delegate: GreenViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func menuButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.greenViewControllerDidTapMenuButton(self)
    }
    
}
