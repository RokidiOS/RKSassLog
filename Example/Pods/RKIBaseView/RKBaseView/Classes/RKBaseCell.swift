//
//  RKBaseCell.swift
//  RokidSDK
//
//  Created by 金志文 on 2021/9/8.
//

import UIKit

open class RKBaseCell: UITableViewCell {

    public lazy var bgView:UIView = {
        let bgView = UIView()
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().priority(.low)
        }
        return bgView
    }()
    
    public lazy var lineView: UIView = {
        let lineView = UIView()
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        lineView.backgroundColor = .init(hex: 0xF3F3F3)
        return lineView
    }()

}
