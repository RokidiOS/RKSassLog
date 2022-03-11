//
//  RKBaseNavigationController.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/11.
//
import RKIUtils
import UIKit
open class RKBaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        interactivePopGestureRecognizer?.delegate = self
        if #available(iOS 15.0, *){
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .white
                appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.black]
                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance

           }  else{
               navigationBar.setBackgroundImage(UIImage.init(color: .white), for: .default)
                navigationBar.isTranslucent = false
                let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
                navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
           }
        
    }
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // push 隐藏tabbar
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        } else {
            viewController.hidesBottomBarWhenPushed = false
        }

        super.pushViewController(viewController, animated: animated)
    }

}

