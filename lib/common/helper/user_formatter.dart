class UserFormatter {
  /// format phoneNbr
  static String formPhoneNbr(String phoneNbr) {
    /// format +33 612345678
    if (phoneNbr.length == 12) {
      return '+${phoneNbr.substring(0, 2)} 0${phoneNbr[3]} ${phoneNbr.substring(4, phoneNbr.length)}';
    }
    return phoneNbr;
  }
}
