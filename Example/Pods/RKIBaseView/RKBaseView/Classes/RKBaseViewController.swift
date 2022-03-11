//
//  RKBaseViewController.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/11.
//
import RKILogger
import UIKit

open class RKBaseViewController: UIViewController {
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
  
    deinit {
        RKLog("\(self.classForCoder) 释放了...")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupLeftNavBarItem()
        setupRightNavBarItem()
        setupView()
    }
        
    open func setupLeftNavBarItem() {
        var image = UIImage(named: "rk_nav_back", aclass: RKBaseViewController().classForCoder, bundleName: "RKBase")
        image = image?.withRenderingMode(.alwaysOriginal)
        let leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftBarButtonItemAction))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    open func setupRightNavBarItem() {

    }
    
    open func setupView() {
        
    }
    
    @objc open func leftBarButtonItemAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
