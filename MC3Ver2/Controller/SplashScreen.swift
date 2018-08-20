//
//  SplashScreen.swift
//  MC3Ver2
//
//  Created by Davin Pratama on 20/08/18.
//  Copyright © 2018 MalasCorp. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Thread.sleep(forTimeInterval: 2)
        fade()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3)
        {
            //self.performSegue(withIdentifier: “GoToHome”, sender: self)
            self.performSegue(withIdentifier: "GoToHome", sender: self)
        }
    }
    
    @IBOutlet weak var logoSplash: UIImageView!
    
    
    func fade(){
        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.logoSplash.alpha = 1
        }) { (finished) in
            UIView.animate(withDuration: 1, delay: 1.5, options: UIViewAnimationOptions.allowUserInteraction, animations: {
                self.logoSplash.alpha = 0
            }) { (finished) in
            }
        }
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
