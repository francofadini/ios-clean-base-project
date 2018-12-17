import Foundation

protocol SessionService {
  func saveSession(session: Session)
  func loadSession() -> Session?
}
