//
//  resultViewController.swift
//  SlidshowApp
//
//  Created by t on 2016/10/26.
//  Copyright © 2016年 hattori. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var resultimage: UIImageView!
    
    var imageWide:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    
        resultimage.image = UIImage(named: imageWide!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
