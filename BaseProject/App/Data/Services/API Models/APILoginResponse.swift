struct APILoginResponse: Codable {
  let token: String
  let user: APIUser
}
