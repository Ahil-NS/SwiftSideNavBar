//
//  MenuTableViewController.swift
//  SwiftSideNavBar
//
//  Created by MacBook on 1/10/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

protocol MenuTableViewControllerDelegate:class {
    func menuTableViewController(_ controller: MenuTableViewController, didSelectRow row: Int)
}
class MenuTableViewController: UITableViewController {

    weak var delegate: MenuTableViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.menuTableViewController(self, didSelectRow: indexPath.row)
    }

}
