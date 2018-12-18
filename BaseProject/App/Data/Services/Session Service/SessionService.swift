import Foundation

protocol SessionService: Service {
  func saveSession(session: Session)
  func loadSession() -> Session?
}
