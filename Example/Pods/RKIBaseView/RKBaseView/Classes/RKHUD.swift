//
//  RKHUD.swift
//  RokidSDK
//
//  Created by Rokid on 2021/8/25.
//

import UIKit

public class RKHUD: UIView {
    
   public static let sharedView = RKHUD()
    
    let bgView = UIView()
    
    let imageView = UIImageView()
    
    public func setupView()  {
        
        bgView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.6)
        bgView.tag = 999
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = 10
        bgView.snp.makeConstraints { (make) in
            make.size.equalTo(70)
            make.center.equalToSuperview()
        }
        
        let image = UIImage(named: "rk_loading")
        imageView.image = image
        bgView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(34)
            make.center.equalToSuperview()
        }
        
    }
    
   public func show(_ inView: UIView) {
        if let _ = inView.viewWithTag(999) {
            return
        }
        
        inView.isUserInteractionEnabled = false
        
        inView.addSubview(bgView)
        
        setupView()
        
        addAnimation()
    }
    
    public func dismiss(_ inView: UIView) {
        guard let view = inView.viewWithTag(999) else {
            return
        }
        
        inView.isUserInteractionEnabled = true
        
        view.layer.removeAllAnimations()
        
        view.removeFromSuperview()
    }
    
    public func addAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber(floatLiteral: .pi * 2)
        animation.duration = 1
        animation.isCumulative = true
        animation.repeatCount = 1000
        imageView.layer.add(animation, forKey: "rotationAnimation")
    }
}

public extension RKHUD {
    /// 加载中
    class func show(inView: UIView?) {
        guard let view = inView else {
            return
        }
        
        sharedView.show(view)
    }
    /// 移除
    class func dismiss(inView: UIView?) {
        guard let view = inView else {
            return
        }
        
        sharedView.dismiss(view)
    }
    
}

