// @copyright Trollwerks Inc.

import Foundation

/// Retrieves secrets from externally populated Secrets.plist
enum Secrets: String {

    /// Flurry API Key
    case flurryApiKey
    /// SwiftyBeaver App ID
    case sbAppId
    /// SwiftyBeaver App Secret
    case sbAppSecret
    /// SwiftyBeaver Encryption Key
    case sbEncryptionKey

    private static var file: SecretsFile? = {
        load(secrets: Bundle.main.url(forResource: "Secrets",
                                      withExtension: "plist"))
    }()

    /// Secret value
    var secret: String {
        guard let file = Self.file else {
            return "MISSING"
        }
        switch self {
        case .flurryApiKey:
            return file.flurryApiKey
        case .sbAppId:
            return file.sbAppId
        case .sbAppSecret:
            return file.sbAppSecret
        case .sbEncryptionKey:
            return file.sbEncryptionKey
        }
    }

    /// Inject secrets file location
    /// - Parameter secrets: URL of possible secrets
    static func inject(secrets: URL?) {
        Self.file = load(secrets: secrets)
    }

    private static func load(secrets: URL?) -> SecretsFile? {
        guard let url = secrets,
              let data = try? Data(contentsOf: url) else { return nil }
        return try? PropertyListDecoder().decode(SecretsFile.self, from: data)
    }
}

private struct SecretsFile: Decodable {

    /// Flurry API Key
    let flurryApiKey: String
    /// SwiftyBeaver App ID
    let sbAppId: String
    /// SwiftyBeaver App Secret
    let sbAppSecret: String
    /// SwiftyBeaver Encryption Key
    let sbEncryptionKey: String
}
