//
//  WatchVisualViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import Foundation
import UIKit

class WatchVisualViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var btnTry: UIImageView!
    @IBOutlet weak var openPage: UIButton!
    //****
    @IBOutlet weak var tesImgView: UIImageView!
    
    @IBOutlet weak var nextViewBtn: UIView!
    @IBOutlet weak var prevViewBtn: UIView!
    
    @IBOutlet weak var contentText: UILabel!
    var cameraGrid : UIView!
    var subModuleDatabase : SubModuleContent!
    var currModule = 0
    var nextModule = 0
    let nextSt = "next"
    let prevSt = "prev"
    
    let assetArray = ["Asset 14", "Asset 15", "Asset 16"]
    let makeGifArr = ["Slide 10", "Slide 11", "Slide 12", "Slide 13", "Slide 14", "Slide 15", "Slide 16", "Slide 17"]
    //****
    var imageData : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewBtn()
        setupGesture()
        
//        contentText.text = subModuleDatabase.content[]
//        tesImgView.image = UIImage.init(named: assetArray[0])
        let arrOfImg : [UIImage] = [UIImage.init(named: makeGifArr[0])!,
                                    UIImage.init(named: makeGifArr[1])!,
                                    UIImage.init(named: makeGifArr[2])!,
                                    UIImage.init(named: makeGifArr[3])!,
                                    UIImage.init(named: makeGifArr[4])!,
                                    UIImage.init(named: makeGifArr[5])!,
                                    UIImage.init(named: makeGifArr[6])!,
                                    UIImage.init(named: makeGifArr[7])!,
                                    ]
        let a = UIImage.animatedImage(with: arrOfImg, duration: 3)
        tesImgView.image = a
        nextModule = 1
        openPage.addTarget(self, action: #selector(openPagePressed(_: )), for: .touchUpInside)
        openPage.isHidden = true
        
//        if !isVisible(view: view1) {
//            print("********* VIEW 3 IS VISIBLE *****")
//        } else {
//            print("************* VIEW NOT VISIBLE ******")
//        }
        
    }
    
    func isVisible(view: UIView) -> Bool {
        func isVisible(view: UIView, inView: UIView?) -> Bool {
            guard let inView = inView else { return true }
            let viewFrame = inView.convert(view.bounds, from: view)
            if viewFrame.intersects(inView.bounds) {
                return isVisible(view: view, inView: inView.superview)
            }
            return false
        }
        view.superview?.backgroundColor = .green
        return isVisible(view: view, inView: view.superview)
    }
    
    func setUpViewBtn(){
        prevViewBtn.translatesAutoresizingMaskIntoConstraints = false
        prevViewBtn.frame =  CGRect(x: 0, y: 0 , width: UIScreen.main.bounds.width / 2, height: 500)
//        prevViewBtn.backgroundColor = .blue
        
        nextViewBtn.translatesAutoresizingMaskIntoConstraints = false
        nextViewBtn.frame =  CGRect(x: UIScreen.main.bounds.width / 2, y: 0 , width: UIScreen.main.bounds.width / 2, height: 500)
//        nextViewBtn.backgroundColor = .red
    }
    
    func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WatchVisualViewController.tryTapped(gesture:)))
        let nextTouch = UITapGestureRecognizer(target: self, action: #selector(nextModule(_:)))
        let prevTouch = UITapGestureRecognizer(target: self, action: #selector(prevModule(_:)))
        prevViewBtn.addGestureRecognizer(prevTouch)
        nextViewBtn.addGestureRecognizer(nextTouch)
        btnTry.addGestureRecognizer(tapGesture)
        btnTry.isUserInteractionEnabled = true
        
        //DISINI
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipe))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
    }
                                         //DISINI
    @objc func respondToSwipe(gesture : UIGestureRecognizer){
        
        imageData = UIImage(named: "Module 02")
        guard let image = imageData else { print("******* NO IMAGE TO BE SAVED")
            return }
        
//        saveImage(image)
        self.performSegue(withIdentifier: "ComparePageSegue", sender: nil)
    }
    
    @objc func  prevModule(_ sender : UIButton){
        if currModule > assetArray.startIndex {
            currModule -= 1
            animateImage(currModule, prevSt)
        } else {
            print("************ HIT THE FIRST INDEX")
        }
    }
    
    @objc func nextModule(_ sender : UIButton){
        if currModule < assetArray.count-1 {
            currModule += 1
            animateImage(currModule, nextSt)
        } else {
            print("************ HIT THE LAST INDEX")
        }
    }
    
    func animateImage(_ currModule: Int, _ nextOrPrev : String){
        if nextOrPrev == nextSt {
            UIView.transition(with: self.tesImgView,
                              duration: 0.8,
                              options: .transitionFlipFromRight,
                              animations: {
                self.tesImgView.image = UIImage.init(named: self.assetArray[currModule])
            }, completion: nil)
        } else {
            UIView.transition(with: self.tesImgView,
                              duration: 0.8,
                              options: .transitionFlipFromLeft,
                              animations: {
                self.tesImgView.image = UIImage.init(named: self.assetArray[currModule])
            }, completion: nil)
        }
    }
    
    @objc func tryTapped(gesture: UIGestureRecognizer) {
        cameraGrid = UIView()
        if gesture.view is UIImageView {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.showsCameraControls = true
    //        vc.allowsEditing = true
            vc.delegate = self
            vc.view.sizeToFit()
//            vc.cameraOverlayView = self.addOverlay()
//            cameraGrid.inputViewController?.dismiss(animated: true)
            present(vc, animated: true)
            }
    }
    
    func addOverlay() -> UIView? {
//        self.addLine(cameraGrid)
//        self.addGridView(cameraView: cameraGrid)
        cameraGrid.frame = self.view.frame
        return cameraGrid
    }
    
