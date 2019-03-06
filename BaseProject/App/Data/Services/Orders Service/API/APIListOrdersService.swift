import Foundation

class APIListOrdersService: ListOrdersService {
  func listOrdersWith(clientID: Int?, success: ([Order]) -> Void, failure: (ListOrdersError) -> Void) {
    failure(.other)
  }
}
