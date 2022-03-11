//
//  RKRootTabBarController.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/11.
//

//class RKRootTabBarController: UITabBarController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        creatSubViewControllers()
//    }
//        
//    func creatSubViewControllers(){
//        let sessionRecordVC = RKSessionRecordViewController()
//        sessionRecordVC.title = LocalizedString("custom_btn_sessionrecord")
//        sessionRecordVC.tabBarItem = createTabBarItem(LocalizedString("custom_btn_sessionrecord"), "tab_session_n", selectedImageName: "tab_session_s")
//        
//        let addressBookVC = RKAddressBookViewController()
//        addressBookVC.title = LocalizedString("custom_btn_addressbook")
//        addressBookVC.tabBarItem = createTabBarItem(LocalizedString("custom_btn_addressbook"), "tab_book_n", selectedImageName: "tab_book_s")
//        
//        let collaborationDeskVC = RKCollaborationDeskViewController()
//        collaborationDeskVC.title = LocalizedString("custom_btn_collaborationdesk")
//        collaborationDeskVC.tabBarItem = createTabBarItem(LocalizedString("custom_btn_collaborationdesk"), "tab_collaboration_n", selectedImageName: "tab_collaboration_s")
//        
//        let chatListVC = RKChatListDemoViewController()
//        chatListVC.title = LocalizedString("custom_btn_collaborationdesk")
//        chatListVC.tabBarItem = createTabBarItem(LocalizedString("custom_btn_collaborationdesk"), "tab_collaboration_n", selectedImageName: "tab_collaboration_s")
//        
//        let mineVC = RKMineViewController()
//        mineVC.title = LocalizedString("custom_btn_mine")
//        mineVC.tabBarItem = createTabBarItem(LocalizedString("custom_btn_mine"), "tab_mine_n", selectedImageName: "tab_mine_s")
//        
//        if RKSDKSetting.shareInstance.mod == .moderatorMode {
//            let viewControllers = [RKBaseNavigationController(rootViewController: sessionRecordVC),
//                                   RKBaseNavigationController(rootViewController: addressBookVC),
//                                   RKBaseNavigationController(rootViewController: chatListVC),
//                                   RKBaseNavigationController(rootViewController: mineVC)]
//            self.viewControllers = viewControllers
//        } else {
//            let viewControllers = [RKBaseNavigationController(rootViewController: sessionRecordVC),
//                                   RKBaseNavigationController(rootViewController: addressBookVC),
//                                   RKBaseNavigationController(rootViewController: mineVC)]
//            self.viewControllers = viewControllers
//        }
//                
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: 0x999999)], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hex: 0x1759F5)], for: .selected)
//        UITabBar.appearance().backgroundColor = UIColor(hex: 0xFFFFFF)
//    }
//    
//    func createTabBarItem(_ title: String, _ imageName: String, selectedImageName: String) -> UITabBarItem {
//        var image = UIImage(named: imageName)
//        image = image?.withRenderingMode(.alwaysOriginal)
//        var selectedImage = UIImage(named: selectedImageName)
//        selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
//        let tabBarItem : UITabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
//        return tabBarItem
//    }
//    
//}
