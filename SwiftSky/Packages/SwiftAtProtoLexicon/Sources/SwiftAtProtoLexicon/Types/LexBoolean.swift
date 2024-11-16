//
//  LexBoolean.swift
//  SwiftAtProtoLexicon
//
//

struct LexBoolean: BaseLexiconType, Codable {
    var type: LexiconType { .BOOLEAN }
    let description: String?
    let `default`: Bool?
    let const: Bool?
    
    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case `default`
        case const
    }
}
