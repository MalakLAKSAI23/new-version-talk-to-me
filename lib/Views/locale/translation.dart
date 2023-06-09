import 'package:get/get.dart';
import 'package:talktome/Views/locale/langue/en.dart';
import 'package:talktome/Views/locale/langue/fr.dart';
class Translation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en':en,
    'fr':fr,
  };

}