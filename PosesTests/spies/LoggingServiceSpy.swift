// @copyright Trollwerks Inc.

@testable import Poses_Pro

// generated by https://github.com/seanhenry/SwiftMockGeneratorForXcode
// swiftlint:disable all

final class LoggingServiceSpy: LoggingService {
    var invokedCustom = false
    var invokedCustomCount = 0
    var invokedCustomParameters: (level: LoggingLevel, file: String, function: String, line: Int, context: Any?)?
    var invokedCustomParametersList = [(level: LoggingLevel, file: String, function: String, line: Int, context: Any?)]()
    var shouldInvokeCustomMessage = false
    func custom(level: LoggingLevel,
    message: @autoclosure () -> Any,
    file: String,
    function: String,
    line: Int,
    context: Any?) {
        invokedCustom = true
        invokedCustomCount += 1
        invokedCustomParameters = (level, file, function, line, context)
        invokedCustomParametersList.append((level, file, function, line, context))
        if shouldInvokeCustomMessage {
            _ = message()
        }
    }
}
