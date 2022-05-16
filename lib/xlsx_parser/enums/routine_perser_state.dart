enum FilePerserState {
  ///initial state; on file perser start
  started,

  /// on file parser loading from assets
  loadingAsset,

  /// decoding excel file using decodeBytes
  decodingExcel,

  /// List of [ClassSchedule] generation after excel decoding
  classGeneration,

  ///
  failure,
}
