//
//  ViewController.swift
//  ui animation swift
//
//  Created by Anjas Dwi on 27/08/20.
//  Copyright © 2020 Anjas Dwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func setupLabels() {
        // Do any additional setup after loading the view.
        
//        self.titleLabel.backgroundColor = .red
//        self.bodyLabel.backgroundColor = .green
        self.titleLabel.text = "Welcome"
        self.titleLabel.font = UIFont(name: "Futura", size: 34)
        self.bodyLabel.numberOfLines = 0
        self.bodyLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam erat orci, hendrerit a tincidunt"
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        //        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }

    @objc fileprivate func handleTapAnimations() {
        print("Animating")
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }){ (_) in
           
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                
            })
            
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }){ (_) in
           
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                
            })
            
        }
    }

}

