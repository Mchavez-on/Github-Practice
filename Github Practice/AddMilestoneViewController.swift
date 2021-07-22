//
//  AddMilestoneViewController.swift
//  Github Practice
//
//  Created by Megan on 7/21/21.
//

import UIKit
import CoreData

class AddMilestoneViewController: UIViewController {
    var milestones : [Milestone] = []
    var previousVC = MilestoneTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMilestoneTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let milestone = MilestoneCD(entity: MilestoneCD.entity(), insertInto: context)
            
            if let titleText = titleTextField.text {
                milestone.name = titleText
            }
            
            try? context.save()
            
            performSegue(withIdentifier: "addMilestoneToList", sender: nil)
            //navigationController?.popViewController(animated: true)
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
