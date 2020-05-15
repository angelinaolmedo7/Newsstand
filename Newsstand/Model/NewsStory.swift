import Foundation

struct NewsStory {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: URL?
    let url: URL?
}

extension NewsStory: Decodable {
    
//    enum NewsStoryCodingKeys: String, CodingKey {
//        case author
//        case title
//        case description
//    }

//    init(from decoder: Decoder) throws {
//        let newsStoryContainer = try decoder.container(keyedBy: NewsStoryCodingKeys.self)
//        author = try newsStoryContainer.decode(String.self, forKey: .author)
//        print(author)
//        title = try newsStoryContainer.decode(String.self, forKey: .title)
//        print(title)
//        description = try newsStoryContainer.decode(String.self, forKey: .description)
//    }
}

struct NewsApiResponse {
//    let numberOfStories: Int
    let articles: [NewsStory]?
}

extension NewsApiResponse: Decodable {

//    private enum NewsApiResponseCodingKeys: String, CodingKey {
//        case numberOfStories = "totalResults"
//        case stories = "articles"
//    }

//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: NewsApiResponseCodingKeys.self)
//        numberOfStories = try container.decode(Int.self, forKey: .numberOfStories)
//        stories = try container.decode([NewsStory].self, forKey: .stories)
//    }
}
