//
//  ViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var coba_saja: UILabel!
    var thisWidth:CGFloat = 0
    var database : Content?
    
    var contents : [Content] = [
        Content(image: "Module 03",name: "Understanding Composition", id: "1", description: "Good Composition makes your picture alive",image_crop: "Asset 21 crop",
                SubModule: [
            SubModuleContent(subModuleName :"What is Composition?",
                             imageContent: [
                                ["Slide 10", "Slide 11", "Slide 12", "Slide 13", "Slide 14", "Slide 15", "Slide 16", "Slide 17"],
                                ["slide 20", "slide 21", "slide 22", "slide 23", "slide 24", "slide 25", "slide 26", "slide 27"],
                                ["Slide30", "Slide31", "Slide32", "Slide33", "Slide34", "Slide35", "Slide36"],
                                ["slide4_00", "slide4_01", "slide4_02", "slide4_03", "slide4_04", "slide4_05", "slide4_06", "slide4_07", "slide4_08"
                                 , "slide4_09", "slide4_10", "slide4_11", "slide4_12", "slide4_13", "slide4_14", "slide4_15", "slide4_16", "slide4_17"],
                                ["slide 5_1", "slide 5_2", "slide 5_3", "slide 5_4", "slide 5_5", "slide 5_6", "slide 5_7"]
                                
                             ],
                             content: [
                "When you take photos, do you ever feel bored with the photos? Now you can get creative with composition techniques!",
                """
                Just like cooking, you need the right ingredients and spices along with the right cooking method to make delicious food. Photography also has elements that can be combined so that it becomes an interesting photo, this method is called "Composition".
                """,
                "Composition is used in photographs to guide the viewer to an object or point of interest, as well as to help convey the story or expression in the photo.",
                "There are some types of composition, for example rule of third, golden triangle, and frame within the frame",
                "but following the composition types isn't a mandatory thing, you can explore and experiment with your imagination. By that, you can make a good “taste” in your pictures like a pizza!"
            ]),
            SubModuleContent(subModuleName :"Rule Of Third",
                             imageContent: [
                                ["2_1", "2_1-1", "2_1-2", "2_1-3", "2_1-4", "2_1-5"],
                                ["2_11", "2_2", "2_3", "2_4", "2_5", "2_6"],
                                ["2_6"],
                                ["4_1", "4_2", "4_3", "4_4", "4_5", "4_6", "4_7", "4_8", "4_9", "4_10", "4_11", "4_12"]
                             ],
                             
                             content: [
                "Let's start learning composition with the rule of thirds theory! This theory is commonly used as a guide on smartphone cameras and pro cameras such as DSLR or Mirrorless.",
                "Rule of Thirds is a guide in the form of a grid that divides a third of the photo area with 2 vertical lines and 2 horizontal lines so that 9 segments are formed as follows.",
                "Then, what is the function of these lines and grids? The Rule of Thirds is used by placing an object at the point where the lines intersect, the point is called the golden section. In addition to placing objects in the golden section, we can place lines on photo objects to either vertical lines or horizontal lines.",
                "Remember, the rule of thirds is only one guide, not a standard rule that must be followed. So keep exploring around and be creative!"
            ]),
            SubModuleContent(subModuleName :"Golden Triangle",
                             imageContent: [
                                ["Sub3_Slide1_0", "Sub3_Slide1_1", "Sub3_Slide1_2", "Sub3_Slide1_3", "Sub3_Slide1_4", "Sub3_Slide1_5", "Sub3_Slide1_6", "Sub3_Slide1_7", "Sub3_Slide1_8", "Sub3_Slide1_9"],
                                ["Sub3_Slide2_0", "Sub3_Slide2_1", "Sub3_Slide2_2", "Sub3_Slide2_3", "Sub3_Slide2_4", "Sub3_Slide2_5", "Sub3_Slide2_6", "Sub3_Slide2_7", "Sub3_Slide2_8", "Sub3_Slide2_9"],
                                ["Sub3_Slide3_0", "Sub3_Slide3_1", "Sub3_Slide3_2", "Sub3_Slide3_3", "Sub3_Slide3_4", "Sub3_Slide3_5", "Sub3_Slide3_6", "Sub3_Slide3_7", "Sub3_Slide3_8", "Sub3_Slide3_9", "Sub3_Slide3_10"],
                                ["Sub3_Slide4_0", "Sub3_Slide4_1", "Sub3_Slide4_2", "Sub3_Slide4_3", "Sub3_Slide4_4", "Sub3_Slide4_5", "Sub3_Slide4_6", "Sub3_Slide4_7", "Sub3_Slide4_8", "Sub3_Slide4_9"]
                             ],
                                
                             content: [
                "The combination of these triangles forms a grid, the meeting between the triangles becomes a golden section. Objects can be placed in any of the golden sections and line elements can be adjusted according to the grid",
                "Golden Triangle can be used when your photo object contains a lot of strong lines, so keep exploring and be creative to take as many photos as possible!",
                
            ]),
            SubModuleContent(subModuleName: "Framing (Frame within the frame)", imageContent:[
                                    ["1_1", "1_2", "1_3", "1_4", "1_5", "1_6"],
                                    ["f2_1", "f2_2", "f2_3", "f2_4", "f2_5", "f2_6"],
                                    ["f3_1", "f3_2", "f3_3", "f3_4"]
                                ],
                             content: [
                """
                When you hear the word "framing" surely some of you imagine a photo with a frame on the wall of your house. But framing in photography is one of the most interesting compositional methods!
                """,
                "A photo frame must surround the photo, right? Similar to photo frames, framing techniques use objects that are around to surround the subject of your photo. So you can highlight your main subject by framing because the eye will directly focus on the subject.",
                "So, what objects can be made into a frame? The answers are many. You can use doors, windows, chairs and more. Think of this framing technique as peering through another object with the main subject being peeked at."
            ])
        ]
              
               ),
        Content(image: "Module 02", name: "Learn about Bokeh", id: "2",description: "belum masuk", image_crop: "Asset 22 crop", SubModule: [SubModuleContent(content: [])]),
        Content(image: "Module 08", name: "Well exposed Images ", id: "3", description: "belum masuk", image_crop: "Asset 07 crop",SubModule: [SubModuleContent(content: [])])
    ]
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        carouselCollectionView.delegate = self
        
        carouselCollectionView.dataSource = self
       
       carouselPageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
       
            
        // Do any additional setup after loading the view.
    }

        
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        carouselCollectionView.setContentOffset(CGPoint(x: CGFloat(current) * carouselCollectionView.frame.size.width, y: 0), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentView", for: indexPath) as? CollectionViewCell
        else{
            fatalError()
        }
        
//        let img: UIImage = UIImage(named: (contents[indexPath.row].image!))!
        
        cell.dataDisplayed = contents[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionViewCell, at indexPath: IndexPath) {
        self.carouselPageControl.currentPage = indexPath.section
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

      
        database = contents[indexPath.row]
        
//        database?.userDefault(content: database)
        
    //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectedModuleSB") as! SelectedModuleViewController
    //        vc.database = database
    //        self.navigationController?.pushViewController(vc, animated: false)

        performSegue(withIdentifier: "SegueIdentifier", sender: database)
    }

    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueIdentifier" {
            let senderData = sender as? Content
            let vc = segue.destination as? SelectedModuleViewController
            vc?.database = senderData

        }
    }
    
    
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    


}


//extension HomePageViewController: UICollectionViewDelegate, UIScrollViewDelegate{
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView){
//        carouselPageControl.currentPage = Int(floorf(Float(collectionView.contentOffset.x) / Float(carouselView.frame.size.width)))
//    }
//
//}
