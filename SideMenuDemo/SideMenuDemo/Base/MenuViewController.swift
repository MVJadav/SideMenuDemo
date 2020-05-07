//
//  MenuViewController.swift
//  RealTaxi
//
//  Created by mac on 11/06/18.
//

import UIKit

let menuTitle = "MenuTitle"
let menuImage = "MenuImage"

struct MenuTitle {
    static let fits             = "Fits"
    static let places           = "Places"
    static let preferences      = "Preferences"
    static let messages         = "Messages"
    static let favorits         = "Favorites"
    static let friends          = "Friends"
    static let settings         = "Settings"
    static let notifications    = "Notifications"
    static let signout          = "Sign Out"
    
}


class MenuViewController: UIViewController {
    
    @IBOutlet weak var tblMenu                  : UITableView!
    @IBOutlet weak var outerViewProfileImg      : UIView!
    @IBOutlet weak var imgProfile               : UIImageView!
    @IBOutlet weak var lblName                  : UILabel!
    @IBOutlet weak var btnEditProfile           : UIButton!
    
    let profileSetMessage       = "Please set your profile."
    let preferenceSetMessage    = "Please set your preferences."
    
    var sideMenu : [[String: Any]] = []
    var unReadNotificationCount = 0

    
    
    //MARK:- Lifecycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.outerViewProfileImg.roundView()
        //self.imgProfile.roundView()
        self.outerViewProfileImg.layer.cornerRadius = outerViewProfileImg.frame.size.width/2
        self.outerViewProfileImg.clipsToBounds = true
        self.imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        self.imgProfile.clipsToBounds = true
        
        self.sideMenu = [
            [menuTitle: MenuTitle.fits, menuImage: "menu_fits"],
            [menuTitle: MenuTitle.places, menuImage: "menu_places"],
            [menuTitle: MenuTitle.preferences, menuImage: "menu_preferences"],
            [menuTitle: MenuTitle.messages, menuImage: "menu_messages"],
            [menuTitle: MenuTitle.favorits, menuImage: "menu_favorites"],
            [menuTitle: MenuTitle.friends, menuImage: "menu_friends"],
            [menuTitle: MenuTitle.settings, menuImage: "menu_settings"],
            [menuTitle: MenuTitle.notifications, menuImage: "menu_notifications"],
            [menuTitle: MenuTitle.signout, menuImage: "menu_signout"]
        ]
        self.tblMenu.reloadData()
        /*self.imgProfile.addTapGesture(action: { (gesture) in
          self.btnEditProfile(self.btnEditProfile)
        })*/
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getNotificationCount()
        self.setData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- IBAction Metods
extension MenuViewController {
    
    @IBAction func btnClose(_ sender: UIButton) {
        
        sideMenuViewController.hideViewController()
    }
    
    @IBAction func btnEditProfile(_ sender: UIButton) {
        self.sideMenuViewController.hideViewController()
        
         /*if User.loggedInUser()?.profileCompleted == 0 {
            
            self.sideMenuViewController.hideViewController()
            ISMessages.show(self.profileSetMessage)
            let myProfile = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
            AppUtility.default.navigationController?.setViewControllers([myProfile], animated: false)
            
         } else if User.loggedInUser()?.preferenceCompleted == 0 {
            
            self.sideMenuViewController.hideViewController()
            ISMessages.show(self.preferenceSetMessage)
            let userPreference = self.storyboard?.instantiateViewController(withIdentifier: "PreferencesViewController") as! PreferencesViewController
            AppUtility.default.navigationController?.setViewControllers([userPreference], animated: false)
            
         } else {
            
            let myProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
            AppUtility.default.navigationController?.pushViewController(myProfileVC, animated: true)
            //self.navigationController?.pushViewController(myProfileVC, animated: true)
        }*/
    }
    
}

//MARK:- UITableView DataSource & Delegate Methods
extension MenuViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sideMenu.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if self.sideMenu.count > 0 {
//            return (CGFloat(Int(SF.screenHeight) / self.sideMenu.count))
//        }
//        return 0
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:SideMenuCell? = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as? SideMenuCell
        if (cell == nil) {
            let nib: NSArray = Bundle.main.loadNibNamed("SideMenuCell", owner: self, options: nil)! as NSArray
            cell = nib.object(at: 0) as? SideMenuCell
        }
        cell?.selectionStyle = .none
        let dict = self.sideMenu[indexPath.row]
        let strTitle = dict[menuTitle] as? String
        cell?.lblTitle.text = strTitle
        cell?.imgSideMenu.image = UIImage(named:dict[menuImage] as! String)
        
