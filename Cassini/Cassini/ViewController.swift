//
//  ViewController.swift
//  Cassini
//
//  Created by WangDa on 12/16/15.
//  Copyright © 2015 dawang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier{
                switch identifier {
                case "this":
                    ivc.imageURL = URLs.GOOD.This
                    ivc.title = "This"
                case "is":
                    ivc.imageURL = URLs.GOOD.Is
                    ivc.title = "is"
                case "destiny":
                    ivc.imageURL = URLs.GOOD.Destiny
                    ivc.title = "Destiny"
                default: break
                }
                
            }
        }
    }


}

