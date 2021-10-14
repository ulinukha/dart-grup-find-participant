import 'dart:convert';
import 'package:test/test.dart';

void main() {
  printTest(3);
  unitTest();
}

printTest(e) {
  var _listGrup = [
    {
      'grup': {
        'thisName': 'general',
        'value': [2, 3, 4]
      }
    },
    {
      'grup': {
        'thisName': 'infra',
        'value': [3, 5]
      }
    },
    {
      'grup': {
        'thisName': 'humor',
        'value': [4, 6]
      }
    },
    {
      'grup': {
        'thisName': 'opt',
        'value': [9, 10]
      }
    },
    {
      'grup': {
        'thisName': 'link',
        'value': [4, 6, 2, 9, 12]
      }
    },
    {
      'grup': {
        'thisName': 'devops',
        'value': [3, 5]
      }
    }
  ];

  String thisGrupList = jsonEncode(_listGrup);
  List map = jsonDecode(thisGrupList);
  List item = [];
  int counter = 0;

  for (var i = 0; i < map.length; i++) {
    var perItem = map[i];
    List valueItem = perItem['grup']['value'];

    if (valueItem.contains(e)) {
      int tempCounter = valueItem.length;
      if (counter == 0 || counter == tempCounter) {
        counter = tempCounter;

        item.add(perItem['grup']['thisName']);
      }

      if (counter > tempCounter) {
        item.clear();
        counter = tempCounter;

        item.add(perItem['grup']['thisName']);
      }
    }
  }

  print(item);
  return item;
}

unitTest() {
  test("testing find participan", () {
    expect(printTest(3), equals(['infra', 'devops']));
  });
}
