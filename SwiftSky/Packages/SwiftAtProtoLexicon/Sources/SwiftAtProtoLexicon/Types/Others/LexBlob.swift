//
//  LexBlob.swift
//  SwiftAtProtoLexicon
//

struct LexBlob: BaseLexiconType, Codable {
    var type: LexiconType { .BLOB }
    let description: String?
    let accept: [String]?
    let maxSize: Int?
    
    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case accept
        case maxSize
    }
}

