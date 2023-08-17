//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    var itemsArray: [Item] = [];
    var selectedCategory: Category? {
        didSet {
            loadItems();
        }
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField();
        let alert = UIAlertController(title: "Add new Todo", message: "", preferredStyle: .alert);
        let action = UIAlertAction(title: "Add item", style: .default) {
            (action) in
            if let addedText = textField.text {
                let newItem = Item(context: self.context);
                newItem.name = addedText;
                newItem.isSelected = false;
                newItem.parentCategory = self.selectedCategory;
                self.itemsArray.append(newItem);
                self.saveItems();
                self.tableView.reloadData();
            }
        }
        
        alert.addTextField() {
            alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField;
        }
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
    }
}

//MARK: - UITableViewDataSource

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath);
        let item = itemsArray[indexPath.row];
        cell.textLabel?.text = item.name
        cell.accessoryType = item.isSelected ? .checkmark : .none;
        return cell;
    }
}


//MARK: - UITableViewDelegate

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        itemsArray[indexPath.row].isSelected = !itemsArray[indexPath.row].isSelected;
        self.saveItems();
        tableView.reloadData();
    }
}

//MARK: - UISearchBarDelegate

extension TodoListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            DispatchQueue.main.async{
                searchBar.resignFirstResponder();
            }
        }
        
        let request: NSFetchRequest<Item> = Item.fetchRequest();
        var predicate: NSPredicate? = nil;
        if searchText.count != 0 {
            predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!);
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        }
        self.loadItems(for: request, predicate: predicate);
        tableView.reloadData();
    }
}


//MARK: - Core Data manipulation

extension TodoListViewController {
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context: ", error)
        }
    }
    
    func loadItems(for request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil){
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        request.predicate = categoryPredicate;
        
        if let additionalPredicate = predicate {
            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates:  [categoryPredicate, additionalPredicate]);
            request.predicate = compoundPredicate;
        }
        
        do {
            itemsArray = try context.fetch(request);
        } catch {
            print("Error fetching items from core data \(error)")
        }
        
    }
}
