//
//  LexInteger.swift
//  SwiftAtProtoLexicon
//
//

struct LexInteger: BaseLexiconType, Codable {
    var type: LexiconType { .INTEGER }
    let description: String?
    let `default`: [Int]
    let minimum: Int?
    let maximum: Int?
    let `enum`: [Int]?
    let const: Int?

    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case `default`
        case minimum
        case maximum
        case `enum`
        case const
    }
}
