//
//  LexiconTypeSchema.swift
//  SwiftAtProtoLexicon
//

class LexiconTypeSchema: Codable {
    var prefix = ""
    var id = ""
    var defName = ""

    let type: LexiconFieldTypeDefinition
    let isRecord: Bool
    let needsType: Bool

    private static func fix(type: LexiconFieldTypeDefinition, needsType: Bool) -> Bool {
        switch type {
            case let .(def): def.properties.isEmpty ? true : needsType
            default: needsType
        }
    }
    init(prefix: String, id: String, defName: String, type: LexiconFieldTypeDefinition, needsType: Bool = false) {
        self.prefix = prefix
        self.id = id
        self.defName = defName
        
        self.type = type
        self.needsType = needsType
        isRecord = needsType
    }
}

