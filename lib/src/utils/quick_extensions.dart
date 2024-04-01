extension QuickExtention<T> on List<T> {
  List<T> get mutable => List.unmodifiable(this);
  List<T>? get nullOnEmpy => isEmpty ? null : mutable;
}
