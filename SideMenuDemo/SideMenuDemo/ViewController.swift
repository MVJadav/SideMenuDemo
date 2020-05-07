//
//  ViewController.swift
//  SideMenuDemo
//
//  Created by mac on 01/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClickOnMenu(_ sender: UIButton) {
        let sideMenuContainerController = self.storyboard?.instantiateViewController(withIdentifier: "RESideMenuContainerController") as! RESideMenuContainerController
        self.navigationController?.setViewControllers([sideMenuContainerController], animated: true)
    }

}

