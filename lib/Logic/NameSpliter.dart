class NameSpliter {
  late String fullName;
  late String firstName = '';
  late String middleName = '';
  late String lastName = '';

  NameSpliter({required this.fullName}) {
    var name = fullName.split(" ");

    if (name.length == 1) {
      firstName = name[0];
    } else if (name.length == 2) {
      firstName = name[0];
      lastName = name[1];
    } else if (name.length == 3) {
      firstName = name[0];
      middleName = name[1];
      lastName = name[2];
    }
  }

  getFirstName() {
    return firstName;
  }

  getSecondName() {
    return middleName;
  }

  getLastName() {
    return lastName;
  }
}
