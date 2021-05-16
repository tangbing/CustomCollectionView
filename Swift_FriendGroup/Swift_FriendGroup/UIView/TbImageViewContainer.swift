//
//  TbImageViewContainer.swift
//  Swift_FriendGroup
//
//  Created by Tb on 2021/5/15.
//

import UIKit
import Kingfisher


let kPhotoSizeW : CGFloat = 70
let kPhotoMargin : CGFloat = 10


struct TbImageViewContainerData<T> {
    var imageData: [T]

    init(with imageData: [T]) {
        self.imageData = imageData
    }
}

class TbImageViewContainer: UIView {

    var images: [imageModels] = [imageModels]()
    var imageViews: [UIImageView] = [UIImageView]()
    
    func getMaxColCount() -> Int {
        return self.images.count == 4 ? 2 : 3
    }
   

    
//    convenience init(images: TbImageViewContainerData<Any>) {
//        self.init(frame: CGRect.zero)
//        self.images = images
//
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(images : [imageModels]) {
        self.init(frame: CGRect.zero)
        self.images = images
        for i in 0..<9 {
            let imageView = UIImageView()
            imageView.tag = i
            self.addSubview(imageView)
            imageViews.append(imageView)
        }
        self.backgroundColor = .lightGray
    }
    
    func setData(imageData: [imageModels]?) {
        guard let images = imageData else {
            print("images nil")
            return
        }
        
        self.images = images
        
        for i in 0..<imageViews.count {
            let iv = self.imageViews[i]
            if i < images.count {
                let model = images[i];
                iv.tag = i
                iv.image = #imageLiteral(resourceName: "weibo_bg")
                iv.isHidden = false
                //iv.kf.setImage(with: URL(string: model.imageName ?? "")!)
            } else {
                iv.isHidden = true
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let photosCount = self.images.count
        for i in 0..<photosCount {
            let iv = self.imageViews[i]
            let col = i % getMaxColCount()
            let row = i / getMaxColCount()
            iv.frame = CGRect(x: CGFloat(col) * (kPhotoSizeW + kPhotoMargin), y: CGFloat(row) * (kPhotoSizeW + kPhotoMargin), width: kPhotoSizeW, height: kPhotoSizeW)
        }
    }


}
