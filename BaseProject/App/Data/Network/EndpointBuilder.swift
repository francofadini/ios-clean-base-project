import Foundation

class EndpointBuilder {

  private var endpoint: String

  init(base: String) {
    self.endpoint = base
  }

  func addIntParameters(values: [Int], for key: String) -> EndpointBuilder {
    if values.count > 0 {
      let formattedFilter = (values.map {String($0)}).joined(separator: ",")
      appendParameter(key: key, value: formattedFilter)
    }
    return self
  }

  func addStringParameters(values: [String], for key: String) -> EndpointBuilder {
    if values.count > 0 {
      let formattedFilter = (values.map {
        $0.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? "null"
      }).joined(separator: ",")
      appendParameter(key: key, value: formattedFilter)
    }
    return self
  }

  func applyBatchStringFilters(values: [String], key: String) -> EndpointBuilder {
    for value in values {
      _ = addScapedStringParameter(string: value, key: key)
    }
    return self
  }

  func addScapedStringParameter(string: String?, key: String) -> EndpointBuilder {
    if let value = string, !value.isEmpty {
      if let escpaedFilter = value.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
        appendParameter(key: key, value: escpaedFilter)
      }
    }
    return self
  }

  func addPlainStringparameter(string: String?, for key: String) -> EndpointBuilder {
    if let value = string, !value.isEmpty {
      appendParameter(key: key, value: value)
    }
    return self
  }

  func build() -> String {
    return self.endpoint
  }

  private func appendParameter(key: String, value: String) {
    if self.endpoint.contains("?") {
      self.endpoint += ("&" + key + "=" + value)
    } else {
      self.endpoint += ("?" + key + "=" + value)
    }
  }
}
