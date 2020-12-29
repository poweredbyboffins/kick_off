/* Singleton */
class Round {
  int roundid = 1;

  static final Round _instance = Round._internal();

  factory Round() {
    return _instance;
  }

  Round._internal();

  getroundid() {
    return this.roundid;
  }

  setroundid(roundid) {
    this.roundid = roundid;
  }

  incrementroundid(roundid) {
    return this.roundid = roundid + 1;
  }

  bool lastround() {
    if (this.roundid <= 5) {
      return false;
    } else
      return true;
  }
}
