/// Model to represent a language with its name, language code, and country code.
class LanguageModel {
  final String name; // The display name of the language.
  final String code; // The language code (e.g., 'en', 'ar').
  final String countryCode; // The country code associated with the language.

  /// Constructor for `LanguageModel`.
  LanguageModel(this.name, this.code, this.countryCode);
}
