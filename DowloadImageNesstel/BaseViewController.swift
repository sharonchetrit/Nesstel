//
//  BaseViewController.swift
//  DowloadImageNesstel
//
//  Created by Sharon Chetrit on 16/04/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var mainView:UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        let mainBundle = Bundle.main
        
        if let nibName:String = NSStringFromClass(type(of: self)).components(separatedBy: ".").last
           
        {
            print(nibName)
            
            mainBundle.loadNibNamed(nibName, owner: self, options: nil) // loading the xib file
            
            if( self.mainView != nil )
            {
                self.mainView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
                
                self.mainView.frame = self.view.bounds
                
                self.view.addSubview(self.mainView)
            }
        }
        
        
        
    }
    
}
