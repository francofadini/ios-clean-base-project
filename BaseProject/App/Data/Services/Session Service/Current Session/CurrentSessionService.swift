import Foundation

class CurrentSessionService: SessionService {
  func saveSession(session: Session) {
    UserDefaults.standard.set(session.token, forKey: "session_token")
  }

  func loadSession() -> Session? {
    if let token =  UserDefaults.standard.value(forKey: "session_token") as? String {
      return Session(token: token)
    }
    return nil
  }
}

extension CurrentSessionService: SessionPersistantGateway {
  func saveCurrentSession(session: Session) {
    self.saveSession(session: session)
  }
}
