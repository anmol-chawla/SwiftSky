//
//  LexCidLink.swift
//  SwiftAtProtoLexicon
//
//

struct LexCidLink: BaseLexiconType, Codable {
    var type: LexiconType { .CID_LINK }
    let description: String?

    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
    }
}
