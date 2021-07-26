import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:places/ui/screen/add_sight_screen_select_category.dart';
import 'package:places/mocks.dart';
import 'package:places/domain/sight.dart';

class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State {
  final categoryTextController = TextEditingController();
  final titleTextController = TextEditingController();
  final latitudeTextController = TextEditingController();
  final longitudeTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  FocusNode categoryFocusNode = FocusNode();
  FocusNode titleFocusNode = FocusNode();
  FocusNode latitudeFocusNode = FocusNode();
  FocusNode longitudeFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    latitudeFocusNode.addListener(() {
      setState(() {});
    });
    longitudeFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
              width: 90,
              child: TextButton(
                  child: Text(
                    cancelText,
                    style: normal.copyWith(
                        color: Theme.of(context).colorScheme.unselectedColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })),
          Expanded(
              child: Text(
            newPlaceText,
            textAlign: TextAlign.center,
            style: normal.copyWith(
                color: Theme.of(context).colorScheme.titleColor),
          )),
          Container(width: 90, child: SizedBox.shrink())
        ]),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          categoryRow(categoryTextController, categoryFocusNode, () async {
            var value = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => SelectCategoryScreen(
                      keyCategoryByText(categoryTextController.text))),
            );
            if (value != null) {
              categoryTextController.text = value;
              titleFocusNode.requestFocus();
            }
          }),
          titleRow(titleTextController, titleFocusNode, () {
            latitudeFocusNode.requestFocus();
          }),
          coordinatesRow(latitudeTextController, longitudeTextController,
              latitudeFocusNode, longitudeFocusNode, () {
            longitudeFocusNode.requestFocus();
          }, () {
            descriptionFocusNode.requestFocus();
          }),
          Row(children: [
            SizedBox(width: 16),
            TextButton(
                child: Text(
                  specifyOnTheMapText,
                  style: normal.copyWith(
                      color:
                          Theme.of(context).colorScheme.buttonBackgroundColor),
                ),
                onPressed: () {})
          ]),
          descriptionRow(descriptionTextController, descriptionFocusNode),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 150),
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                height: 48,
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context)
                                .colorScheme
                                .buttonBackgroundColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: Text(
                      createText,
                      style: normal.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      Sight s = Sight(
                          titleTextController.text,
                          double.tryParse(latitudeTextController.text),
                          double.tryParse(longitudeTextController.text),
                          'https://upload.wikimedia.org/wikipedia/commons/a/af/All_Gizah_Pyramids.jpg',
                          descriptionTextController.text,
                          keyCategoryByText(categoryTextController.text),
                          'комментарий',
                          'расписание');
                      mocks.add(s);

                      Navigator.of(context).pop();
                    })),
          ))
        ],
      ),
    );
  }
}

class categoryRow extends StatelessWidget {
  final categoryTextController;
  FocusNode categoryFocusNode;
  void Function() onPressed;

  categoryRow(
      this.categoryTextController, this.categoryFocusNode, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(left: 16, top: 24, bottom: 8),
          alignment: Alignment.topLeft,
          child: Text(categoryText,
              style: normal12.copyWith(
                  color: Theme.of(context).colorScheme.unselectedColor))),
      Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
              controller: categoryTextController,
              focusNode: categoryFocusNode,
              autofocus: true,
              style: text,
              readOnly: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                  hintText: notSelectedText,
                  suffixIcon: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.titleColor),
                  )))),
    ]);
  }
}

class titleRow extends StatelessWidget {
  final titleTextController;
  FocusNode titleFocusNode;
  void Function() onEditingComplete;

  titleRow(
      this.titleTextController, this.titleFocusNode, this.onEditingComplete);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(left: 16, top: 24, bottom: 12),
          alignment: Alignment.topLeft,
          child: Text(titleText,
              style: normal12.copyWith(
                  color: Theme.of(context).colorScheme.unselectedColor))),
      Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: titleTextController,
            focusNode: titleFocusNode,
            style: text,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                border: OutlineInputBorder()),
            onEditingComplete: onEditingComplete,
          )),
    ]);
  }
}

class coordinatesRow extends StatelessWidget {
  final latitudeTextController;
  final longitudeTextController;
  FocusNode latitudeFocusNode;
  FocusNode longitudeFocusNode;
  void Function() latitudeOnEditingComplete;
  void Function() longitudeOnEditingComplete;

  coordinatesRow(
      this.latitudeTextController,
      this.longitudeTextController,
      this.latitudeFocusNode,
      this.longitudeFocusNode,
      this.latitudeOnEditingComplete,
      this.longitudeOnEditingComplete);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 24),
      Row(children: [
        SizedBox(width: 16),
        Expanded(
            child: Text(latitudeText,
                style: normal12.copyWith(
                    color: Theme.of(context).colorScheme.unselectedColor))),
        SizedBox(width: 16),
        Expanded(
            child: Text(longitudeText,
                style: normal12.copyWith(
                    color: Theme.of(context).colorScheme.unselectedColor))),
        SizedBox(width: 16),
      ]),
      SizedBox(height: 12),
      Row(children: [
        SizedBox(width: 16),
        Expanded(
            child: TextField(
          controller: latitudeTextController,
          focusNode: latitudeFocusNode,
          style: text,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
            border: OutlineInputBorder(),
            suffixIcon: latitudeFocusNode.hasFocus
                ? IconButton(
                    onPressed: () {
                      latitudeTextController.clear();
                    },
                    icon: Icon(Icons.cancel,
                        color: Theme.of(context).colorScheme.titleColor),
                  )
                : SizedBox.shrink(),
          ),
          onEditingComplete: latitudeOnEditingComplete,
        )),
        SizedBox(width: 16),
        Expanded(
            child: TextField(
          controller: longitudeTextController,
          focusNode: longitudeFocusNode,
          style: text,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
            border: OutlineInputBorder(),
            suffixIcon: longitudeFocusNode.hasFocus
                ? IconButton(
                    onPressed: () {
                      longitudeTextController.clear();
                    },
                    icon: Icon(Icons.cancel,
                        color: Theme.of(context).colorScheme.titleColor),
                  )
                : SizedBox.shrink(),
          ),
          onEditingComplete: longitudeOnEditingComplete,
        )),
        SizedBox(width: 16),
      ]),
      SizedBox(height: 10),
    ]);
  }
}

class descriptionRow extends StatelessWidget {
  final descriptionTextController;
  FocusNode descriptionFocusNode;

  descriptionRow(this.descriptionTextController, this.descriptionFocusNode);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(left: 16, top: 24, bottom: 12),
          alignment: Alignment.topLeft,
          child: Text(descriptionText,
              style: normal12.copyWith(
                  color: Theme.of(context).colorScheme.unselectedColor))),
      Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
              controller: descriptionTextController,
              focusNode: descriptionFocusNode,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              style: text,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                  hintText: enterTheTextText,
                  border: OutlineInputBorder()))),
    ]);
  }
}
