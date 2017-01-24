//
//  UIScrollView.swift
//  ZExtension
//
//  Created by Omar Allaham on 1/22/17.
//  Copyright © 2017 bemaxnet. All rights reserved.
//

import UIKit

extension UIScrollView {

   /**
    
    Scrol to top
    
    - Parameters:
      - animated: of type bool default is true

    */
   func scrollToTop(animated: Bool = true) {
      setContentOffset(CGPoint.zero, animated: animated)
   }

   /**

    Scrol to bottom
    
    - Parameters:
      - animated: of type bool default is true

    */
   func scrollToBottom(animated: Bool = true) {
      let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
      setContentOffset(bottomOffset, animated: animated)
   }
}
