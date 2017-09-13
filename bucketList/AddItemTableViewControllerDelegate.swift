//
//  AddItemTableViewControllerDelegate.swift
//  bucketList
//
//  Created by Thej on 9/11/17.
//  Copyright © 2017 Thej. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
