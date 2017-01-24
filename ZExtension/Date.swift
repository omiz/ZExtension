//
//  Date.swift
//  ZExtension
//
//  Created by Omar Allaham on 1/22/17.
//  Copyright © 2017 bemaxnet. All rights reserved.
//

import Foundation

/**

 Date extension providing additional functunality

 */
public extension Date {

   /**

    The minutes component in date using the current calender
    
    If the value does not exist 0 will be returned

    */
   public var minute: Int {
      let calendar = Calendar.current
      let components = (calendar as NSCalendar).components(NSCalendar.Unit.minute, from: self)
      let minute = components.minute

      return minute ?? 0
   }

   /**

    The hours component in date using the current calender

    If the value does not exist 0 will be returned

    */
   public var hour: Int {
      let calendar = Calendar.current
      let components = (calendar as NSCalendar).components(NSCalendar.Unit.hour, from: self)
      let hour = components.hour

      return hour ?? 0
   }

   /**

    check if in today date

    */
   public var isToday: Bool {
      return NSCalendar.current.isDateInToday(self)
   }

   /**

    The minutes component to date a given date

    - Parameters:
      - date: the date to compare to
    
    - Returns: minites difference in Int

    */
   public func minute(to date: Date) -> Int {
      let calendar = Calendar.current
      let components = (calendar as NSCalendar).components(NSCalendar.Unit.minute, from: self, to: date, options: [])
      let minute = components.minute

      return minute ?? 0
   }

   /**

    The hours component to date a given date

    - Parameters:
      - date: the date to compare to

    - Returns: hours difference in Int

    */
   public func hour(to date: Date) -> Int {
      let calendar = Calendar.current
      let components = (calendar as NSCalendar).components(NSCalendar.Unit.hour, from: self, to: date, options: [])
      let hour = components.hour

      return hour ?? 0
   }

   /**

    Get a formated date string using DateFormater

    - Parameters:
      - dateStyle: optional DateFormatter.Style default is .short

    - Returns: formated string according to the given style

    */
   public func date(_ dateStyle: DateFormatter.Style = .short) -> String {
      let formatter = DateFormatter()
      formatter.dateStyle = dateStyle
      formatter.timeStyle = .none

      let dateString = formatter.string(from: self)

      return dateString
   }

   /**

    Get a formated time string using DateFormater

    - Parameters:
      - dateStyle: optional DateFormatter.Style default is .short

    - Returns: formated string according to the given style
    
    */
   public func time(_ dateStyle: DateFormatter.Style = .short) -> String {
      let formatter = DateFormatter()
      formatter.dateStyle = .none
      formatter.timeStyle = dateStyle

      formatter.dateFormat = "HH:mm"

      let dateString = formatter.string(from: self)

      return dateString
   }

   /**

    Get a formated time string using DateFormater

    - Parameters:
      - dateFormat: optional string default is "dd.MMMM yyyy, HH:mm"

    - Returns: formated string according to the given style

    */
   public func format(_ dateFormat: String = "dd.MMMM yyyy, HH:mm") -> String {
      let formatter = DateFormatter()

      formatter.dateFormat = dateFormat

      let dateString = formatter.string(from: self)

      return dateString
   }
}
