//
//  TweetsViewController.swift
//  Twitter
//
//  Created by George Andrade on 3/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

    @IBOutlet weak var tweetLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLabel.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetLabel.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetLabel.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweet")
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
