import Foundation

struct ImageResponse: Codable {
  var docs: [Image]
}

struct Image: Codable {
    let position                     : Int
    let thumbnail                    : String
    let source, title                : String
    let link                         : String
    let original                     : String
    let originalWidth, originalHeight: Int
    let isProduct                    : Bool
    let inStock                      : Bool?

    enum CodingKeys: String, CodingKey {
        case position
        case thumbnail
        case source
        case title
        case link
        case original
        case originalWidth = "original_width"
        case originalHeight = "original_height"
        case isProduct = "is_product"
        case inStock = "in_stock"
    }
}
