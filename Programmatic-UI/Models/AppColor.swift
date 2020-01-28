//
//  AppColor.swift
//  Programmatic-UI
//
//  Created by Alex Paul on 1/28/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

struct AppColor {
  public static var colors: [String] {
    return ["Red", "Green", "Blue", "White"]
  }
  
  public static func getAppColor() -> (color: UIColor, index: Int) {
    var colorIndex = colors.firstIndex(of: "White") ?? 0
    if let storedColorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
      colorIndex = colors.firstIndex(of: storedColorName) ?? 0
    }
    let colorName = colors[colorIndex]
    return (UIColor(named: colorName)!, colorIndex)
  }
}
