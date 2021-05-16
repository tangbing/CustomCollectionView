//
//  topView.swift
//  Swift_FriendGroup
//
//  Created by Tb on 2021/5/15.
//

import UIKit

class TopView: UIView {
    
    @IBOutlet weak var averageImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var attentButton: UIButton!
    @IBOutlet weak var createAtLabel: UILabel!
    
    

    class func InitTopView() -> TopView {
        return Bundle.main.loadNibNamed("TopView", owner: nil, options: nil)?.first as! TopView
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func attentButtonClick(_ sender: UIButton) {
    }
    
    
}
