//
//  TbCustomTableViewCell.swift
//  SwiftTbSettingProject
//
//  Created by Tb on 2021/5/2.
//

import UIKit
import SnapKit



class TbCustomTableViewCell: UITableViewCell {
    private let Identifier = "collectionViewIdentifier"
    
    var mineModel : MineModel? {
        didSet {
            titleLabel.text = mineModel?.headerTitle
            
            self.customCollectionView.reloadData()
        }
    }
    
    var itemClickBlock : ((_ itemModel: ImageDataModel) -> Void)?
    
    private lazy var customCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (kScreenW - 15 * 4) / 4, height: 80)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.register(TbCustomCollectionViewCell.self, forCellWithReuseIdentifier: Identifier)
        return cv
    }()
    
    private lazy var titleLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = .lightGray
        lb.font = .boldSystemFont(ofSize: 16)
        return lb
    }()
    
    private lazy var containerView : UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 12
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.setupSubViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupSubViewLayout(){
        self.contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(self.contentView.snp_left).offset(15)
            $0.right.equalTo(self.contentView.snp_right).offset(-15)
        }
                
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.containerView.snp_left).offset(15)
            $0.top.equalTo(self.containerView.snp_top).offset(15)
            $0.height.equalTo(30)
        }
        
        containerView.addSubview(customCollectionView)
        customCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp_bottom)
            $0.bottom.equalTo(containerView.snp.bottom).offset(-15)
            $0.left.equalTo(titleLabel.snp_left)
            $0.right.equalTo(self.containerView.snp_right).offset(-15)
        }
    }
    
}

extension TbCustomTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mineModel?.imageDataModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as! TbCustomCollectionViewCell
        let model = self.mineModel?.imageDataModel![indexPath.item]
        cell.imageDataModel = model
        
        return cell
    }
}

extension TbCustomTableViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let model = self.mineModel?.imageDataModel![indexPath.item],
           let itemClickBlock = itemClickBlock{
            itemClickBlock(model)
        }
        print("indexPath item:\(indexPath.item)")
    }
}
