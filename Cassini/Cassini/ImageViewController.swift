//
//  ImageViewController.swift
//  Cassini
//
//  Created by WangDa on 12/16/15.
//  Copyright © 2015 dawang. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate{

    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
 
    private func fetchImage(){
        if let url = imageURL {
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            spinner?.startAnimating()
            dispatch_async(dispatch_get_global_queue(qos, 0)) {
                () -> Void in
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    if url == self.imageURL{
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        } else {
                            self.image = nil
                        }
                    }
                }
                
            }
            
            
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.3
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
}
