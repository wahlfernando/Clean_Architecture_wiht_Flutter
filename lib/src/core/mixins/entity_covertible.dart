
mixin EntityConvertible<I, O> {
  O toEntity();
  I frontEntity(O modelo) => throw UnimplementedError();
}