import Foundation

struct ImageResponse: Codable {
  
  var images: [ImagesResult]?
  
}

// MARK: - Welcome
struct Welcome: Codable {
    let searchMetadata: SearchMetadata
    let searchParameters: SearchParameters
    let searchInformation: SearchInformation
    let imagesResults: [ImagesResult]

    enum CodingKeys: String, CodingKey {
        case searchMetadata = "search_metadata"
        case searchParameters = "search_parameters"
        case searchInformation = "search_information"
        case imagesResults = "images_results"
    }
}

// MARK: - ImagesResult
struct ImagesResult: Codable, Identifiable {
    let id: Int
    let original: String
    let originalWidth, originalHeight: Int
    let source, title: String
    let link: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case id = "position"
        case original
        case originalWidth = "original_width"
        case originalHeight = "original_height"
        case source, title, link, thumbnail
    }
}

// MARK: - SearchInformation
struct SearchInformation: Codable {
    let imageResultsState: String

    enum CodingKeys: String, CodingKey {
        case imageResultsState = "image_results_state"
    }
}

// MARK: - SearchMetadata
struct SearchMetadata: Codable {
    let id, status: String
    let jsonEndpoint: String
    let createdAt, processedAt: String
    let googleURL: String
    let rawHTMLFile: String
    let totalTimeTaken: Double

    enum CodingKeys: String, CodingKey {
        case id, status
        case jsonEndpoint = "json_endpoint"
        case createdAt = "created_at"
        case processedAt = "processed_at"
        case googleURL = "google_url"
        case rawHTMLFile = "raw_html_file"
        case totalTimeTaken = "total_time_taken"
    }
}

// MARK: - SearchParameters
struct SearchParameters: Codable {
    let engine, q, googleDomain, ijn: String
    let device, tbm: String

    enum CodingKeys: String, CodingKey {
        case engine, q
        case googleDomain = "google_domain"
        case ijn, device, tbm
    }
}
