import Foundation

struct Welcome: Codable {
  
  let shoppingResults: [ShoppingResult]
  
  enum CodingKeys: String, CodingKey {
    case shoppingResults = "shopping_results"
  }
  
}

struct ImageResponse: Codable {
  
  var docs: [ShoppingResult]
  
}

struct ShoppingResult: Codable, Identifiable {
  
  let position: Int
  let id: UUID = UUID()
  let thumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case position
    case id
    case thumbnail
  }
  
}
