mixin UseCases<T, Params> {
  Future<T> call(Params params);
}

class NoParams {
  @override
  bool operator ==(Object other) {
    return other is NoParams;
  }

  @override
  // ignore: unnecessary_overrides
  int get hashCode => super.hashCode;
}
