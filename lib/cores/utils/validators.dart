
import '../constants/app_literals.dart';

abstract class Validator {
  static String? validator;
}

// TextField validators

class UserNameValidator implements Validator {
  static String? validator(String? name) {
    return name!.isEmpty ? 'Username is required' : null;
  }
}

class EmailValidator implements Validator {
  static String? validator(String? email) {
    return email!.isEmpty
        ? 'Email is required'
        : AppLiterals.emailRegExp.hasMatch(email)
            ? null
            : 'Invalid Email Address';
  }
}

class ConfirmPasswordValidator implements Validator {
  static String? validator(String? password, String? otherPassword) {
    return (password?.isEmpty ?? true) && (otherPassword?.isEmpty ?? true)
        ? "This field is required"
        : password!.length < 8 && otherPassword!.length < 8
            ? "Min. Password Length is 8"
            : password != otherPassword
                ? "password does not match"
                : null;
  }
}

class PasswordValidator implements Validator {
  static String? validator(String? password) {
    return password!.isEmpty
        ? 'Password is required'
        : password.length >= 8
            ? null
            : 'Min. Password Length is 8';
  }
}

class DobValidator implements Validator {
  static String? validator(String? name) {
    return name!.isEmpty ? 'Date of birth is required' : null;
  }
}

class EmptyDateFieldValidator implements Validator {
  static String? validator(String? dateTime) {

    if (dateTime == null || dateTime.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }
}

class GenderValidator implements Validator {
  static String? validator(name) {
    return name == null ? 'Gender is required' : null;
  }
}

class PhoneValidator implements Validator {
  static String? validator(String? phone) {
    return phone!.isEmpty ? 'Phone number is required' : null;
  }
}

class TrueValidator implements Validator {
  static String? validator(bool? value) {
    if (value == null) {
      return 'You have to agree to Terms & Conditions';
    }
    return value ? null : 'You have to agree to Terms & Conditions';
  }
}

class DynamicFieldValidator implements Validator {
  static String? validator(dynamic file) {
    if (file == null) {
      return 'This field is required.';
    }
    return null;
  }
}


// Generic Validator
class EmptyFieldValidator implements Validator {
  static String? validator(dynamic string) {
    if (string == null) {
      return 'This field is required.';
    }
    return string.toString().isNotEmpty ? null : 'This field is Required';
  }
}

class DoneQuantityValidator implements Validator {
  static String? validator(
      String doneQty, String demandQty, String availableQty) {
    return doneQty.isEmpty || availableQty.isEmpty
        ? ''
        : int.parse(doneQty) <= int.parse(availableQty) &&
                int.parse(doneQty) <= int.parse(demandQty)
            ? null
            : '';
  }
}

class MaxQuantityValidator implements Validator {
  static String? validator(String? maxQty, String? minQty, bool allowEmpty) {
    if (allowEmpty) {
      if (maxQty!.isEmpty || minQty!.isEmpty) {
        return null;
      } else {
        return int.parse(maxQty) >= int.parse(minQty) ? null : '';
      }
    }
    return maxQty!.isEmpty || minQty!.isEmpty
        ? ''
        : int.parse(maxQty) >= int.parse(minQty)
            ? null
            : '';
  }
}
