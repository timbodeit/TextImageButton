//
//  ViewController.swift
//  TextImageButton
//
//  Created by Tim Bodeit on 08/19/2015.
//  Copyright (c) 2015 Tim Bodeit. All rights reserved.
//

import UIKit
import TextImageButton

class ViewController: UIViewController {

    @IBOutlet weak var textImageButton: TextImageButton!
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTitle", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    let baseText = "TextImageButton "
    let additionalText = "is autolayout compatible!"
    lazy var additionalCharacterIndex: String.Index = { return self.additionalText.startIndex }()
    
    func updateTitle() {
        let title = baseText + additionalText.substringToIndex(additionalCharacterIndex)
        textImageButton.setTitle(title, forState: .Normal)
        
        if additionalCharacterIndex == additionalText.endIndex {
            additionalCharacterIndex = additionalText.startIndex
        } else {
            additionalCharacterIndex = additionalCharacterIndex.successor()
        }
    }
    
    @IBAction func changeSide(sender: UISegmentedControl) {
        textImageButton.imagePosition = (sender.selectedSegmentIndex == 0) ? .Left : .Right
    }
    
    @IBAction func changeSpacing(sender: UISlider) {
        textImageButton.spacing = CGFloat(sender.value)
    }

}

