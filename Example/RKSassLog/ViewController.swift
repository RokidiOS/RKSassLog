//
//  ViewController.swift
//  RKSassLog
//
//  Created by chzy on 03/11/2022.
//  Copyright (c) 2022 chzy. All rights reserved.
//

import UIKit
import RKSassLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton()
        btn.setTitle("去登录界面", for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        btn.addTarget(self, action: #selector(showLogVC), for: .touchUpInside)
        btn.backgroundColor = .black
        view.addSubview(btn)
    }

    @objc func showLogVC() {
        let vc = RKSassLoginVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)        
    }
    
}

extension ViewController: RKSassLogDelegate {
    func logSuccess(uid: String, token: String, loginVC: UIViewController) {
        
    }
    
    
}

