//
//  UIViewController.swift
//  ZExtension
//
//  Created by Omar Allaham on 1/22/17.
//  Copyright © 2017 bemaxnet. All rights reserved.
//

import UIKit

/**

 UIViewController extension providing additional functunality

 */
public extension UIViewController {

   /**
    
    Instantiate an instance of the type passed
    
    Example:

         let viewController = UIViewController().ofType(UIViewController.self)
    
    - Parameters:
      - type: The Type of the returned controller.
    
    - Returns:
      An instance of the the passed type

    */
   public func ofType <T: UIViewController>(_ type: T.Type) -> T {

      let viewController = named("\(type)")

      assert(viewController.isKind(of: T.self), "The found viewController is not of type \(type)")

      return viewController as! T
   }


   /**
    
    Instantiate an instance of the type passed
    
    Example:

         let viewController = UIViewController.ofType(UIViewController.self, in: "Main")
    
    - Parameters:
      - type: The Type of the returned controller.

      - storyboard: The name of the storyboard containing the controller

    - Returns:
    An instance of the the passed type

    */
   public class func ofType <T: UIViewController>(_ type: T.Type, in storyboard: String) -> T {

      let viewController = named("\(type)", in: storyboard)

      assert(viewController.isKind(of: T.self), "The found viewController is not of type \(type)")

      return viewController as! T
   }

   /**
    
    Instantiate an instance of UIViewController from nib file
    
    Example:
    
         let viewController = UIViewController.fromNib("nibName")
    
    - Parameters:
      - nibName: The name of the nib containing the controller.

    - Returns:
    An instance of UIViewController

    */
   public class func fromNib(_ nibName: String) -> UIViewController {
      return UIViewController(nibName: nibName, bundle: nil)
   }

   /**
    
    Instantiate an instance of UIViewController from the current storyboard using the controller identifier

    Example:

         let viewController = UIViewController().named("viewController")
    
    - Parameters:
      - identifier: The identifier of the controller.

    - Returns:
    An instance of UIViewController

    */
   public func named(_ identifier: String) -> UIViewController {

      let storyboard = self.storyboard

      assert(storyboard != nil, "The ViewController was not created from a storyboard")

      let controller = storyboard!.instantiateViewController(withIdentifier: identifier)

      return controller
   }

   /**
    
    Instantiate an instance of UIViewController from the passed storyboard using the controller identifier

    Example:

         let viewController = UIViewController.named("viewController", in: "main")

    */
   public class func named(_ identifier: String, in storyboard: String) -> UIViewController {

      let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)

      return storyboard.instantiateViewController(withIdentifier: identifier)
   }
}
