import Foundation

class CurrentSessionPersistantServiceLocator {
  static let defaultService = UserDefaultsSessionService()
}

protocol SessionPersistantService: Service {
  func saveSession(session: Session)
  func loadSession() -> Session?
}
