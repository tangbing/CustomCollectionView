//
//  DataModel.swift
//  Swift_FriendGroup
//
//  Created by Tb on 2021/5/15.
//

import UIKit
import HandyJSON

struct imageModels : HandyJSON
 {
    var imageTitle: String?
    var imageName: String?
}

struct DataModel : HandyJSON {
   
    var promfileImageViweUrl : String?
    var userName: String?
    var createAt: String?
    var isFoucs : Int = 0
    var shareCount : Int = 0
    var commentCount : Int = 0
    var zanCount : Int = 0
    var commentText: String?
    var commentTextHeight: CGFloat {
        guard let text = commentText else {
            return 0.0
        }
        return getLabHeigh(labelStr: text, font: .boldSystemFont(ofSize: 16), width: kScreenW - 30)
      
    }
    var imageDataModel: [imageModels]?
    var photoViewSize : CGSize {
        guard imageDataModel != nil else {
            return CGSize.zero
        }
        let maxCount = getMaxColCount()
        let totalCol = (imageDataModel?.count ?? 0) % maxCount
        let totalRow = totalCol != 0  ? (imageDataModel?.count ?? 0) / maxCount + 1 : (imageDataModel?.count ?? 0) / maxCount
        let width  = CGFloat(totalCol) * (kPhotoSizeW + kPhotoMargin) - kPhotoMargin;
        let height = CGFloat(totalRow) * (kPhotoSizeW + kPhotoMargin) - kPhotoMargin;
        return CGSize(width: width, height: height)
    }
    
    func getMaxColCount() -> Int {
        return self.imageDataModel?.count == 4 ? 2 : 3
    }
}

struct DataResultModel : HandyJSON {
    var code : String?
    var data : [DataModel]?
}
/*
 {
     "promfileImageViweUrl" : "http://tp2.sinaimg.cn/1640068765/180/40001524099/1",
     "userName" : "xxxo",
     "createAt" : "05-14",
     "isFoucs" : 1,
     "shareCount" : 2442,
     "commentCount" : 3223,
     "zanCount" : 4,
     "commentText" : "您好，根据您的问题，您可以修改进入房间时的参数 ，不要开启摄像头 "
     "imageDataModel" : [
         {"imageTitle" : "待付款",
          "imageName" : "http://ww3.sinaimg.cn/crop.0.126.980.300/8eadec9egw1ebx87bruyaj20r80fbwku.jpg"}
     ]
 },
 */
