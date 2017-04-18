//
//  UIEdgeInsets+HorizontalAdjustment.swift
//  TextImageButton
//
//  Created by Tim Bodeit on 04/12/15.
//
//

import UIKit

extension UIEdgeInsets {
  
  /**
  Relatively adjusts the left and right parameters of a given UIEdgeInsets by the given values
  
  - parameter left:  The value to add to the left parameter of the edge inset
  - parameter right: The value to add to the right parameter of the edge inset
  
  - returns: The adjusted edge inset
  */
  func adjust(left: CGFloat, right: CGFloat) -> UIEdgeInsets {
    var edgeInsets = self
    edgeInsets.left += left
    edgeInsets.right += right
    
    return edgeInsets
  }
  
}
