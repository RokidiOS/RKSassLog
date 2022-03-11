//
//  RKEmptyView.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/25.
//

open class RKEmptyView: UIView {
    
    public let iconImageView = UIImageView()
    
    public let titleLable = UILabel()
    
    public let tipsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
   public func setupView()  {
        
        self.backgroundColor = UIColor(hex: 0xFFFFFF)

        self.addSubview(iconImageView)
        
        titleLable.textAlignment = .center
        titleLable.font = UIFont.boldSystemFont(ofSize: 16)
        titleLable.textColor = UIColor(hex: 0x000000)
        self.addSubview(titleLable)
        
        tipsLabel.textAlignment = .center
        tipsLabel.font = UIFont.systemFont(ofSize: 14)
        tipsLabel.textColor = UIColor(hex: 0x2D2D2D, alpha: 0.3)
        self.addSubview(tipsLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.bottom.equalTo(titleLable.snp_top).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        titleLable.snp.makeConstraints { (make) in
//            make.width.equalToSuperview()
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp_centerY).offset(20)
        }
        
        tipsLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(titleLable.snp_bottom).offset(10)
        }

    }
    
}
