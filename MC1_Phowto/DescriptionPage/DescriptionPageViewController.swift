//
//  DescriptionViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//  Updated by Agung Davin on 12/04/22.
//  NOTED : INI SAVE BUTTON BLM ADA FUNCTION BUAT KE STORYBOARD LAINNYA
// IMAGE MASIH AMBIL DARI ASSET BELUM GET DARI HASIL KAMERA

import Foundation
import UIKit

class DescriptionPageViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var TextField: UITextView!
    @IBOutlet weak var ImageTaken: UIImageView!
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var TitleTellUs: UILabel!
    
    
    var imageData : UIImage?
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        initialSetup()
        ImageTaken.image = imageData
        TextField.delegate = self
        
        
    }
    
    private func initialSetup(){
        BackgroundView.layer.cornerRadius = 20;
        ImageTaken.layer.cornerRadius = 20;
        TextField.layer.cornerRadius = 15;
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
            
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = self.view.frame.height - (BackgroundView.frame.origin.y + BackgroundView.frame.height)
            self.view.frame.origin.y -= keyboardHeight - bottomSpace
        }
        
    }
    
    @objc private func keyboardWillHide(){
        self.view.frame.origin.y = 0
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textView.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        // make sure the result is under 16 characters
        return updatedText.count <= 150
    }
    
    
    func saveImage(_ image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SelectedModuleViewController
            else {
                return
        }
        destination.modalPresentationStyle = .fullScreen
        destination.subModuleCount += 1
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SelectedDescSegue", sender: nil)

    }
        
    
}
