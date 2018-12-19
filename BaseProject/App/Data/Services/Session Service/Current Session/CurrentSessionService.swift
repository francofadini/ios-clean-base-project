import Foundation

struct PersistableUser: Codable {
  let identifier: Int
  let firstName: String?
  let lastName: String?
}

class CurrentSessionService: SessionService {

  func saveSession(session: Session) {
    UserDefaults.standard.set(session.token, forKey: "session_token")
    let persistableUser = PersistableUser(identifier: session.user.identifier,
                                          firstName: session.user.firstName,
                                          lastName: session.user.lastName)

    do {
      let userData = try JSONEncoder().encode(persistableUser)
      UserDefaults.standard.set(userData, forKey: "session_user")
    } catch {
      fatalError("Error encoding sessio profile")
    }
  }

  func loadSession() -> Session? {
    guard let token = UserDefaults.standard.value(forKey: "session_token") as? String else {
      return nil
    }

    guard let userData = UserDefaults.standard.value(forKey: "session_user") as? Data else {
      return nil
    }

    do {
      let persistableUser = try JSONDecoder().decode(PersistableUser.self, from: userData)
      let user = User(identifier: persistableUser.identifier,
                      firstName: persistableUser.firstName,
                      lastName: persistableUser.lastName)
      return Session(token: token, user: user)
    } catch {
      return nil
    }
  }
}

extension CurrentSessionService: LoginSessionPersistantGateway, RegisterSessionPersistantGateway {

  // MARK: SESSION PERSISTANT GATEWAY
  
  func saveCurrentSession(session: Session) {
    self.saveSession(session: session)
  }
}

extension CurrentSessionService: AutoLoginSessionPersistantGateway {
  //func loadSession() -> Session?
}
