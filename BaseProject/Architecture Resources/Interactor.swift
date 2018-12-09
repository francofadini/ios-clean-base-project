import Foundation

/**
 A interactor is responsable for the app specific business rules, known also as interactions
 */

protocol Interactor {
  associatedtype RequestModelType
  func execute(requestModel: RequestModelType)
}
