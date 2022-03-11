//
//  RKBaseTableView.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/12.
//
import RKIUtils

public typealias RefreshHandler = () -> Void

open class RKBaseTableView: UITableView {
    
    open var refreshHandler: RefreshHandler?
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    open func setupView()  {
        self.separatorStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsVerticalScrollIndicator = false
        self.tableFooterView = UIView(frame: .zero)
        
        self.rowHeight = UITableView.automaticDimension
    }
    
    open func refreshAction(_ handeler: @escaping RefreshHandler) {
        self.refreshHandler = handeler
    }
    
    @objc public func customActionBtnClicked(_ sender: UIButton) {
        self.refreshHandler?()
    }
    
    open lazy var noNetworkView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xFFFFFF)
        
        let iconImageView = UIImageView()
        let accImage = UIImage(named: "rk_nonetwork")
        iconImageView.image = accImage
        view.addSubview(iconImageView)
        
        let titleLable = UILabel()
        titleLable.textAlignment = .center
        titleLable.font = UIFont.boldSystemFont(ofSize: 16)
        titleLable.textColor = UIColor(hex: 0x2D2D2D)
        titleLable.text = LocalizedString("custom_network_title")
        view.addSubview(titleLable)
        
        let tipsLabel = UILabel()
        tipsLabel.textAlignment = .center
        tipsLabel.font = UIFont.systemFont(ofSize: 14)
        tipsLabel.textColor = UIColor(hex: 0x121010, alpha: 0.5)
        tipsLabel.text = LocalizedString("custom_network_tip")
        view.addSubview(tipsLabel)
        
        let refreshButton = UIButton(type: .custom)
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = 2
        refreshButton.titleLabel!.font = RKFont.font_mainText
        refreshButton.setTitle(LocalizedString("custom_btntitle_refresh"), for: .normal)
        refreshButton.addTarget(self, action: #selector(customActionBtnClicked(_:)), for: .touchUpInside)
        refreshButton.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
        refreshButton.setBackgroundImage(UIImage(color: UIColor(hex: 0x1759F5)), for: .normal)
        refreshButton.setBackgroundImage(UIImage(color: UIColor(hex: 0x1759F5, alpha: 0.8)), for: .highlighted)
        view.addSubview(refreshButton)
        
        iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(100)
            make.bottom.equalTo(titleLable).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        titleLable.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(24)
            make.bottom.equalTo(view.snp_centerY)
        }
        
        tipsLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(view.snp_centerY)
        }
        
        refreshButton.snp.makeConstraints { (make) in
            make.top.equalTo(tipsLabel.snp_bottom).offset(94)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(42)
        }
        
        return view
    }()
    
    open lazy var emptyView: RKEmptyView = {
        let view = RKEmptyView()
        
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        return view
    }()
}
