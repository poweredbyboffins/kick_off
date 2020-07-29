class DisplayResults {
  String data = " ";
  int index;

  var dataList = <String>[];

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
    dataList.add(datacmp);
    int len = dataList.length;
    print('Save Length' + len.toString());
    //print(dataList[index]);
  }

  ShowResults(int i) {
    if (dataList.length > 0) {
      int index = i - 1;
      return dataList[index]; //dataList[index];
    }
  }

  get Show {
    return this.dataList[0];
  }
}
