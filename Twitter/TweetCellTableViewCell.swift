//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by George Andrade on 3/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var favorited = false
    var tweetID = -1
    var retweeted:Bool = false
    
    func setFavorite(_isFavorited: Bool) {
        favorited = _isFavorited
        if (favorited) {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_isRetweeted: Bool) {
        retweeted = _isRetweeted
        if (retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)

        }
    }
    
    
    
    
    @IBAction func retweet(_ sender: Any) {
        var toBeRetweeted = !retweeted
        if (toBeRetweeted) {
            TwitterAPICaller.client?.reTweet(tweetID: tweetID, success: {
                self.setRetweeted(_isRetweeted: true)
            }, failure: { (Error) in
                print("retweet did not succeed")
            })
        } else {
            TwitterAPICaller.client?.unretweet(tweetID: tweetID, success: {
                self.setRetweeted(_isRetweeted: false)
            }, failure: { (Error) in
                print("unretweet did not succeed")
            })
        }
    }
    
   
    @IBAction func like(_ sender: Any) {
        var toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(_isFavorited: true)
            }, failure: { (Error) in
                print("Favorite did not succeed")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(_isFavorited: false)
            }, failure: {(Error) in
                print("Unfavorite did not succeed")
            })
        }

    }
    
    

}
