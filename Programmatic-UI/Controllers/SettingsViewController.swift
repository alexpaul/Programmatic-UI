//
//  SettingsViewController.swift
//  Programmatic-UI
//
//  Created by Alex Paul on 1/28/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

struct AppKey {
  static let appColorKey = "app color"
}

class SettingsViewController: UIViewController {
  
  private let settingsView = SettingsView()
  
  // data for picker view
  private let colors = AppColor.colors
  
  override func loadView() {
    view = settingsView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemTeal
    
    // configure delegate and datasource of pickerview
    settingsView.pickerView.dataSource = self
    settingsView.pickerView.delegate = self
    
    let appColor = AppColor.getAppColor()
    view.backgroundColor = appColor.color
    settingsView.pickerView.selectRow(appColor.index, inComponent: 0, animated: true)
  }
}

extension SettingsViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return colors.count
  }
}

extension SettingsViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return colors[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let colorName = colors[row]
    view.backgroundColor = UIColor(named: colorName)
    
    // save color name to user defaults
    UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
  }
}
