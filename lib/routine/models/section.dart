abstract class Section {
  String get name;
}

class PCA implements Section {
  @override
  String get name => "PC-A";
}

class PCB implements Section {
  @override
  String get name => "PC-B";
}

class PCC implements Section {
  @override
  String get name => "PC-B";
}

class PCOldSyll implements Section {
  @override
  String get name => "PC-(OLD SYLL)";
}