//    func addLine(_ cameraView: UIView){
//        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), cornerRadius: 0)
//        path.usesEvenOddFillRule = true
//        let line = CGRect(x: 200, y: 0.0, width: UIScreen.main.bounds.width, height: 500)
//
//        let fillLayer = CAShapeLayer()
//        fillLayer.path = path.cgPath
//        fillLayer.fillRule = .evenOdd
//        fillLayer.opacity = 0.7
//
//        cameraView.layer.addSublayer(fillLayer)
////        cameraView.draw(line)
////        cameraGrid.backgroundColor = .red
//    }
    
//    func addGridView(cameraView: UIView) {
//     let horizontalMargin = cameraView.bounds.size.width / 4
//     let verticalMargin = cameraView.bounds.size.height / 4
//
////     let gridView = GridView()
//         gridView.translatesAutoresizingMaskIntoConstraints = false
//         cameraView.addSubview(gridView)
//         gridView.backgroundColor = UIColor.clear
//         gridView.leftAnchor.constraint(equalTo: cameraView.leftAnchor, constant: horizontalMargin).isActive = true
//         gridView.rightAnchor.constraint(equalTo: cameraView.rightAnchor, constant: -1 * horizontalMargin).isActive = true
//         gridView.topAnchor.constraint(equalTo: cameraView.topAnchor, constant: verticalMargin).isActive = true
//         gridView.bottomAnchor.constraint(equalTo: cameraView.bottomAnchor, constant: -1 * verticalMargin).isActive = true
//    }
    
    @objc func buttonPressed(_ sender : UIButton){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.showsCameraControls = true
//        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func openPagePressed(_ sender : UIButton){
        
        guard let image = imageData else { print("******* NO IMAGE TO BE SAVED")
            return }
//        saveImage(imageData!)
//        saveImage(image)
        self.performSegue(withIdentifier: "ComparePageSegue", sender: nil)
    }
    
    func navigateNext() async {
        self.performSegue(withIdentifier: "ComparePageSegue", sender: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

//        guard let image = info[.editedImage] as? UIImage else {
//            print("No image found")
//            return
//        }
        
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        imageData = image
        print(image.size)
    }
    
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CompareViewController
            else {
                return
        }
        destination.modalPresentationStyle = .fullScreen
        destination.image2 = imageData!
    }
}
