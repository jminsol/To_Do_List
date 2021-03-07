//
//  ViewController.swift
//  ToDoList
//
//  Created by Minsol Jeong on 2021/03/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toDos = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onAddButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let canccel = UIAlertAction(title: "cancel", style: .default) { (candel) in
            
        }
        
        let save = UIAlertAction(title: "save", style: .default) { (save) in
            self.toDos.append(textField.text!)
            self.tableView.reloadData()
        }
        
  
        alert.addTextField { (text) in
            textField = text
        textField.placeholder = "Add new item"}
        
        alert.addAction(canccel)
        alert.addAction(save)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        cell.textLabel?.text = toDos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        var textField = UITextField()
        
        if editingStyle == .delete{
            
            self.toDos.remove(at: indexPath.row)
            self.tableView.reloadData()
        }

 
    }
    
    

}

