//
//  ViewController.swift
//  MultiplicationApp
//
//  Created by Neeta Koirala Pant on 2025-02-17.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var displayMultiplicationTable: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var multiplicationTableView: UITableView!
    
    @IBAction func displayMultiplicationTable(_ sender: Any) {
        multTable.removeAll()
        
        if let numberText = textField.text, let value = Int(numberText), value > 0 {
            for i in 1...10 {
                let result = "\(value) x \(i) = \(value * i)"
                multTable.append(result)
            
            }
            multiplicationTableView.reloadData()
        }  else {
            let alert = UIAlertController(title: "Invalid Input", message: "Please enter a value.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

    }
    var multTable: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        multiplicationTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TimesTableCell")
        multiplicationTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimesTableCell", for: indexPath)
        cell.textLabel?.text = multTable[indexPath.row]
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return multTable.count
    }


}

