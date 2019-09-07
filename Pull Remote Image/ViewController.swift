//
//  ViewController.swift
//  Pull Remote Image
//
//  Created by Arif Hosain on 7/9/19.
//  Copyright © 2019 mas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageRealPath = URL(string: "https://enhancv.com/static/caba6481a0970feb2101b0b30078c4f5/dd1a0/Steve_jobs_cover_photo.jpg")
        let request = NSMutableURLRequest(url: imageRealPath!)
        let data = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            //check if there is not pull returned
            if error != nil {
                print("No Image found ")
            }else {
                if let data = data {
                    if let imageData = UIImage(data: data) {    //convert data to image
                        self.imageView.image = imageData        //set image to imaveViewer element
                    } else {
                        print("No data found to convert! ")
                    }
                } else {
                    print("There is not data !")
                }
            }
        }
        data.resume()   //execute the URLSession 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
 

}

