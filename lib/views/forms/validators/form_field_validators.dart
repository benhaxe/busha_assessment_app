class AppFormFielValidator {
  static final RegExp emailRegex = RegExp(
      r"^[a-z0-9][-a-z0-9.!#$%&'*+-=?^_`{|}~\/]+@([-a-z0-9]+\.)+[a-z]{2,5}$");

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Required';
    } else if (!emailRegex.hasMatch(value.toLowerCase())) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required';
    } else if (value.length < 5) {
      return 'Password must be maximum of 5 letters';
    } else {
      return null;
    }
  }
}
