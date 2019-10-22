//
//  ViewController.swift
//  closureDataPassing
//
//  Created by Javier Porras jr on 10/21/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .blue
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "My Label"
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(showSecondController), for: .touchUpInside)
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .black
        return button
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupViews()
    }

    //MARK: Handlers
    func setupViews(){
        view.addSubview(label)
        view.addSubview(button)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //view.setNeedsLayout()
    }
    
    @objc func showSecondController(){
        print("did push button")
        let secondViewController = SecondViewController()
        secondViewController.buttonAction = { [weak self] (text) -> () in
            self?.label.text = text
            return secondViewController.dismiss(animated: true, completion: nil)
        }
        present(secondViewController, animated: true, completion: nil)
    }

}

