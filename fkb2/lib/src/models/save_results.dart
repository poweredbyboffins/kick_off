class SaveResults {
  /* We need to eventually write this to the cloud */

  SaveResults() {
    int row = 5;
    int col = 10;

    var twoDList = List.generate(row, (i) => List(col), growable: true);
  }

  StoreResult() {}
}
