import 'package:zapx/zapx.dart';

// ignore_for_file: file_names

/// Extension providing translation capabilities for String.
extension TranslationExtension on String {
  /// Translates the string using the app's current locale.
  /// If a translation is found, it returns the translated string; otherwise, it returns the original string.
  String get ztr {
    // Access the translationsKeys from the XMaterialApp using the global Zap context.
    var map = XMaterialApp.of(Zap.context).translationsKeys;

    // Determine the target language based on the app's current locale or the system locale.
    String targetLanguage = XMaterialApp.of(Zap.context).locale?.languageCode ??
        Zap.systemLocale.languageCode.toLowerCase();

    // Check if the translations map is available and contains the target language and key.
    if (map != null &&
        map.containsKey(targetLanguage) &&
        map[targetLanguage]!.containsKey(this)) {
      // Return the translated string.
      return map[targetLanguage]![this]!;
    } else {
      // If no translation is found, return the original string.
      return this;
    }
  }

}
