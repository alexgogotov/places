import 'package:places/ui/res/text_content.dart';

class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final keysCategories category;
  final String comment;
  final String hours;

  Sight(this.name, this.lat, this.lon, this.url, this.details, this.category, this.comment, this.hours);
}