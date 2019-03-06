import Foundation
import UIKit
import CoreData

class CoreDataDeleteOrderService: DeleteOrderService {
  func delteOrder(with id: String, success: () -> Void, failure: () -> Void) {
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext =
      appDelegate.persistentContainer.viewContext
    
    let fetchRequest =
      NSFetchRequest<NSManagedObject>(entityName: "CDOrder")
    
    do {
      let coreDataOrders = try managedContext.fetch(fetchRequest)
      for coreDataOrder in coreDataOrders {
        if coreDataOrder.objectID.uriRepresentation().absoluteString == id {
          managedContext.delete(coreDataOrder)
          success()
          return
        }
      }
      failure()
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      failure()
    }
  }
}
