
//  ViewController.swift
//  LatihanScrollView
//
//  Created by Ariel Waraney on 08/04/22.
//

import UIKit

class ReflectionViewController: UIViewController {

    @IBOutlet weak var scrollViewProgress: UIScrollView!
    
    @IBOutlet weak var imageTaken: UIImageView!
    
    @IBOutlet weak var feelingField: UITextField!
    @IBOutlet weak var thoughtField: UITextField!
    @IBOutlet weak var positionField: UITextField!
    
    //how was your feeling after learning ?
    let feelings = ["Exciting 🤩", "Happy 😄", "Good 😐", "Sad ☹️", "Confused 😩"]
    
    //what do you think about your shot?
    let thoughts = ["Fantastic ✨", "Good 👍", "So-So 👌", "Need More Practice 💪"]
    
    //Where you now after learning this topic?
    let positions = ["Still Need More Practice ⏰", "Now I Know 💡", "I Understand Better 🔑", "I Can Implement 📸"]
    var imageData : UIImage?
    var feelingPickerView = UIPickerView()
    var thoughtPickerView = UIPickerView()
    var positionPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set scroll view position
        scrollViewProgress.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
        
        imageTaken.image = imageData
        // Do any additional setup after loading the view.
        feelingField.inputView = feelingPickerView
        thoughtField.inputView = thoughtPickerView
        positionField.inputView = positionPickerView
        
        //delegate & data sourcing
        feelingPickerView.delegate = self
        thoughtPickerView.delegate = self
        positionPickerView.delegate = self
        feelingPickerView.dataSource = self
        thoughtPickerView.dataSource = self
        positionPickerView.dataSource = self
        
        //tagging
        feelingPickerView.tag = 1
        thoughtPickerView.tag = 2
        positionPickerView.tag = 3
        
        //hide the selector when tap outside
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSelector)))
        
        //observer for shifting view
        NotificationCenter.default.addObserver(self, selector: #selector(selectorWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(selectorWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipe))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc private func hideSelector(){
        self.view.endEditing(true)
    }
    
    @objc private func selectorWillShow(notification: NSNotification) {
        
        if let keybaordFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = keybaordFrame.cgRectValue.height
            //shift up
            self.view.frame.origin.y -= height
        }
    }
    
    @objc private func selectorWillHide() {
        self.view.frame.origin.y = 0
    }
}

extension ReflectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return feelings.count
        case 2:
            return thoughts.count
        case 3:
            return positions.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return feelings[row]
        case 2:
            return thoughts[row]
        case 3:
            return positions[row]
        default:
            return "Data Not Found!"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            feelingField.text = feelings[row]
            feelingField.layer.cornerRadius = 2
            feelingField.layer.borderWidth = 1
            feelingField.layer.borderColor = UIColor.green.cgColor
            feelingField.resignFirstResponder()
        case 2:
            thoughtField.text = thoughts[row]
            thoughtField.layer.cornerRadius = 2
            thoughtField.layer.borderWidth = 1
            thoughtField.layer.borderColor = UIColor.green.cgColor
            thoughtField.resignFirstResponder()
        case 3:
            positionField.text = positions[row]
            positionField.layer.cornerRadius = 2
            positionField.layer.borderWidth = 1
            positionField.layer.borderColor = UIColor.green.cgColor
            positionField.resignFirstResponder()
        default:
            return
        }
    }
    
    
    
    @objc func respondToSwipe(gesture : UIGestureRecognizer){
        
        
        self.performSegue(withIdentifier: "DescriptionSegue", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DescriptionPageViewController
            else {
                return
        }
        destination.modalPresentationStyle = .fullScreen
        destination.imageData = imageData
    }
}
