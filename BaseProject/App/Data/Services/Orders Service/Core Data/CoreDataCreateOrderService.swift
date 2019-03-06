import Foundation
import CoreData
import UIKit

class CoreDataCreateOrderService: CreateOrderService {
  func creteOrderWith(name: String?, success: (Order) -> Void, failure: (CreateOrderError) -> Void) {
    
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext =
      appDelegate.persistentContainer.viewContext
    
    // 2
    let entity =
      NSEntityDescription.entity(forEntityName: "CDOrder",
                                 in: managedContext)!
    
    let coreDataOrder = NSManagedObject(entity: entity,
                                 insertInto: managedContext)
    
    if let name = name {
      coreDataOrder.setValue(name, forKeyPath: "name")
    }
    
    do {
      try managedContext.save()
      let orderID = coreDataOrder.objectID.uriRepresentation().absoluteString
      let order = Order(identifier: orderID, firstName: name)
      success(order)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
      failure(.other)
    }
  }
}
