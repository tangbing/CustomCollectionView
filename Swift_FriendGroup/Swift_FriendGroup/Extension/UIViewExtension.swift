//
//  UIViewExtension.swift
//  Swift_FriendGroup
//
//  Created by Tb on 2021/5/15.
//

import UIKit

extension UIView {
    
    var tb_x : CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        get {
            self.frame.origin.x
        }
    }
    
    var tb_y : CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        get {
            self.frame.origin.y
        }
    }
    
    var tb_width : CGFloat {
        set {
            var size = self.frame.size
            size.width = newValue
            frame.size = size
        }
        get {
            self.frame.size.width
        }
    }
    
    
    var tb_height : CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get {
            self.frame.size.height
        }
    }
    
    var tb_bottom : CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
        get {
           self.frame.origin.y + self.frame.size.height  
        }
    }
    
    var tb_right : CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width
            self.frame = frame
        }
        get {
            self.frame.origin.x + self.frame.size.width
        }
    }
}


