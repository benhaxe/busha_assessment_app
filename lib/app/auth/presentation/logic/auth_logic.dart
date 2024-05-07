class AuthLogic {
  String _reArrangePassword(String value) {
    List<String> splitPassword = value.toLowerCase().split('');

    //The correct password is busha.
    List<String> expectedSequence = ['b', 'u', 's', 'h', 'a'];

    for (int i = 0; i < expectedSequence.length; i++) {
      if (splitPassword.isEmpty) break;

      int index = splitPassword.indexOf(expectedSequence[i]);

      if (index != -1) {
        splitPassword.removeAt(index);
        splitPassword.add(expectedSequence[i]);
      }
    }

    // Join the rearranged letters to form a string
    String rearrangedWord = splitPassword.join('');

    // Return the rearranged word
    return rearrangedWord;
  }

  bool validatePassword(String userInput) {
    String correctPassword = "busha";
    String userPassword = _reArrangePassword(userInput);

    if (userPassword != correctPassword) {
      return false;
    }
    return true;
  }
}
