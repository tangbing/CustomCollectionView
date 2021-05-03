//
//  GlobalConstraint.swift
//  SwiftTbSettingProject
//
//  Created by Tb on 2021/5/2.
//

import UIKit


let kScreenH = UIScreen.main.bounds.size.height
let kScreenW = UIScreen.main.bounds.size.width
let statusBarH = UIApplication.shared.statusBarFrame.height
let navigationBarH: CGFloat = 44
let tabbarExtraH: CGFloat = hasTopNotch() ? 34 : 0
var keyWindow: UIWindow {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first { $0.isKeyWindow }!
    } else {
        return UIApplication.shared.keyWindow!
    }
}
