// homepage
//  CarouselModel.swift
//  Phowto
//
//  Created by Ricky on 07/04/22.
//

import Foundation



struct SubModuleContent{
    
    var subModuleName: String?
    
    var imageContent: [[String]]?
    var content: [String]?
    

}
struct Content{
    
    var image: String?
    var name: String?
    var id: String?
    var description: String?
    var image_crop : String?
    var SubModule: [SubModuleContent]
    
    func userDefault(content: Content){
        UserDefaults.standard.set(content, forKey: "content")
    }
    
    
}




