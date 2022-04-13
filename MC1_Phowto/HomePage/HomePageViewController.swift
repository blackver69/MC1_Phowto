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
        Content(image: "Module 03",name: "Understanding Composition", id: "1", description: "Good Composition makes your picture alive",image_crop: "Asset 21 crop", SubModule: [
            SubModuleContent(subModuleName :"What is Composition?", content: [
                "When you take photos, do you ever feel bored with the photos? Now you can get creative with composition techniques!",
                """
                Just like cooking, you need the right ingredients and spices along with the right cooking method to make delicious food. Photography also has elements that can be combined so that it becomes an interesting photo, this method is called "Composition".
                """,
                "Composition is used in photographs to guide the viewer to an object or point of interest, as well as to help convey the story or expression in the photo.",
                "There are some types of composition, for example rule of third, golden triangle, and frame within the frame",
                "but following the composition types isn't a mandatory thing, you can explore and experiment with your imagination. By that, you can make a good “taste” in your pictures like a pizza!"
            ]),
            SubModuleContent(subModuleName :"Rule Of Third", content: [
                "Let's start learning composition with the rule of thirds theory! This theory is commonly used as a guide on smartphone cameras and pro cameras such as DSLR or Mirrorless.",
                "Rule of Thirds is a guide in the form of a grid that divides a third of the photo area with 2 vertical lines and 2 horizontal lines so that 9 segments are formed as follows.",
                "Then, what is the function of these lines and grids? The Rule of Thirds is used by placing an object at the point where the lines intersect, the point is called the golden section. In addition to placing objects in the golden section, we can place lines on photo objects to either vertical lines or horizontal lines.",
                "Remember, the rule of thirds is only one guide, not a standard rule that must be followed. So keep exploring around and be creative!"
            ]),
            SubModuleContent(subModuleName :"Golden Triangle", content: [
                "The combination of these triangles forms a grid, the meeting between the triangles becomes a golden section. Objects can be placed in any of the golden sections and line elements can be adjusted according to the grid",
                "Golden Triangle can be used when your photo object contains a lot of strong lines, so keep exploring and be creative to take as many photos as possible!",
                
            ]),
            SubModuleContent(subModuleName: "Framing (Frame within the frame)", content: [
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
    


}


//extension HomePageViewController: UICollectionViewDelegate, UIScrollViewDelegate{
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView){
//        carouselPageControl.currentPage = Int(floorf(Float(collectionView.contentOffset.x) / Float(carouselView.frame.size.width)))
//    }
//
//}
