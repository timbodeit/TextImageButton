//
//  UIEdgeInsets+HorizontalAdjustment.swift
//  TextImageButton
//
//  Created by Tim Bodeit on 20/08/15.
//
//

import UIKit

/**
UIButton subclass that allows allows changing spacing between text and image and 
side the image is displayed on.
*/
@objc public class TextImageButton: UIButton {
  
  /// Represents horizontal side for the imagePosition attribute
  @objc public enum Side: Int {
    case Left, Right
  }
  
  /// The spacing between the button image and the button title
  @IBInspectable public var spacing: CGFloat = 0.0 as CGFloat {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }
  
  /// The side of the button to display the image on
  @objc public var imagePosition: Side = Side.Left {
    didSet {
      setNeedsLayout()
    }
  }
  
  /// IBInspectable accessor for imagePosition
  @objc @IBInspectable public var imageOnRight: Bool {
    get {
      return imagePosition == .Right
    }
    set {
      imagePosition = newValue ? .Right : .Left
    }
  }
  
  // MARK: - Spacing
  
  /**
  Controls enabling adjustments of the edgeInsets to realize the spacing.
  Increment to enable, decrement to disable.
  
  Adjustments are enabled for any value > 0
  
  Should only be used inside intristicContentSize and fooRectForBar methods
  */
  private var enableSpacingAdjustments = 0
  
  override public var contentEdgeInsets: UIEdgeInsets {
    get {
      let adjustment = (enableSpacingAdjustments > 0) ? (spacing/2) : 0
      return super.contentEdgeInsets.adjust(left: adjustment, right: adjustment)
    }
    set(contentEdgeInsets) { super.contentEdgeInsets = contentEdgeInsets }
  }
  
  override public var titleEdgeInsets: UIEdgeInsets {
    get {
      let adjustment = (enableSpacingAdjustments > 0) ? (spacing/2) : 0
      return super.titleEdgeInsets.adjust(left: adjustment, right: -adjustment)
    }
    set(titleEdgeInsets) { super.titleEdgeInsets = titleEdgeInsets }
  }
  
  override public var imageEdgeInsets: UIEdgeInsets {
    get {
      let adjustment = (enableSpacingAdjustments > 0) ? (spacing/2) : 0
      return super.imageEdgeInsets.adjust(left: -adjustment, right: adjustment)
    }
    set(imageEdgeInsets) { super.imageEdgeInsets = imageEdgeInsets }
  }
  
  public override func intrinsicContentSize() -> CGSize {
    enableSpacingAdjustments++
    let contentSize = super.intrinsicContentSize()
    enableSpacingAdjustments--
    
    return contentSize
  }
  
  public override func sizeThatFits(size: CGSize) -> CGSize {
    enableSpacingAdjustments++
    let size = super.sizeThatFits(size)
    enableSpacingAdjustments--
    
    return size
  }
  
  public override func contentRectForBounds(bounds: CGRect) -> CGRect {
    enableSpacingAdjustments++
    let contentRect = super.contentRectForBounds(bounds)
    enableSpacingAdjustments--
    
    return contentRect
  }
  
  
  // MARK: - Image Side
  
  public override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
    enableSpacingAdjustments++
    var titleRect = super.titleRectForContentRect(contentRect)
    let imageRect = super.imageRectForContentRect(contentRect)
    enableSpacingAdjustments--
    
    if imagePosition == .Right {
      titleRect.origin.x = imageRect.minX
    }
    
    return titleRect
  }
  
  public override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
    enableSpacingAdjustments++
    let titleRect = super.titleRectForContentRect(contentRect)
    var imageRect = super.imageRectForContentRect(contentRect)
    enableSpacingAdjustments--
    
    if imagePosition == .Right {
      imageRect.origin.x = titleRect.maxX - imageRect.width
    }
    
    return imageRect
  }
}
