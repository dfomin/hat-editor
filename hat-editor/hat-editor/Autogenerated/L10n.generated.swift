// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {
  /// Отмена
  internal static let cancel = L10n.tr("Localizable", "Cancel")
  /// Ошибка
  internal static let error = L10n.tr("Localizable", "Error")
  /// Нет
  internal static let no = L10n.tr("Localizable", "No")
  /// Ок
  internal static let ok = L10n.tr("Localizable", "Ok")
  /// Наборы слов
  internal static let packagesTitle = L10n.tr("Localizable", "Packages_Title")
  /// Повторить
  internal static let `repeat` = L10n.tr("Localizable", "Repeat")
  /// Да
  internal static let yes = L10n.tr("Localizable", "Yes")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
