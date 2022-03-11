//
//  BaseLandscapeViewController.swift
//  RokidSDK
//
//  Created by Rokid on 2021/7/27.
//

import Foundation
import RKIUtils

public class RKBaseLandscapeViewController: RKBaseViewController {
    // 当前页面是否设置过了横屏
    var isSetLandscape: Bool = false
    
    public override var shouldAutorotate: Bool {
        return true
    }
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RKColor.BgColor
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        if isSetLandscape == false {
            isSetLandscape = true
            UIDevice.deviceNewOrientation(.landscape)
        }
    }
    
}
