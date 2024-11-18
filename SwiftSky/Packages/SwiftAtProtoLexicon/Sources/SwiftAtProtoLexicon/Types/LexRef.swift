//
//  LexRef.swift
//  SwiftAtProtoLexicon
//
//

struct LexRef: BaseLexiconType, Codable {
    var type: LexiconType { .REF }
    let description: String?
    let ref: String
    
    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case ref
    }
}
