//
//  CompleteMilestoneViewController.swift
//  Github Practice
//
//  Created by Megan on 7/22/21.
//

import UIKit

class CompleteMilestoneViewController: UIViewController {
    var previousVC = MilestoneTableViewController()
    var selectedMilestone : MilestoneCD?

    @IBOutlet weak var milestoneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        milestoneLabel.text = selectedMilestone?.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeMilestoneTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theMilestone = selectedMilestone {
                context.delete(theMilestone)
                navigationController?.popViewController(animated: true)
            }
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