        cell?.notiCountView.isHidden = true
        cell?.lblNotiCount.isHidden = true
        if (strTitle == MenuTitle.notifications) {
            cell?.notiCountView.isHidden = false
            cell?.lblNotiCount.isHidden = false
            if self.unReadNotificationCount > 0 {
                if self.unReadNotificationCount > 99 {
                    cell?.lblNotiCount.text = "99+"
                } else {
                    cell?.lblNotiCount.text = "\(self.unReadNotificationCount)"
                }
            } else {
                cell?.notiCountView.isHidden = true
                cell?.lblNotiCount.isHidden = true
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = self.sideMenu[indexPath.row]
        let strTitle = dict[menuTitle] as! String

        self.sideMenuViewController.hideViewController() //
        /*func redirectView() {
            
            if User.loggedInUser()?.profileCompleted == 0 {
                
                self.sideMenuViewController.hideViewController()
                ISMessages.show(self.profileSetMessage)
                let myProfile = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
                AppUtility.default.navigationController?.setViewControllers([myProfile], animated: false)
                
            } else if User.loggedInUser()?.preferenceCompleted == 0 {
                
                self.sideMenuViewController.hideViewController()
                ISMessages.show(self.preferenceSetMessage)
                let userPreference = self.storyboard?.instantiateViewController(withIdentifier: "PreferencesViewController") as! PreferencesViewController
                AppUtility.default.navigationController?.setViewControllers([userPreference], animated: false)
                
            } else {
                
                switch strTitle {
                case MenuTitle.fits:
                    self.sideMenuViewController.hideViewController()
                    let userDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
                    AppUtility.default.navigationController?.setViewControllers([userDetailVC], animated: false)
                    break
                case MenuTitle.places:
                    self.sideMenuViewController.hideViewController()
                    let placeCV = self.storyboard?.instantiateViewController(withIdentifier: "PlacesViewController") as! PlacesViewController
                    AppUtility.default.navigationController?.setViewControllers([placeCV], animated: false)
//                    ISMessages.show("Comming soon...")
                    break
                case MenuTitle.preferences:
                    self.sideMenuViewController.hideViewController()
                    let preferencesVC = self.storyboard?.instantiateViewController(withIdentifier: "PreferencesViewController") as! PreferencesViewController
                    AppUtility.default.navigationController?.setViewControllers([preferencesVC], animated: false)
                    break
                case MenuTitle.messages:
                    self.sideMenuViewController.hideViewController()
                    let messageCV = self.storyboard?.instantiateViewController(withIdentifier: "MessagesViewController") as! MessagesViewController
                    AppUtility.default.navigationController?.setViewControllers([messageCV], animated: false)
//                    ISMessages.show("Comming soon...")
                    break
                case MenuTitle.favorits:
                    self.sideMenuViewController.hideViewController()
                    let settingsCV = self.storyboard?.instantiateViewController(withIdentifier: "FavotitesViewController") as! FavotitesViewController
                    AppUtility.default.navigationController?.setViewControllers([settingsCV], animated: false)
//                    ISMessages.show("Comming soon...")
                    break
                case MenuTitle.friends:
                    self.sideMenuViewController.hideViewController()
                    let settingsCV = self.storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as! FriendsViewController
                    AppUtility.default.navigationController?.setViewControllers([settingsCV], animated: false)
//                    ISMessages.show("Comming soon...")
                    break
                case MenuTitle.settings:
                    self.sideMenuViewController.hideViewController()
                    let settingsCV = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
                    AppUtility.default.navigationController?.setViewControllers([settingsCV], animated: false)
//                    ISMessages.show("Comming soon...")
                    break
                case MenuTitle.notifications:
                    self.sideMenuViewController.hideViewController()
                    let notificationCV = self.storyboard?.instantiateViewController(withIdentifier: "NotificationListViewController") as! NotificationListViewController
                    AppUtility.default.navigationController?.setViewControllers([notificationCV], animated: false)
//                    ISMessages.show("Comming soon...")
                    break
                case MenuTitle.signout:
                    let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                        //self.userLogOut()
                        User.delete()
                        self.sideMenuViewController.hideViewController()
                        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        AppUtility.default.rootNavigationController?.setViewControllers([loginVC], animated: false)
                        //AppUtility.default.navigationController?.setViewControllers([loginVC], animated: false)
                        
                        
                        
                        //                let objTutorialVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
                        //                let navigationController = UINavigationController(rootViewController: objTutorialVC)
                        //                appDelegate.window?.rootViewController = navigationController
                        //                appDelegate.window?.makeKeyAndVisible()
                        
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: { action in
                        print("Cancel")
                    }))
                    self.present(alert, animated: true, completion: nil)
                    break
                default:
                    self.sideMenuViewController.hideViewController()
                    break
                }
            }
        }*/
        
        
        /*switch strTitle {
        case MenuTitle.signout:
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                //self.userLogOut()
                User.delete()
                self.sideMenuViewController.hideViewController()
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                AppUtility.default.rootNavigationController?.setViewControllers([loginVC], animated: false)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: { action in
                print("Cancel")
            }))
            self.present(alert, animated: true, completion: nil)
            break
        default:
            self.sideMenuViewController.hideViewController()
            redirectView()
            break
        }*/
        
        
    }
}

//

//MARK:- Other Methods
extension MenuViewController {
    
    func setView() {
        self.tblMenu.rowHeight              = UITableView.automaticDimension
        self.tblMenu.estimatedRowHeight     = self.tblMenu.rowHeight
        self.tblMenu.tableFooterView        = UIView()
    }
    
    func setData() {
        
        /*if let img = User.loggedInUser()?.profilePic {
            self.imgProfile.setImageWithURL(img, placeHolderImage: #imageLiteral(resourceName: "placeholder_user"), activityIndicatorViewStyle: .gray, completionBlock: nil)
        }
        if let name = User.loggedInUser()?.firstName {
            self.lblName.text = name
        }*/
        
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}


//MARK:- Service Call
extension MenuViewController {

    
    func getNotificationCount() {
        /*let parameters : Dictionary = [
            "user_id": User.loggedInUser()?.userId ?? 0,
            ] as [String : Any]
        _ = WebClient.requestWithUrl(url: K.URL.GET_NOTIFICATION_COUNT, parameters: parameters) { (response, error) in
            if error == nil {
                let dictData = response as! [String : Any]
                if let notiCount = dictData["data"] as? Int {
                    self.unReadNotificationCount = notiCount
                    self.tblMenu.reloadData()
                }
            } else {
                ISMessages.show(error?.localizedDescription)
            }
        }*/
    }
    
}



