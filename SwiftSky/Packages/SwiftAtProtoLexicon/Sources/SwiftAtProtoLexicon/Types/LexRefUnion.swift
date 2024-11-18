//
//  LexRefUnion.swift
//  SwiftAtProtoLexicon
//

struct LexRefUnion: BaseLexiconType, Codable {
    var type: LexiconType { .REF_UNION }
    let description: String?
    let refs: [String],
    let closed: Bool?
    
    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case refs
        case closed
    }
}

