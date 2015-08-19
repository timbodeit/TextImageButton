import UIKit
import Quick
import Nimble
import TextImageButton

class LineSpec: QuickSpec {
  
  override func spec() {
    var button: TextImageButton!
    
    beforeEach {
      button = TextImageButton()
      
      let image = UIImage(named: "Beachball")
      button.setImage(image, forState: .Normal)
      button.setTitle("I'm a TextImageButton", forState: .Normal)
      button.sizeToFit()
      button.layoutIfNeeded()
    }
    
    it("adds the desired spacing") {
      let widthBefore = button.frame.size.width
      button.spacing = 50
      button.sizeToFit()
      expect(button.frame.width).to(beCloseTo(widthBefore + 50))
    }
    
    it("maintainas title size") {
      let contentRectBefore = button.contentRectForBounds(button.bounds)
      let sizeBefore = button.titleRectForContentRect(contentRectBefore).size
      button.spacing = 50
      button.imagePosition = .Right
      button.sizeToFit()
      button.layoutIfNeeded()
      let contentRectAfter = button.contentRectForBounds(button.bounds)
      let sizeAfter = button.titleRectForContentRect(contentRectAfter)
      
      expect(sizeBefore.width).to(beCloseTo(sizeAfter.width))
      expect(sizeBefore.height).to(beCloseTo(sizeAfter.height))
    }
    
    it("maintainas image size") {
      let contentRectBefore = button.contentRectForBounds(button.bounds)
      let sizeBefore = button.imageRectForContentRect(contentRectBefore).size
      button.spacing = 50
      button.imagePosition = .Right
      button.sizeToFit()
      button.layoutIfNeeded()
      let contentRectAfter = button.contentRectForBounds(button.bounds)
      let sizeAfter = button.imageRectForContentRect(contentRectAfter)
      
      expect(sizeBefore.width).to(beCloseTo(sizeAfter.width))
      expect(sizeBefore.height).to(beCloseTo(sizeAfter.height))
    }
    
    context("imagePosition .Left") {
      
      it("places image on the very left") {
        let contentRect = button.contentRectForBounds(button.bounds)
        let imageRect = button.imageRectForContentRect(contentRect)
        
        expect(imageRect.minX).to(beCloseTo(button.bounds.minX))
      }
      
      it("places title on the very right") {
        let contentRect = button.contentRectForBounds(button.bounds)
        let titleRect = button.titleRectForContentRect(contentRect)
        
        expect(titleRect.maxX).to(beCloseTo(button.bounds.maxX))
      }
    }
    
    context("imagePosition .Right") {
      beforeEach {
        button.imagePosition = .Right
        button.spacing = 10
        button.sizeToFit()
        button.layoutIfNeeded()
      }
      
      it("places image on the very right") {
        let contentRect = button.contentRectForBounds(button.bounds)
        let imageRect = button.imageRectForContentRect(contentRect)
        
        expect(imageRect.maxX).to(beCloseTo(button.bounds.maxX))
      }
      
      it("places title on the very left") {
        let contentRect = button.contentRectForBounds(button.bounds)
        let titleRect = button.titleRectForContentRect(contentRect)
        
        expect(titleRect.minX).to(beCloseTo(button.bounds.minX))
        
      }
    }
    
  }

}
