import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    customize()
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = LandingViewController()
    self.window?.makeKeyAndVisible()
    return true
  }

  func customize() {
    window?.tintColor = Constants.Colors.primaryColor
    UINavigationBar.appearance().barTintColor = Constants.Colors.primaryColor
    UINavigationBar.appearance().tintColor = Constants.Colors.primaryTextColor
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Constants.Colors.primaryTextColor]
    UINavigationBar.appearance().isTranslucent = false
    UITabBar.appearance().tintColor = Constants.Colors.primaryColor
  }

  func applicationWillResignActive(_ application: UIApplication) {

  }

  func applicationDidEnterBackground(_ application: UIApplication) {

  }

  func applicationWillEnterForeground(_ application: UIApplication) {

  }

  func applicationDidBecomeActive(_ application: UIApplication) {

  }

  func applicationWillTerminate(_ application: UIApplication) {

  }

}
