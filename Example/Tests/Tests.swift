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
      button.setImage(image, for: .normal)
      button.setTitle("I'm a TextImageButton", for: .normal)
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
      let contentRectBefore = button.contentRect(forBounds: button.bounds)
      let sizeBefore = button.titleRect(forContentRect: contentRectBefore).size
      button.spacing = 50
      button.imagePosition = .right
      button.sizeToFit()
      button.layoutIfNeeded()
      let contentRectAfter = button.contentRect(forBounds: button.bounds)
      let sizeAfter = button.titleRect(forContentRect: contentRectAfter)
      
      expect(sizeBefore.width).to(beCloseTo(sizeAfter.width))
      expect(sizeBefore.height).to(beCloseTo(sizeAfter.height))
    }
    
    it("maintainas image size") {
      let contentRectBefore = button.contentRect(forBounds: button.bounds)
      let sizeBefore = button.imageRect(forContentRect: contentRectBefore).size
      button.spacing = 50
      button.imagePosition = .right
      button.sizeToFit()
      button.layoutIfNeeded()
      let contentRectAfter = button.contentRect(forBounds: button.bounds)
      let sizeAfter = button.imageRect(forContentRect: contentRectAfter)
      
      expect(sizeBefore.width).to(beCloseTo(sizeAfter.width))
      expect(sizeBefore.height).to(beCloseTo(sizeAfter.height))
    }
    
    context("imagePosition .left") {
      
      it("places image on the very left") {
        let contentRect = button.contentRect(forBounds: button.bounds)
        let imageRect = button.imageRect(forContentRect: contentRect)
        
        expect(imageRect.minX).to(beCloseTo(button.bounds.minX))
      }
      
      it("places title on the very right") {
        let contentRect = button.contentRect(forBounds: button.bounds)
        let titleRect = button.titleRect(forContentRect: contentRect)
        
        expect(titleRect.maxX).to(beCloseTo(button.bounds.maxX))
      }
    }
    
    context("imagePosition .right") {
      beforeEach {
        button.imagePosition = .right
        button.spacing = 10
        button.sizeToFit()
        button.layoutIfNeeded()
      }
      
      it("places image on the very right") {
        let contentRect = button.contentRect(forBounds: button.bounds)
        let imageRect = button.imageRect(forContentRect: contentRect)
        
        expect(imageRect.maxX).to(beCloseTo(button.bounds.maxX))
      }
      
      it("places title on the very left") {
        let contentRect = button.contentRect(forBounds: button.bounds)
        let titleRect = button.titleRect(forContentRect: contentRect)
        
        expect(titleRect.minX).to(beCloseTo(button.bounds.minX))
        
      }
    }
    
  }

}
