//
//  ViewController.swift
//  iOSSwift4
//
//  Created by Xurpas Enterprise on 16/04/2018.
//  Copyright © 2018 Xurpas Enterprise. All rights reserved.
//

import UIKit


class ItemDetailsController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    // MARK: UI Properties
    @IBOutlet weak var txtFishName: UITextField!
    @IBOutlet weak var lblFishName: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        // Handle the text field’s user input through delegate callbacks.
        txtFishName.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        
        txtFishName.resignFirstResponder() // hide keyboard
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblFishName.text = textField.text
        print("textFieldDidEndEditing")
    }
    
    //MARK: Action Fish Details
    @IBAction func btnSaveAction(_ sender: Any) {
        print("Click Save")
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
         txtFishName.resignFirstResponder() // hide keyboard
        
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            
            
        }
        // Set photoImageView to display the selected image.
        photoView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
}


