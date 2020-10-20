//
//  ViewController.swift
//  HolidaysApp
//
//  Created by Emina Mesic on 20/10/2020.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }


}

