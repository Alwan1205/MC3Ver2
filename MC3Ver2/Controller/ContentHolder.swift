//
//  ContentHolder.swift
//  MC3Ver2
//
//  Created by Davin Pratama on 22/08/18.
//  Copyright © 2018 MalasCorp. All rights reserved.
//

import UIKit

class ContentHolder: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    var imageFileName: String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myImageView.image = UIImage(named: imageFileName)
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
