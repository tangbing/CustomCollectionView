//
//  GlobalFunctions.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//
import UIKit

/// Judge whether the phone has a top notch
func hasTopNotch()-> Bool {
    if #available(iOS 11.0, *) {
        let top = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0
        return top < CGFloat(24) ? false : true
    } else {
        return false
    }
}

/// delay action
func delay(_ timeInterval: TimeInterval, closure: @escaping()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeInterval) {
        closure()
    }
}

func readFile(fileName: String?, fileType: String? = "json") -> String {
    guard let fileName = fileName else { return "" }
    
//    guard let url = URL(string: filePath ?? "")  else {
//        return ""
//    }
    // 这样获取到的data 为nil，为啥？？？
    // let fileData = try? Data(contentsOf: url, options: Data.ReadingOptions.alwaysMapped)

    guard let filePaht = Bundle.main.path(forResource: fileName, ofType: fileType) else {
        print("filePath not found")
        return ""
    }
    
    let fileData = NSData(contentsOfFile: filePaht) as Data?
    
    //let result = try? JSONSerialization.jsonObject(with: fileData!, options: .mutableContainers)
    let result = String(data: fileData!, encoding: .utf8)
  
    return result ?? ""
}

func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
    
      let str = labelStr as NSString
      return str.height(with: font, constrainedToWidth: width)
}



