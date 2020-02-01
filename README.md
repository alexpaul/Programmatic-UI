# Programmatic-UI

Laying out UI programmatically without use of storyboards.

![screenshot](https://user-images.githubusercontent.com/1819208/73598710-b318f180-4509-11ea-8b29-9292a248a076.png)

## Setting up the root view controller in code 

```swift 
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
  // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
  // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

  // Steps in configuring programmatic UI in the SceneDelegate
  // Steps in configuring the windown property

  guard let windowScene = (scene as? UIWindowScene) else { return }

  // set up the window's frame take up the entire device's screen
  // instantiating the window with a frame
  window = UIWindow(frame: UIScreen.main.bounds)

  // the window will be associated with this scene
  window?.windowScene = windowScene

  //window?.rootViewController = SettingsViewController()

  // embedding a UIViewController in a UINavigationController
  window?.rootViewController = UINavigationController(rootViewController: MainViewController())

  window?.makeKeyAndVisible()
}
```

## Setting up constraints in code 

```swift
// 1.
addSubview(pickerView)

// 2.
pickerView.translatesAutoresizingMaskIntoConstraints = false

// 3. setup constraints
NSLayoutConstraint.activate([
  pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
  pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
])
```

## Setting up a UILabel in code using lazy property initialization

```swift 
// create a label
// lazy property initialization
public lazy var messageLabel: UILabel = {
  let label = UILabel()
  label.textAlignment = .center
  label.text = defaultMessage
  label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
  label.textColor = .label
  return label
}() // () creates a closure and calls simultaneously
```

## Adding a custom UIView subclass programmatically to a view controller 

```swift 
private let mainView = MainView()

override func loadView() {
  view = mainView
}
```

## Adding a UIBarButtonItem to the navigation bar in code 

```swift 
navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
```

## Segueing within a navigation controller and pushing a new view controller onto the navigation stack

```swift 
navigationController?.pushViewController(settingsVC, animated: true)
```

## Setting a target/action on a UIButton in code 

```swift 
mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
```
