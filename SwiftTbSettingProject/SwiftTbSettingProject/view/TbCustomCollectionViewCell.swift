//
//  TbCustomCollectionViewCell.swift
//  SwiftTbSettingProject
//
//  Created by Tb on 2021/5/2.
//

import UIKit
import SnapKit

class TbCustomCollectionViewCell: UICollectionViewCell {
    
    var imageDataModel : ImageDataModel? {
        didSet {
            titleLabel.text = imageDataModel?.imageTitle
            imageView.image = UIImage(named: imageDataModel?.imageName ?? "")
        }
    }
    
    var titleLabel : UILabel = UILabel()
    var imageView : UIImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviewLayout() {
        
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 28, height: 28))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(10)
        }
        
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(imageView)
            $0.top.equalTo(imageView.snp_bottom).offset(10)
            $0.height.equalTo(20)
        }
    }
}
