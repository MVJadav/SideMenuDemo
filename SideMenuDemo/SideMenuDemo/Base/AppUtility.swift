//
//  AppUtility.swift
//  SideMenuDemo
//
//  Created by mac on 01/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Foundation

class AppUtility: NSObject {
    
    @objc var rootNavigationController: UINavigationController?
    @objc var navigationController: UINavigationController?
    
    @objc public static let `default` = AppUtility()
    
}

struct SF {
    
    ///  Returns current screen orientation
    public static var screenOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
    
    ///  Returns screen width
    public static var screenWidth: CGFloat {
        #if os(iOS)

        //if UIInterfaceOrientation.isPortrait(screenOrientation) {
        if UIInterfaceOrientation.portrait == screenOrientation {
                return UIScreen.main.bounds.size.width
            } else {
                return UIScreen.main.bounds.size.height
            }
        #elseif os(tvOS)
            return UIScreen.main.bounds.size.width
        #endif
    }
    
    ///  Returns screen height
    public static var screenHeight: CGFloat {
        #if os(iOS)
        //if UIInterfaceOrientation.isPortrait(SF.screenOrientation) {
        if UIInterfaceOrientation.portrait == screenOrientation {
                return UIScreen.main.bounds.size.height
            } else {
                return UIScreen.main.bounds.size.width
            }
        #elseif os(tvOS)
            return UIScreen.main.bounds.size.height
        #endif
    }
}
