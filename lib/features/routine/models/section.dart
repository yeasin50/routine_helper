abstract class Section {
  String get name;
}

class PCA implements Section {
  @override
  String get name => "PC-A";
}

// ignore: camel_case_types
class T3_PCA implements Section {
  @override
  String get name => "T3_PC-A";
}

class T3_PCB implements Section {
  @override
  String get name => "T3_PC-B";
}

class T3_PCC implements Section {
  @override
  String get name => "T3_PC-C";
}

class PCB implements Section {
  @override
  String get name => "PC-B";
}

class PCC implements Section {
  @override
  String get name => "PC-C";
}

class PCOldSyll implements Section {
  @override
  String get name => "PC-(OLD SYLL)";
}
