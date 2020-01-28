//
//  MainView.swift
//  Programmatic-UI
//
//  Created by Alex Paul on 1/28/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class MainView: UIView {
  let defaultMessage = "No default color set. Please go to settings"
  
  // create a label
  // lazy property initialization
  public lazy var messageLabel: UILabel = {
    let label = UILabel()
    //label.backgroundColor = .systemYellow // using a color for your background as you set up your ui is very helpful
    label.textAlignment = .center
    label.text = defaultMessage
    label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
    label.textColor = .label
    return label
  }() // () creates a closure and calls simultaneously
  
  /*
  var someLabel: UILabel = {
    let label = UILabel()
    label.text = defaultMessage // DOES NOT COMPILE
    return label
  }()*/
  
  // create a button
  public lazy var resetButton: UIButton = {
    let button = UIButton()
    //button.backgroundColor = .systemYellow // using a color for your background as you set up your ui is very helpful
    button.setTitle("Reset", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    return button
  }()

  // init(frame: ) gets called if view is done programmatically
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  // if this view get initialized from storybaord
  // this initializer gets called
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupMessageLabelConstraints()
    setupResetButtonConstraints()
  }
  
  private func setupMessageLabelConstraints() {
    // add the messageLabel to the MainView
    addSubview(messageLabel) // return the messageLabel we created above
    
    // set constraints for the messageLabel
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate([
      // set top anchor 20 points from the safe area top
      messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
      
      // set padding at the leading edge of the MainView
      messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      
      // set padding at the trailing edge of the MainView
      messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    ])
  }
  
  private func setupResetButtonConstraints() {
    
    // steps for adding constraints in code
    // 1.
    addSubview(resetButton)
    
    // 2.
    resetButton.translatesAutoresizingMaskIntoConstraints = false
    
    //resetButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    // 3.
    // set constraints
    NSLayoutConstraint.activate([
      resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
    ])
  }
  

}
