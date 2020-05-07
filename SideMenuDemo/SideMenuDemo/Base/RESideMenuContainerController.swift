//
//  RootViewController.swift
//  RealTaxi
//
//  Created by mac on 11/06/18.
//

import UIKit

class RESideMenuContainerController: RESideMenu {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.menuPreferredStatusBarStyle = .lightContent
        self.contentViewShadowColor = UIColor.black
        self.contentViewShadowOffset = CGSize(width: 0, height: 0)
        self.contentViewShadowOpacity = 0.6
        self.contentViewShadowRadius = 12
        self.contentViewShadowEnabled = true
        
        self.menuViewControllerTransformation = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        self.scaleContentView = false
        self.scaleBackgroundImageView = false
        self.scaleMenuView = false
        self.fadeMenuView = true
        self.parallaxEnabled = false
        self.bouncesHorizontally = false
        
        self.contentViewInPortraitOffsetCenterX = SF.screenWidth ///2 - 70
        
        
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        self.contentViewController = navigationController
        AppUtility.default.navigationController = navigationController
        self.leftMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        self.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RESideMenuContainerController : RESideMenuDelegate {
    
    func sideMenu(_ sideMenu: RESideMenu!, willShowMenuViewController menuViewController: UIViewController!) {
        
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, didShowMenuViewController menuViewController: UIViewController!) {
        
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, willHideMenuViewController menuViewController: UIViewController!) {
        
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, didHideMenuViewController menuViewController: UIViewController!) {
    
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, didRecognizePanGesture recognizer: UIPanGestureRecognizer!) {
        
    }
}


