//
//  constant.swift
//  Dorothy
//
//  Created by Adarsh Raj on 12/07/21.
//

import Foundation
import UIKit
import KRProgressHUD


let SERVICE_CALL:ServiceCall = ServiceCall.sharedInstance

public typealias EIArray = [Any]
public typealias EIDictonary = [String:Any]
public typealias EIDictonaryArray = [[String:Any]]

let hot_pink_color = UIColor(hexString: "#F60151")
let gray_color = UIColor(hexString: "#A7A7A7")
let dark_black_color = UIColor(hexString: "#000000")
let light_black_color = UIColor(hexString: "#242323")
let white_color = UIColor(hexString: "#FFFFFF")
let green_color = UIColor(hexString: "#1CA041")

//Shadow
extension UIView
{
    func dropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 5)
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
        //layer.cornerRadius = 20
    }
    
    func roundShadow()
    {
        clipsToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 5
    }
}

//MARK:- Button Curve Here
extension UIButton {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11, *) {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask

        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}


//MARK:- For Indicator
class ProgressHud {
  
    static func show() {
        DispatchQueue.main.async {
            KRProgressHUD.show()
        }
    }
    
    static func hide() {
        DispatchQueue.main.async {
            KRProgressHUD.dismiss()
        }
    }
 
}

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}


class CustomSegmentedControl: UISegmentedControl{
    private let segmentInset: CGFloat = 2
   private let segmentImage: UIImage? = UIImage(color: light_black_color)
   // private let segmentImage = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)

    override func layoutSubviews(){
        super.layoutSubviews()

        //background
        layer.cornerRadius = 20
        //foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView
        {
            
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = 20
        }
    }
}

extension UIImage{
    
    //creates a UIImage given a UIColor
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 0.5, height: 0.5)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 10.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
