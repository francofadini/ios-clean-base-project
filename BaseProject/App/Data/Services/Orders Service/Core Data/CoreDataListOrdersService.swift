import Foundation
import UIKit
import CoreData

class CoreDataListOrdersService: ListOrdersService {
  func listOrdersWith(clientID: Int?, success: ([Order]) -> Void, failure: (ListOrdersError) -> Void) {
    
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext =
      appDelegate.persistentContainer.viewContext
    
    let fetchRequest =
      NSFetchRequest<NSManagedObject>(entityName: "CDOrder")
    
    //3
    do {
      let coreDataOrders = try managedContext.fetch(fetchRequest)
      var orders = [Order]()
      for coreDataOrder in coreDataOrders {
        let orderID = coreDataOrder.objectID.uriRepresentation().absoluteString
        let orderName = coreDataOrder.value(forKey: "name") as? String
        let order = Order(identifier: orderID, firstName: orderName)
        orders.append(order)
      }
      success(orders)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      failure(.other)
    }
  }
}
