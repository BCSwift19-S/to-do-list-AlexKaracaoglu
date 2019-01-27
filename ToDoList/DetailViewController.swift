//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Alex Karacaoglu on 1/25/19.
//  Copyright © 2019 Alex Karacaoglu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var toDoNoteView: UITextView!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    var toDoItem: String?
    var toDoNoteItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
        }
        if let toDoNote = toDoNoteItem {
            toDoNoteView.text = toDoNote
        }
        toDoField.becomeFirstResponder()
        enableDisableSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    func enableDisableSaveButton() {
        if toDoField.text!.count > 0 {
            saveBarButton.isEnabled = true
        }
        else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController?.popViewController(animated: true)
        }
    }

}
