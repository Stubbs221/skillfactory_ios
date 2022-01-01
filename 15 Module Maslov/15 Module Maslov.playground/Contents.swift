// Exercise 1
enum requestErrors: Error {
    case error404
    case error400
    case error500
}

var error400 = false
var error404 = true
var error500 = false

do {
    if error400 { throw requestErrors.error400 }
    if error404 { throw requestErrors.error404 }
    if error500 { throw requestErrors.error500 }
} catch requestErrors.error400 {
    print("Error 400. Bad request")
} catch requestErrors.error404 {
    print("Error 404. Page not found")
} catch requestErrors.error500 {
    print("Error 500. Internal Server Error")
}

// Exercise 2

func requestErrorHandler() throws {
    if error400 { throw requestErrors.error400 }
    if error404 { throw requestErrors.error404 }
    if error500 { throw requestErrors.error500 }
}

do {
    try requestErrorHandler()
} catch requestErrors.error400 {
    print("Error 400. Bad request")
} catch requestErrors.error404 {
    print("Error 404. Page not found")
} catch requestErrors.error500 {
    print("Error 500. Internal Server Error")
}

// Exercise 3

func isTypesEqual<T1, T2>(_ a: T1,_ b: T2) -> String {
    return type(of: a) == type(of: b) ? "Yes" : "No"
}

isTypesEqual(1, 5)
isTypesEqual("a", 1.0)

// Exercire 4

enum isEqual: Error {
    case equal
    case notEqual
}

func istypesEqualTwo<T1, T2>(_ a: T1, _ b: T2) throws {
    if type(of: a) == type(of: b) { throw isEqual.equal }
    throw isEqual.notEqual
}

do {
    try istypesEqualTwo("a", 1.0)
} catch isEqual.equal {
    print("Yes")
} catch isEqual.notEqual {
    print("No")
}

// Exercise 5

func isValuesEqual<T: Equatable>(_ a: T,_ b: T) -> String {
    return a == b ? "Values is equal" : "Values in not equal"
}

isValuesEqual(5, 5)
isValuesEqual("a", "aa")
