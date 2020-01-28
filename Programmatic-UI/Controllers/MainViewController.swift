//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by Alex Paul on 1/28/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private let mainView = MainView()
  
  // if doing programmatic UI implement and setup the view
  // in loadView()
  // loadView() gets called before viewDidLoad()
  // loadView() sets up the initial view of the controller
  // do not call super when overriding loadView()
  override func loadView() {
    view = mainView
  }

  override func viewDidLoad() { // called on initial load, only once
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureNavBar()
    
    // add target/action for reset button
    mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    updateAppColor()
  }
  
  private func updateAppColor() {
    view.backgroundColor = .systemBackground
    if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
      view.backgroundColor = UIColor(named: colorName)
      mainView.messageLabel.text = "App color is \(colorName)"
    } else {
      mainView.messageLabel.text = mainView.defaultMessage
    }
  }
  
  private func configureNavBar() {
    // set title for navigation bar
    navigationItem.title = "Programmatic UI"
    
    // adding a UIBarButtonItem to the navigation bar
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
  }
  
  @objc
  private func showSettings(_ sender: UIBarButtonItem) {
    // segue to the SettingsViewController
    let settingsVC = SettingsViewController()
    
    //present(settingsVC, animated: true)
    //settingsVC.modalPresentationStyle = .overCurrentContext
    //settingsVC.modalTransitionStyle = .flipHorizontal
    
    navigationController?.pushViewController(settingsVC, animated: true)
  }
  
  @objc
  private func resetAppColor(_ sender: UIButton) {
    // remvoe user defatuls value for the AppKey.appColorKey
    UserDefaults.standard.removeObject(forKey: AppKey.appColorKey)
    
    // update the UI as needed
    updateAppColor()
  }
}

