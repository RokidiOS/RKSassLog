////
////  RKAlertView.swift
////  RokidSDK
////
////  Created by Rokid on 2021/8/23.
////
//
//import RKIUtils
//
//public class RKAlertView: UIView {
//    
//    var contentView: UIView!
//    var titleLabel: UILabel!
//    var cancelButton: UIButton!
//    var confirmButton: UIButton!
//    var alertCancelHandler: AlertHandler?
//    var alertConfirmHandler: AlertHandler?
//    var lineV: UIView!
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupView()
//    }
//    
//    func setupView()  {
//        
//        self.backgroundColor = UIColor(hex: 0x000000, alpha: 0.6)
//        
//        contentView = UIView.init()
//        contentView.backgroundColor = UIColor(hex: 0xFFFFFF)
//        contentView.layer.cornerRadius = 12
//        self.addSubview(contentView)
//        
//        titleLabel = UILabel.init()
//        titleLabel.numberOfLines = 0
//        titleLabel.adjustsFontSizeToFitWidth = true
//        titleLabel.font = RKFont.font_contentText_bold
//        titleLabel.textAlignment = .center
//        titleLabel.textColor = UIColor(hex: 0x000000)
//        self.contentView.addSubview(self.titleLabel)
//        
//        cancelButton = UIButton(type:.custom)
//        cancelButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
//        cancelButton.setTitleColor(UIColor(hex: 0x000000), for: .normal)
//        cancelButton.addTarget(self, action: #selector(customActionBtnClicked(_:)), for: .touchUpInside)
//        self.contentView.addSubview(cancelButton)
//        
//        confirmButton = UIButton(type:.custom)
//        confirmButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
//        confirmButton.setTitleColor(RKColor.alertButtonClr, for: .normal)
//        confirmButton.addTarget(self, action: #selector(customActionBtnClicked(_:)), for: .touchUpInside)
//        self.contentView.addSubview(confirmButton)
//        
//        let lineH = UIView()
//        lineH.backgroundColor = UIColor(hex: 0xCDCED2, alpha: 0.2)
//        self.contentView.addSubview(lineH)
//        lineH.snp.makeConstraints { (make) in
//            make.left.width.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-50)
//            make.height.equalTo(1)
//        }
//        
//        lineV = UIView()
//        lineV.backgroundColor = UIColor(hex: 0xCDCED2, alpha: 0.2)
//        self.contentView.addSubview(lineV)
//        lineV.snp.makeConstraints { (make) in
//            make.height.equalTo(50)
//            make.width.equalTo(1)
//            make.bottom.centerX.equalToSuperview()
//        }
//        
//    }
//    
//    public override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        self.contentView.snp.makeConstraints { (make) in
//            make.width.equalTo(260)
//            make.height.equalTo(130)
//            make.centerX.centerY.equalToSuperview()
//        }
//        
//        self.titleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.leftMargin.equalTo(15)
//            make.rightMargin.equalTo(-15)
//            make.height.equalTo(70)
//        }
//        
//        self.cancelButton.snp.makeConstraints { (make) in
//            make.left.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.height.equalTo(50)
//            make.right.equalTo(self.contentView.snp_centerX)
//        }
//        
//        self.confirmButton.snp.makeConstraints { (make) in
//            make.bottom.width.height.equalTo(self.cancelButton)
//            make.left.equalTo(self.contentView.snp_centerX)
//        }
//    }
//    
//    func showAlertView(_ view: UIView?,
//                       _ title: String?,
//                       _ cancelTitle: String?,
//                       _ confirmTitle: String?,
//                       _ cancelAction: @escaping AlertHandler,
//                       _ confirmAction:@escaping AlertHandler) {
//        if let view = view {
//            view.addSubview(self)
//        } else {
//            if RKRoomMgr.shared.rkSDKWindow?.isHidden == false {
//                RKRoomMgr.shared.rkSDKWindow?.addSubview(self)
//            } else if let rootNav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
//                rootNav.view.addSubview(self)
//            }
//        }
//        
//        self.alertCancelHandler = cancelAction
//        self.alertConfirmHandler = confirmAction
//        
//        self.snp.makeConstraints { (make) in
//            make.top.left.width.height.equalToSuperview()
//        }
//        
//        self.titleLabel.text = title
//        if cancelTitle != nil {
//            self.cancelButton.setTitle(cancelTitle, for: .normal)
//        }
//        
//        if confirmTitle != nil {
//            self.confirmButton.setTitle(confirmTitle, for: .normal)
//        }
//        
//        if cancelTitle == nil {
//            lineV.isHidden = true
//            self.confirmButton.snp.makeConstraints { (make) in
//                make.left.width.equalToSuperview()
//            }
//        }
//        
//        if confirmTitle == nil {
//            lineV.isHidden = true
//            self.cancelButton.snp.makeConstraints { (make) in
//                make.left.width.equalToSuperview()
//            }
//        }
//    }
//    
//    @objc func customActionBtnClicked(_ sender: UIButton) {
//        self.alpha = 0
//        self.removeFromSuperview()
//        switch sender {
//        case self.cancelButton:
//            self.alertCancelHandler?()
//        case self.confirmButton:
//            self.alertConfirmHandler?()
//        default: break
//        }
//    }
//}
