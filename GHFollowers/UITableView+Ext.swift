//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/9/20.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() { DispatchQueue.main.async { self.reloadData() } }
    

    func removeExcessCells() { tableFooterView = UIView(frame: .zero) }
}
