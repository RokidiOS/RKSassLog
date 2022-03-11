//
//  ViewController.swift
//  RKIM
//
//  Created by chzy on 10/28/2021.
//  Copyright (c) 2021 chzy. All rights reserved.
//

import UIKit
import Alamofire
import RKIBaseView
import SnapKit

public protocol RKSassLogDelegate: NSObjectProtocol {
    func logSuccess(uid: String, token: String, loginVC: UIViewController)
}

public class RKSassLoginVC: RKBaseViewController {
    
    
    public weak var delegate: RKSassLogDelegate?
    
    var logText = ""
    @objc func loginAction() {
        
        guard let company = companyTf.text else {
            RKToast.show(withText: "公司名不能为空", duration: 1, in: view)
            return }
        guard let userName = userNameTf.text else {
            RKToast.show(withText: "用户名不能为空", duration: 1, in: view)
            return }
        guard let password = passwordTf.text else {
            RKToast.show(withText: "密码不能为空", duration: 1, in: view)
            return  }
        
        LoginHelper.loginAction(companyID: company, userName: userName, password: password, compeletBlock: { [self] uuid, token, erroMsg in
            guard let _ = uuid, let token = token else {
                if let msg = erroMsg {
                    RKToast.show(withText: msg, duration: 2, in: self.view)
                }
                return
            }
            
            LoginHelper.getUserInfo(token) { userDict, isSuccess in
                if let uid = userDict?["userId"] as? String {
                    self.delegate?.logSuccess(uid: uid, token: token, loginVC: self)
                }
            }
            
            UserDefaults.standard.set(self.userNameTf.text, forKey: self.udUserKey)
            UserDefaults.standard.set(self.passwordTf.text, forKey: self.udPwdKey)
            UserDefaults.standard.set(self.companyTf.text, forKey: self.udComanyKey)
        })
    }
    let udComanyKey = "company"
    let udUserKey = "userName"
    let udPwdKey = "passwordName"
    public override func viewDidLoad() {
        configUI()
        autoLogin()
    }

    /// 自动登录策略
    func autoLogin() {
        if let company = UserDefaults.standard.value(forKey: udComanyKey) as? String ,
           let userName = UserDefaults.standard.value(forKey: udUserKey) as? String,
           let pwd = UserDefaults.standard.value(forKey: udPwdKey) as? String {
            companyTf.text = company
            userNameTf.text = userName
            passwordTf.text = pwd
            loginAction()
        }
    }
    
    func configUI() {
        view.backgroundColor = .white
        view.addSubViews([companyTf,
                          userNameTf,
                          passwordTf,
                          loginBtn])
        let vertGap = 15
        companyTf.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.top.equalTo(80)
            make.height.equalTo(40)
        }
        
        userNameTf.snp.makeConstraints { make in
            make.centerX.size.equalTo(companyTf)
            make.top.equalTo(companyTf.snp_bottom).offset(vertGap)
        }
        
        passwordTf.snp.makeConstraints { make in
            make.centerX.size.equalTo(companyTf)
            make.top.equalTo(userNameTf.snp_bottom).offset(vertGap)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 30))
            make.top.equalTo(passwordTf.snp_bottom).offset(vertGap)
        }
        
    }
    
    lazy var companyTf: UITextField = {
        return createTf("请输入公司名")
    }()
    
    lazy var userNameTf: UITextField = {
        return createTf("请输入用户名")
    }()
    
    lazy var passwordTf: UITextField = {
        return createTf("请输入密码")
    }()
    
    lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("登录", color: .white, font: .systemFont(ofSize: 18), for: .normal)
        btn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return btn
    }()
    
    private func createTf(_ placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        tf.layer.borderWidth = 1
        tf.placeholder = placeholder
        tf.clearButtonMode = .whileEditing
        tf.font = .systemFont(ofSize: 16)
        tf.textColor = .blue
        return tf
    }
}



