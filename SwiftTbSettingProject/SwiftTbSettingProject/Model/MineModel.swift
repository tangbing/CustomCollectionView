//
//  MineModel.swift
//  SwiftTbSettingProject
//
//  Created by Tb on 2021/5/2.
//

import UIKit
import KakaJSON


struct ImageDataModel : Convertible {
    var imageTitle: String = ""
    var imageName:  String = ""
}

struct MineModel : Convertible {
    var headerTitle: String = ""
    var imageDataModel: [ImageDataModel]?
}
