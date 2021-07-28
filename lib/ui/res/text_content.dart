
const String hotelText = 'Отель';
const String restourantText = 'Ресторан';
const String particularPlaceText = 'Особое место';
const String parkText = 'Парк';
const String museumText = 'Музей';
const String cafeText = 'Кафе';
//const String cinemaText = 'Кинотеатр';
//const String theatreText = 'Театр';

const String radius0Text = 'до 100 м';
const String radius1Text = 'до 250 м';
const String radius2Text = 'до 500 м';
const String radius3Text = 'до 1 км';
const String radius4Text = 'до 2 км';
const String radius5Text = 'до 3 км';
const String radius6Text = 'до 4 км';
const String radius7Text = 'до 5 км';
const String radius8Text = 'до 7.5 км';
const String radius9Text = 'до 10 км';

const String clearText = 'Очистить';
const String showText = 'ПОКАЗАТЬ';
const String createText = 'СОЗДАТЬ';
const String saveText = 'СОХРАНИТЬ';
const String distanceText = 'Расстояние';
const String categoryText = 'Категория';
const String categoriesText = 'КАТЕГОРИИ';
const String cancelText = 'Отмена';
const String titleText = 'НАЗВАНИЕ';
const String latitudeText = 'ШИРОТА';
const String longitudeText = 'ДОЛГОТА';
const String descriptionText = 'ОПИСАНИЕ';
const String specifyOnTheMapText = 'Указать на карте';
const String notSelectedText = 'Не выбрано';
const String enterTheTextText = 'введите текст';
const String newPlaceText = 'Новое место';
const String listOfInterestingPlacesText = 'Cписок интересных мест';
const String searchText = 'Поиск';
const String clearHistoryText = 'Очистить историю';
const String youWereLookingForText = 'Вы искали';

enum keysCategories { hotel, restourant, particularPlace, park, museum, cafe }
String textByKeyCategory(keysCategories key) {
  if (key == keysCategories.hotel) return hotelText;
  if (key == keysCategories.restourant) return restourantText;
  if (key == keysCategories.particularPlace) return particularPlaceText;
  if (key == keysCategories.park) return parkText;
  if (key == keysCategories.museum) return museumText;
  if (key == keysCategories.cafe) return cafeText;
}
keysCategories keyCategoryByText(String text) {
  if (text==hotelText) return keysCategories.hotel;
  if (text==restourantText) return keysCategories.restourant;
  if (text==particularPlaceText) return keysCategories.particularPlace;
  if (text==parkText) return keysCategories.park;
  if (text==museumText) return keysCategories.museum;
  if (text==cafeText) return keysCategories.cafe;
  return null;
}



