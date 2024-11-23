//
//  LexToken.swift
//  SwiftAtProtoLexicon
//

struct LexToken: BaseLexiconType, Codable {
    var type: LexiconType { .TOKEN }
    let description: String?

    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
    }
}
