//
//  CustomView.swift
//  aTester2
//
//  Created by 3000 on 22/02/2019.
//  Copyright © 2019 n/a. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    /*@IBAction func action(_ sender: Any) {
        self.dateLabel.text = "abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc"
    }
    @IBOutlet weak var btn: UIButton!*/
    
    var labelText: String? {
        get { return dateLabel?.text }
        set { dateLabel.text = newValue }
    }
    
    var color: UIColor? {
        get { return self.contentView.backgroundColor }
        set { self.contentView.backgroundColor = newValue }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
      
        let nib = UINib(nibName: "CustomView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
		// keep this here
      	contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    
    }
    
}
