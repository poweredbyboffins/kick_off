import 'compare_guess.dart';

class DisplayResults {
  String data = " ";
  int index;

  var dataList = <String>[];
  int oldround;

  //List<List<String>> data2D = [[]];
  List dataPerRound = [];

  DisplayResults._privateConstructor();

  static final DisplayResults _instance = DisplayResults._privateConstructor();

  factory DisplayResults() {
    return _instance;
  }
  //DisplayResults();

  set SetIndex(i) {
    this.index = i;
  }

  set SaveData(datacmp) {
    data = datacmp;
    //SaveResults(this.index, data);
  }

  SaveResults(int i, String datacmp) {
    data = datacmp;
    print("carousel id is" + i.toString());
    int index = i - 1;

    bool newvalue = true;
    for (var i = 0; i < dataList.length; i++) {
      if (dataList[i] == datacmp) {
        newvalue = false;
      }
    }
    if (newvalue) {
      dataList.add(datacmp);
      int len = dataList.length;
    }
  }

  bool newValueCheck(int roundid, String data) {
    bool newvalue = true;

    //List<String> arr = [].addAll(data2D[i1]);
    //List<String> arr = data2D[i1].map((element) => element).toList();
    if (roundid == 1) {
      oldround = 1;
    }

    if (oldround != roundid) {
      /* reset */
      int datalen = dataPerRound.length;
      dataPerRound.removeRange(0, datalen - 1);
      oldround = roundid;
    }

    for (var i = 0; i < dataPerRound.length; i++) {
      if (dataPerRound[i] == data) {
        newvalue = false;
      }
    }
    if (newvalue) {
      dataPerRound.add(data);
    }

    return newvalue;
  }

  ShowResults(int i) {
    if (dataList.length > 0) {
      int index = i - 1;
      //int index = i;
      return dataList[index];
    }
  }

  get Show {
    return this.dataList[0];
  }

  Initialise() {
    dataList.clear();
    dataPerRound.clear();
    guess.getdata();
  }
}
