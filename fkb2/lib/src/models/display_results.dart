class DisplayResults {
  String data = " ";
  int index;

  var dataList = <String>[];

  DisplayResults() {
    //int row = 5;
    //int col = 10;

    //var twoDList = List.generate(row, (i) => List(col), growable: true);
  }

  set SetIndex(i) {
    this.index = i;
  }

  set SaveData(datacmp) {
    data = datacmp;
    SaveResults(this.index, data);
  }

  SaveResults(int i, String datacmp) {
    data = datacmp;
    print("carousel id is" + i.toString());
    int index = i - 1;
    dataList[index] = datacmp;
    print("saved");
    print(dataList[index]);
  }

  ShowResults(int i) {
    if (dataList.length > 0) {
      int index = i - 1;
      return dataList[index];
    }
  }

  get Show {
    return this.dataList[0];
  }
}
