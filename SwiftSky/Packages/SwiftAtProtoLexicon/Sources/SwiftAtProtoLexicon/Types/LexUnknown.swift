//
//  LexUnkown.swift
//  SwiftAtProtoLexicon
//

struct LexUnknown: BaseLexiconType, Codable {
    var type: LexiconType { .UNKOWN }
    let description: String?
    
    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
    }
}
