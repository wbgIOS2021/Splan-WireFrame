

import Foundation
import UIKit

@IBDesignable class ViewDesign: UIView {
    
    @IBInspectable var borderWid : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.borderWid
        }
    }
    
    @IBInspectable var borderColor : UIColor = .clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable var shodow : CGFloat = 0 {
        didSet {
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layer.masksToBounds = false
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 4
            self.layer.rasterizationScale = UIScreen.main.scale
            self.layer.shouldRasterize = true
        }
    }
}

@IBDesignable class RoundView: UIView {
    
    @IBInspectable var borderWid : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.borderWid
            self.clipsToBounds = true
        }
    }
}

@IBDesignable class RoundImage: UIImageView {
    
    @IBInspectable var borderWid : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.borderWid
            self.clipsToBounds = true
        }
    }
}

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var borderWid : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.borderWid
            self.clipsToBounds = true
        }
    }
}

@IBDesignable class TextFieldDesign: UITextField {
    
    @IBInspectable var borderWidt : CGFloat = 0.0 {
        didSet {
               layer.borderWidth = borderWidt
           }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var cournerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cournerRadius
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            self.layer.shadowOpacity = 0.2
            self.layer.shadowRadius = 4.0
            
        }
    }
    
    @IBInspectable var rightSideImage:UIImage? {
        didSet {
            updateRightView()
        }
    }
    
    @IBInspectable var leftSideImage:UIImage? {
        didSet {
            updateleftView()
        }
    }
    
    func updateRightView() {
        //for right Image
        if let image = rightSideImage {
            let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 18, height: 18))
            imageView.image = image
            imageContainerView.addSubview(imageView)
            rightView = imageContainerView
            rightViewMode = .always
        } else {
            rightViewMode = .never
        }
    }
    
    func updateleftView() {
        //for left Image
        if let image = leftSideImage {
            let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 22))
            let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 18, height: 20))
            imageView.image = image
            imageContainerView.addSubview(imageView)
            leftView = imageContainerView
            leftViewMode = .always
            self.tintColor = .lightGray
        } else {
            leftViewMode = .never
        }
    }
    
}
