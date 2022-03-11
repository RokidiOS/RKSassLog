//
//  RKTextInputView.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/20.
//
import RKIUtils
import SnapKit

class RKTextInputView: UIView {
    // 左侧图标
    var iconView: UIImageView!
    // 密码隐藏按钮
    var secureButton: UIButton!
    // 输入框
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView()  {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: 0xEDF3FF).cgColor
        
        self.backgroundColor = UIColor(hex: 0xF6FAFF)
        
        iconView = UIImageView()
        let image = UIImage(named: "rk_input_pwd")
        iconView.image = image
        self.addSubview(iconView)
        
        textField = UITextField()
        textField.font = RKFont.font_nomalText
        textField.textColor = UIColor(hex: 0x2D2D2D)
        textField.keyboardType = .asciiCapable
        // 关闭自动联想
        textField.autocorrectionType = .no
        // 关闭首字母大写
        textField.autocapitalizationType = .none
        self.addSubview(textField)
        
        secureButton = UIButton(type: .custom)
        let secureSImage = UIImage(named: "rk_input_secure_s")
        let secureNImage = UIImage(named: "rk_input_secure_s")
        secureButton.setImage(secureNImage, for: .normal)
        secureButton.setImage(secureSImage, for: .selected)
        secureButton.addTarget(self, action: #selector(callStartBtnAction(_:)), for: .touchUpInside)
        self.addSubview(secureButton)
        
        iconView.snp.makeConstraints { (make) in
            make.size.equalTo(24)
            make.left.equalTo(13)
            make.centerY.equalToSuperview()
        }
        
        textField.snp.makeConstraints { (make) in
            make.top.height.equalToSuperview()
            make.left.equalTo(iconView.snp_right).offset(15)
            make.right.equalTo(secureButton.snp_left).offset(15)
        }
        
        secureButton.snp.makeConstraints { (make) in
            make.size.equalTo(24)
            make.right.equalTo(-13)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func callStartBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textField.isSecureTextEntry = sender.isSelected
    }
}
