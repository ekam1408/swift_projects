//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Ekambeer Singh on 12/08/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    var categoryArray: [Category] = [];
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    override func viewDidLoad() {
        super.viewDidLoad();
        self.loadItems();
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField();
        let alert = UIAlertController(title: "Add new Category", message: nil, preferredStyle: .alert);
        let alertAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let textFieldText = textField.text {
                let newCategory = Category(context: self.context);
                newCategory.name = textFieldText;
                self.categoryArray.append(newCategory);
                self.saveItems();
                self.tableView.reloadData();
            }
        }
        
        alert.addTextField(configurationHandler: {
          alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField;
        });
        
        alert.addAction(alertAction);
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath);
        cell.textLabel?.text = categoryArray[indexPath.row].name;
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count;
    }
}

//MARK: - UITableViewDelegate

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToCategory", sender: self)
    }
}

//MARK: - Data Manipulation

extension CategoryViewController {
    func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request);
        } catch {
            print("Error fetching category Array \(error)")
        }

    }
    
    func saveItems() {
        do {
            try context.save();
        } catch {
            print("Error saving context \(error)")
        }
    }
}

//MARK: - Segue

extension CategoryViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController;
        if segue.identifier == "GoToCategory" {
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categoryArray[indexPath.row];
            }
        }
    }
}
