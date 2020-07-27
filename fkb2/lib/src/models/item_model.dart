class ItemModel {
String title;
String answer;

List<_Result> _results = [];



ItemModel.fromJson(List<dynamic> jsondata) {
    List<_Result> temp = [];
    for (int i = 0; i < jsondata.length; i++) {
      _Result result = _Result(jsondata[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

}  

class _Result {
  String _answer;

  _Result(result)
  {_answer=result
  ;

  
  }
  
  


String get answer => _answer;

}
