import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_content.dart';

final List<Sight> mocks = [
  Sight(
      'The Pyramids',
      29.9792345,
      31.1320132,
      'https://upload.wikimedia.org/wikipedia/commons/a/af/All_Gizah_Pyramids.jpg',
      'The time is afraid of the pyramids',
      keysCategories.particularPlace,
      'Запланировано на 12 окт. 2020',
      'закрыто до 09:00'),
  Sight(
      'The Kremlin',
      55.7520233,
      37.6153107,
      'https://upload.wikimedia.org/wikipedia/commons/3/3d/Moscow_Kremlin_and_Bolshoy_Kamenny_Bridge_late_evening_01.JPG',
      'The fortress in the center of Moscow and its oldest part',
      keysCategories.particularPlace,
      'Цель достигнута 12 окт. 2020',
      'закрыто до 09:00'),
  Sight(
      'The Eiffel Tower',
      48.8583701,
      2.2922926,
      'https://upload.wikimedia.org/wikipedia/commons/8/85/Tour_Eiffel_Wikimedia_Commons_(cropped).jpg',
      'The most recognizable attraction in Paris',
      keysCategories.particularPlace,
      'Запланировано на 19 сен. 2020',
      'закрыто до 09:00'),
];


final List<Sight> mocks_want_to_visit = [mocks[0], mocks[2]];
final List<Sight> mocks_visited = [mocks[1]];