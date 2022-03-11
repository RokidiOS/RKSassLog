//
//  RKCallStartView.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/12.
//
import RKIUtils

protocol RKCallStartViewDelegate: NSObjectProtocol {
    // MARK: - 发起呼叫
    func callStartBtnAction(_ sender: UIButton)
}

class RKCallStartView: UIView {
    // 按钮
    var startButton: UIButton!
    // 发起图标
    var callImageView: UIImageView!
    // 按钮名称
    var textLabel: UILabel!
    // 已选
    var countLabel: UILabel!
    
    weak var delegate: RKCallStartViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(hex: 0xFFFFFF)
        
        startButton = UIButton(type: .custom)
        startButton.backgroundColor = UIColor(hex: 0x1759F5)
        startButton.layer.cornerRadius = 2
        startButton.layer.masksToBounds = true
        startButton.addTarget(self, action: #selector(callStartBtnAction(_:)), for: .touchUpInside)
        self.addSubview(startButton)
        
        callImageView = UIImageView()
        let callImage = UIImage(named: "rk_btn_start_white")
        callImageView.image = callImage
        startButton.addSubview(callImageView)
        
        textLabel = UILabel()
        textLabel.textAlignment = .right
        textLabel.font = RKFont.font_nomalText
        textLabel.textColor = UIColor(hex: 0xFFFFFF)
        startButton.addSubview(textLabel)
        
        countLabel = UILabel()
        countLabel.font = RKFont.font_tipText
        countLabel.textColor = UIColor(hex: 0xFFFFFF)
        startButton.addSubview(countLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func showCallStartButton(_ title: String, selectedMemebers: String?) {
        
        startButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(18)
            make.right.equalTo(-18)
            make.height.equalTo(42)
        }
        
        callImageView.snp.makeConstraints { (make) in
            make.size.equalTo(20)
            make.right.equalTo(textLabel.snp_left)
            make.centerY.equalToSuperview()
        }
        
        textLabel.text = title
        if let selectedMemeberString = selectedMemebers {
            countLabel.text = selectedMemeberString
            // 左右布局
            countLabel.snp.makeConstraints { (make) in
                make.top.height.equalToSuperview()
                make.width.equalTo(120)
                make.left.equalTo(28)
            }
            // 计算宽度
            let titleWidth = title.getStringWidth(textLabel.font) + 10
            textLabel.snp.makeConstraints { (make) in
                make.top.height.equalToSuperview()
                make.width.equalTo(titleWidth)
                make.right.equalTo(-28)
            }
        } else {
            // 计算宽度 居中
            let titleWidth = title.getStringWidth(textLabel.font) + 10
            let offset = 24 - titleWidth / 2
            textLabel.snp.makeConstraints { (make) in
                make.top.height.equalToSuperview()
                make.width.equalTo(titleWidth)
                make.left.equalTo(startButton.snp_centerX).offset(offset)
            }
        }
    }
    
    @objc func callStartBtnAction(_ sender: UIButton) {
        delegate?.callStartBtnAction(sender)
    }
}
