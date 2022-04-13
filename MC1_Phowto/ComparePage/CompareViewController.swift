//
//  CompareViewController.swift
//  MC1_Phowto
//
//  Created by Ricky on 12/04/22.
//

import Foundation

import UIKit



class CompareViewController: UIViewController {
    @IBOutlet weak var imageReference: UIImageView!
    @IBOutlet weak var imageTaken: UIImageView!
    @IBOutlet weak var SelectedModuleBack: UINavigationItem!
    var image1: UIImage = UIImage(named: "Module 03.jpg")!
    var image2: UIImage = UIImage(named: "Module 08.jpg")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageReference.layer.cornerRadius = 20
        imageTaken.layer.cornerRadius = 20
        imageReference.image = image1
        imageTaken.image = image2
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipe))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    @objc func respondToSwipe(gesture : UIGestureRecognizer){
        
        
        self.performSegue(withIdentifier: "ReflectionSegue", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ReflectionViewController
            else {
                return
        }
        destination.modalPresentationStyle = .fullScreen
        destination.imageData = image2
    }
    


}
