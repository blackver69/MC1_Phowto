//
//  SelectedModuleViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//
import UIKit

class SelectedModuleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var moduleName: UILabel!
    
    @IBOutlet weak var moduleDesciption: UILabel!
    
    @IBOutlet weak var subModuleImage: UIImageView!
    var database: Content?
    var subModuleDatabase : SubModuleContent?
    var subModuleCount: Int = 0
    let cellSpacingHeight: CGFloat = 5
    
    
    @IBOutlet weak var subModuleTable: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        subModuleTable.delegate = self
        subModuleTable.dataSource = self
        
        
        moduleName.text = database?.name
        moduleDesciption.text = database?.description
        subModuleImage.image = UIImage(named: database!.image!)
        
        self.subModuleTable.separatorStyle = .none
        
        
        
        
    }
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database!.SubModule.count
 
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubModuleCell", for: indexPath) as! SubModuleViewCell
        let title = database?.SubModule[indexPath.row].subModuleName
        
            // Set data title ke labelTitle
        cell.subModuleName.layer.cornerRadius = 50
        cell.subModuleName.text = title
        

        cell.layer.masksToBounds = true
        if(subModuleCount > indexPath.row){
            cell.subModuleProgress.image = UIImage(systemName: "checkmark")
        }else{
            cell.subModuleProgress.image = UIImage(systemName: "checkmark.square")
        
        }
        
        cell.subModuleProgress.layer.cornerRadius = 15
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    @IBAction func subModuleStart(_ sender: Any) {
        subModuleDatabase = database?.SubModule[subModuleCount]
        
        
  
        performSegue(withIdentifier: "WatchVisualIdentifier", sender: subModuleDatabase)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WatchVisualIdentifier" {
            let senderData = sender as? SubModuleContent
            let vc = segue.destination as? WatchVisualViewController
            vc?.subModuleDatabase = senderData

        }
    }
    @IBAction func unwindSelectedModule(_ unwindSegue: UIStoryboardSegue) {
        
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}
