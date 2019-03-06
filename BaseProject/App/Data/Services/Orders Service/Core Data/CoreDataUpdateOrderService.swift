import Foundation
import UIKit
import CoreData

class CoreDataUpdateOrderService: UpdateOrderService {
  func updateOrder(order: Order,
                   success: (Order) -> Void,
                   failure: (UpdateOrderError) -> Void) {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDOrder")
    
    do {
      let coreDataOrders = try managedContext.fetch(fetchRequest)
      for coreDataOrder in coreDataOrders {
        if coreDataOrder.objectID.uriRepresentation().absoluteString == order.identifier {
          coreDataOrder.setValue(order.firstName, forKey: "name")
          success(order)
          return
        }
      }
      failure(.other)
    } catch let error as NSError {
      print("Could not update. \(error), \(error.userInfo)")
      failure(.other)
    }
  }
}
