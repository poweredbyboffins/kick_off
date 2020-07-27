class FlagsSet
{

 bool isButtonDisabled;

  FlagsSet (this.isButtonDisabled)
  {

   isButtonDisabled=this.isButtonDisabled;
  }

  bool get getdisableflag
  {
    return isButtonDisabled;
  }

  set setdisableflag (bool flagval)
  {
    isButtonDisabled=flagval;
  }
}

//final flags=FlagsSet(true);