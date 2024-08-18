extension QuickExtention<T> on List<T> {
  List<T> get immutable => List.unmodifiable(this);
  List<T>? get nullOnEmpy => isEmpty ? null : immutable;
}
