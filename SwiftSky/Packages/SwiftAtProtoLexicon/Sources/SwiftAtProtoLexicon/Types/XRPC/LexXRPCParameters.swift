//
//  LexXRPCParameters.swift
//  SwiftAtProtoLexicon
//

enum LexXRPCParameterProperty: Codable, LexiconFieldTypeDefinition {
    case PRIMITIVE_ARRAY(LexPrimitiveArray)

        // Lex Primitive
    case BOOLEAN(LexBoolean)
    case INTEGER(LexInteger)
    case STRING(LexString)
    case UNKNOWN(LexUnknown)

    private enum CodingKeys: String, CodingKey {
        case type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        guard let type = try LexiconType(rawValue: container.decode(String.self, forKey: .type)) else {
            throw DecodingError.typeMismatch(
                LexArrayItem.self,
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Expected a single key, found multiple"
                )
            )
        }

        switch type
        {
        case .ARRAY: self = try .PRIMITIVE_ARRAY(LexPrimitiveArray(from: decoder))
        case .BOOLEAN: self = try .BOOLEAN(LexBoolean(from: decoder))
        case .INTEGER: self = try .INTEGER(LexInteger(from: decoder))
        case .STRING: self = try .STRING(LexString(from: decoder))
        case .UNKOWN: self = try .UNKNOWN(LexUnknown(from: decoder))
        default: throw DecodingError.typeMismatch(
            LexArrayItem.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Unknown type \(type)"
            )
        )
        }
    }

    func encode(to encoder: Encoder) throws {
        switch self
        {
        case let .PRIMITIVE_ARRAY(def): try def.encode(to: encoder)
        case let .BOOLEAN(def): try def.encode(to: encoder)
        case let .INTEGER(def): try def.encode(to: encoder)
        case let .STRING(def): try def.encode(to: encoder)
        case let .UNKNOWN(def): try def.encode(to: encoder)
        }
    }
}

struct LexXRPCParameters: BaseLexiconType, Codable {
    var type: LexiconType { .PARAMS }
    let description: String?
    let required: [String]?
    let properties: [String: LexXRPCParameterProperty]

    private enum TypedCodingKeys: String, CodingKey {
        case type
        case description
        case required
        case properties
    }
}
