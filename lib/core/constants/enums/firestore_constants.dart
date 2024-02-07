/// This file contains the enums used in the firestore database
enum CategoriesEnum {
  education("Education"),
  transport("Transport"),
  economy("Economy"),
  health("Health"),
  technology("Technology"),
  artsAndCulture("Arts and Culture"),
  sport("Sport"),
  entertainment("Entertainment"),
  environment("Environment"),
  policy("Policy"),
  security("Security"),
  other("Other");

  final String value;
  const CategoriesEnum(this.value);
}

/// This file contains the enums used in the firestore database
enum FirestoreAllowedFileTypes { image, video, audio, pdf, unknown }
