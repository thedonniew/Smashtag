//
//  HashtagViewController.swift
//  Smashtag
//
//  Created by Donnie Wang on 2/28/15.
//  Copyright (c) 2015 Donnie Wang. All rights reserved.
//

import UIKit
import MobileCoreServices

class HashtagViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  present image picker controller
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraUI = UIImagePickerController()
            cameraUI.sourceType = .Camera
            cameraUI.mediaTypes = [kUTTypeImage]
            cameraUI.allowsEditing = true
            cameraUI.delegate = self
            self.presentViewController(cameraUI, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UIImagePickerController delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as String
        
        if mediaType == kUTTypeImage {
            let image = info[UIImagePickerControllerOriginalImage] as UIImage
            
            self.imageView?.image = image
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - IB Actions
    // TODO: open camera again
    @IBAction func retakePhoto(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
