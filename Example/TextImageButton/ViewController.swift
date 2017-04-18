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
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTitle), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    let baseText = "TextImageButton "
    let additionalText = "is autolayout compatible!"
    lazy var additionalCharacterIndex: String.Index = { return self.additionalText.startIndex }()
    
    func updateTitle() {
        let title = baseText + additionalText.substring(to: additionalCharacterIndex)
        textImageButton.setTitle(title, for: .normal)
        
        if additionalCharacterIndex == additionalText.endIndex {
            additionalCharacterIndex = additionalText.startIndex
        } else {
            additionalCharacterIndex = additionalText.index(after: additionalCharacterIndex)
        }
    }
    
    @IBAction func changeSide(_ sender: UISegmentedControl) {
        textImageButton.imagePosition = (sender.selectedSegmentIndex == 0) ? .left : .right
    }
    
    @IBAction func changeSpacing(_ sender: UISlider) {
        textImageButton.spacing = CGFloat(sender.value)
    }

}

