import struct SwiftUI.CGFloat

public extension Optional {
    var isNil: Bool { self == nil }
    var isNotNil: Bool { self != nil }
}

public extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        switch self {
        case let .some(collection):
            collection.isEmpty
        case .none:
            true
        }
    }

    var isNotNilAndNotEmpty: Bool { !isNilOrEmpty }
}

public extension Int? {
    var isNilOrZero: Bool {
        switch self {
        case let number?:
            number == 0
        case nil:
            true
        }
    }

    var isNotZero: Bool { !isNilOrZero }
}

public extension Float? {
    var isNilOrZero: Bool {
        switch self {
        case let number?:
            number == 0.0
        case nil:
            true
        }
    }

    var isNotZero: Bool { !isNilOrZero }
}

public extension Double? {
    var isNilOrZero: Bool {
        switch self {
        case let number?:
            number == 0.0
        case nil:
            true
        }
    }

    var isNotZero: Bool { !isNilOrZero }
}

public extension CGFloat? {
    var isNilOrZero: Bool {
        switch self {
        case let number?:
            number == 0.0
        case nil:
            true
        }
    }

    var isNotZero: Bool { !isNilOrZero }
}

public func isNil(_ optional: (some Any)?) -> Bool {
    switch optional {
    case .some: false
    case .none: true
    }
}

public func isNotNil(_ optional: (some Any)?) -> Bool {
    switch optional {
    case .some: true
    case .none: false
    }
}
