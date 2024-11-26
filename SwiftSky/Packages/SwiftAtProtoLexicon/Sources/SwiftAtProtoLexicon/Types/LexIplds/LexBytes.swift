//
//  LexBytes.swift
//  SwiftAtProtoLexicon
//
//

struct LexBytes: BaseLexiconType, Codable {
    var type: LexiconType { .BYTES }
    let description: String?
    let maxLength: Int?
    let minLength: Int?

    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case maxLength
        case minLength
    }
}
