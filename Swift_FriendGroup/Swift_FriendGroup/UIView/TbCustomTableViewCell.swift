//
//  TbCustomTableViewCell.swift
//  Swift_FriendGroup
//
//  Created by Tb on 2021/5/15.
//

import UIKit
import SnapKit
import YYKit

class TbCustomTableViewCell: UITableViewCell {
    
    var model : DataModel? {
        didSet {
            guard let dataModel = model else {return}
            
            topView.userNameLabel.text = dataModel.userName
            topView.averageImageView.kf.setImage(with: URL(string: dataModel.promfileImageViweUrl ?? "" )!)
            topView.createAtLabel.text = dataModel.createAt
            
            self.contentLabel.text = dataModel.commentText
            contentLabel.tb_height = dataModel.commentTextHeight

            
            self.imageContainer.setData(imageData: dataModel.imageDataModel)
            let size = dataModel.photoViewSize
            imageContainer.tb_y = self.contentLabel.tb_bottom + 15
            imageContainer.tb_x = 15
            imageContainer.size = CGSize(width: size.width, height: size.height)
            print("frame",imageContainer.frame)
            
        }
    }

    private lazy var topView : TopView = {
        let lb = TopView.InitTopView()
        return lb
    }()
    
    private lazy var contentLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = .red
        lb.numberOfLines = 0
        lb.font = .boldSystemFont(ofSize: 16)
        return lb
    }()
    
    private lazy var avater : UIImageView = {
        let im = UIImageView()
        im.layer.cornerRadius = 22
        im.layer.masksToBounds = true
        return im
    }()
    
    private lazy var imageContainer : TbImageViewContainer = {
        let im = TbImageViewContainer(images: [imageModels]())
        return im
    }()
    
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupSubViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViewLayout() {
        self.contentView.addSubview(topView)
        topView.backgroundColor = .yellow
        topView.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.height.equalTo(60)
        }
        //topView.frame = CGRect(x: 0, y: 0, width: self.contentView.tb_width, height: 60)

        print("topView",topView.tb_bottom)

        self.contentView.addSubview(contentLabel)
        contentLabel.tb_x = 15
        contentLabel.tb_y = topView.tb_bottom + 15
        contentLabel.tb_width = kScreenW - 15 * 2

       
        self.contentView.addSubview(self.imageContainer)
        imageContainer.tb_x = 15
        
    }
    
    
    
}
