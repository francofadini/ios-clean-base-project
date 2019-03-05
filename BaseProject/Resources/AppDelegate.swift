import UIKit
import CoreData

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
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000,
                                                                               vertical: 0),
                                                                      for: UIBarMetrics.default)
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

  // MARK: - Core Data stack
  
  lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
     */
    let container = NSPersistentContainer(name: "BaseProject")
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error as NSError? {
        
        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }

}
