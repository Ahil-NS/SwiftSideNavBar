//
//  RedViewController.swift
//  SwiftSideNavBar
//
//  Created by MacBook on 1/10/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

protocol RedViewControllerDelegate: class{
    func redViewControllerDidTapMenuButton(_ controller: RedViewController)
}

class RedViewController: UIViewController {
    weak var delegate: RedViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func redMenuButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.redViewControllerDidTapMenuButton(self)
    }
}
