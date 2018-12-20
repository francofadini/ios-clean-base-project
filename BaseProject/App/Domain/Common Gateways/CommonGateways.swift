protocol SessionPersistantGateway {
  func loadSession() -> Session?
  func saveSession(session: Session)
  func removeSession()
}
