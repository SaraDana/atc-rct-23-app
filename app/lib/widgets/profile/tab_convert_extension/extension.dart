extension TabConvertIntoIndex on String {
  convertTabIdToIndex(tabCount) {
    if (this == "misSemanas") {
      if (tabCount == 3)
        return 0;
      else
        return 0;
    }
    if (this == "enProgreso") {
      if (tabCount == 3)
        return 1;
      else
        return 0;
    }
    if (this == "completado") {
      if (tabCount == 3)
        return 2;
      else
        return 1;
    } else
      return 0;
  }
}

extension TabIndexConvertToSectionName on int {
  convertTabIndexToSectionName(tabCount) {
    if (this == 0) {
      if (tabCount == 3)
        return "my_weeks";
      else
        return "started";
    }
    if (this == 1) {
      if (tabCount == 3)
        return "started";
      else
        return "completed";
    }
    if (this == 2) {
      if (tabCount == 3)
        return "completed";
      else
        return "";
    } else
      return "my_weeks";
  }
}
