//
//  UIColor.swift
//  ZExtension
//
//  Created by Omar Allaham on 1/22/17.
//  Copyright © 2017 bemaxnet. All rights reserved.
//

import UIKit

extension UIColor {

   /**

    Instantiate color from hex value. '#' is optional

    */
   convenience init(hex: String) {
      let hexString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
      let scanner            = Scanner(string: hexString)

      scanner.scanLocation = hexString.hasPrefix("#") ? 1 : 0

      var color:UInt32 = 0
      scanner.scanHexInt32(&color)

      let mask = 0x000000FF
      let r = Int(color >> 16) & mask
      let g = Int(color >> 8) & mask
      let b = Int(color) & mask

      let red   = CGFloat(r) / 255.0
      let green = CGFloat(g) / 255.0
      let blue  = CGFloat(b) / 255.0

      self.init(red:red, green:green, blue:blue, alpha:1)
   }

   /**

    Return the hex value of the color with '#'

    The returned value does not have alpha

    */
   var hex: String {
      var r:CGFloat = 0
      var g:CGFloat = 0
      var b:CGFloat = 0
      var a:CGFloat = 0

      getRed(&r, green: &g, blue: &b, alpha: &a)

      let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
      
      return String(format:"#%06x", rgb)
   }
}
