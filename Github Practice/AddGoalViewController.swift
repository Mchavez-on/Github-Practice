//
//  AddGoalViewController.swift
//  Github Practice
//
//  Created by Mariana Chavez on 7/21/21.
//

import UIKit

class AddGoalViewController: UIViewController {
    //another change
    var previousVC = GoalTableViewController()
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var meaningTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) {
        let goal = Goal()
        
        if let nameText = nameTextField.text {
            goal.name = nameText
        //I AM UNSURE OF THIS CODE - change made since I last worked with group
        if let meaningText = meaningTextField.text{
            goal.meaning = meaningText
            }
        }
        previousVC.goals.append(goal)
        previousVC.tableView.reloadData()
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
