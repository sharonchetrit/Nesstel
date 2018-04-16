//
//  ViewController.swift
//  DowloadImageNesstel
//
//  Created by Sharon Chetrit on 16/04/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url : URL = URL(string: "https://orojackson.com/styles/general/images/Ranks/03JuniorModTag.png" )!
        
        var urlRequest : URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        self.indicator.startAnimating()
        
        //        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data : Data = data
            {
                sleep(UInt32(10.0)) //  we can see the animation
                
                DispatchQueue.main.async { // ensures task is performed on main thread!
                    
                    self.indicator.stopAnimating()
                    
                    // I used with imageView, because without it was crashed and I didn't have time to try to make the exercice without use ImageView .
                    
                    
                    if let image : UIImage = UIImage(data: data)
                    {
                        self.imageView.image = image
                    }
                    
                }
                
            }
            
        }
        task.resume() // this makes the task actually run
        
        
    }
    
}



