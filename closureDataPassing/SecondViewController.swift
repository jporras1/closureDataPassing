//
//  SecondViewController.swift
//  closureDataPassing
//
//  Created by Javier Porras jr on 10/21/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK: Properties
    private lazy var textField: UITextField = {
        let txt = UITextField()
        txt.returnKeyType = .done
        txt.backgroundColor = .groupTableViewBackground
        txt.layer.cornerRadius = 3.0
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.delegate = self
        return txt
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    private lazy var updateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(update), for: .touchUpInside)
        return button
    }()
    
    public var buttonAction: ((String?) -> ())?
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.addSubview(textField)
        view.addSubview(cancelButton)
        view.addSubview(updateButton)
        
        addConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
}

//MARK: - UITextField Delegate
extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return false
    }
}

//MARK: - Private Methods
private extension SecondViewController {
    func addConstraints() {
        
        // textfield
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // cancel button
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cancelButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // update button
        updateButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        updateButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        updateButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.setNeedsLayout()
    }
    
    /// Resigns First Responder
    func hideKeyboard() {
        textField.resignFirstResponder()
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func update() {
        guard let buttonAction = buttonAction else {
            return dismiss(animated: true, completion: nil)
        }
        buttonAction(textField.text)
    }
}
