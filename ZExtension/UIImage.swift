//
//  UIImage.swift
//  ZExtension
//
//  Created by Omar Allaham on 1/22/17.
//  Copyright © 2017 bemaxnet. All rights reserved.
//

import UIKit

extension UIImage {

   /**

    Generate a gradient UIImage

    - Parameters:
      - start: the start color
      - end: the end color
      - frame: the frame for the gradient layer
      - startLocation: the location of the start color between 0.0 and 1.0 default is 0.05
      - endLocation: the location of the end color between 0.0 and 1.0 default is 0.95

    - Returns: the generated image from the given values

    */
   class func gradient(start: UIColor, end: UIColor, frame: CGRect, startLocation: Double = 0.05, endLocation: Double = 0.95) -> UIImage {

      // start with a CAGradientLayer
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame = frame

      gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
      gradientLayer.endPoint   = CGPoint(x: 1, y: 0.5)

      gradientLayer.colors    = [start.cgColor, end.cgColor]
      gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]

      // now build a UIImage from the gradient
      UIGraphicsBeginImageContext(gradientLayer.bounds.size)
      gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
      let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      // return the gradient image
      return gradientImage!
   }

   /**

    Instantiate a UIImage from color in given frame

    - Parameters:
      - color: The color of the image
      - size: the size of the returned image default is CGSize(width: 10, height: 10)

    */
   convenience init(color: UIColor, size: CGSize = CGSize(width: 10, height: 10)) {
      let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
      UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
      color.setFill()

      UIRectFill(rect)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      self.init(cgImage: image!.cgImage!)
   }

   /**

    Instantiate a UIImage from color in given frame

    - Parameters:
      - radius: optional radius of the image default is max(size.width, size.width)

    - Returns: the generated UIImage

    */
   func corner(_ radius: CGFloat? = nil) -> UIImage {

      let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)

      UIGraphicsBeginImageContextWithOptions(self.size, false, 1)

      let radius = radius ?? max(size.width, size.width)

      UIBezierPath(roundedRect: rect, cornerRadius: radius).addClip()

      self.draw(in: rect)

      return UIGraphicsGetImageFromCurrentImageContext()!
   }

   /**

    Calculate the UIImage bytes based on UIImageJPEGRepresentation
    
    If the calculation failed 0 will be returned

    */
   var bytes: Int {

      return UIImageJPEGRepresentation(self, 0)?.count ?? 0
   }
}
