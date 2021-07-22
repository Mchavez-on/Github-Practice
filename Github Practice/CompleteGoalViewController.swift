//
//  CompleteGoalViewController.swift
//  Github Practice
//
//  Created by Angela Zeng on 2021-07-21.
//

import UIKit

class CompleteGoalViewController: UIViewController {

    var previousVC = GoalTableViewController()
      var selectedGoal : GoalCD?
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func completeTapped(_ sender: Any) {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
             if let theGoal = selectedGoal {
              context.delete(theGoal)
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
