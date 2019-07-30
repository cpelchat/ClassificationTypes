//
//  ClassificationTypesViewController.swift
//  Classification Types
//
//  Created by Cassidy Pelchat on 7/30/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//

import UIKit

class ClassificationTypeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var classificationTypesTableView: UITableView!
    
    let classificationTypes = ClassificationTypesJSONLoader.load(fileName: "classification_types")
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classificationTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classificationTypeCell", for: indexPath)
        
        if let cell = cell as? ClassificationTypeTableViewCell {
            let classificationType = classificationTypes[indexPath.row]
            cell.classificationIconImageView.image = classificationType.classification.image
            cell.titleLabel.text = classificationType.title
            cell.dateLabel.text = dateFormatter.string(from: classificationType.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ClassificationTypeDetailViewController,
            let row = classificationTypesTableView.indexPathForSelectedRow?.row {
            
            destination.classificationType = classificationTypes[row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
