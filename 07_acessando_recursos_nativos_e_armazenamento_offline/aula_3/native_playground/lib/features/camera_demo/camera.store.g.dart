// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CameraStore on _CameraStoreBase, Store {
  late final _$_imageFileAtom = Atom(
    name: '_CameraStoreBase._imageFile',
    context: context,
  );

  @override
  File? get _imageFile {
    _$_imageFileAtom.reportRead();
    return super._imageFile;
  }

  @override
  set _imageFile(File? value) {
    _$_imageFileAtom.reportWrite(value, super._imageFile, () {
      super._imageFile = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
    name: '_CameraStoreBase._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$pickImageAsyncAction = AsyncAction(
    '_CameraStoreBase.pickImage',
    context: context,
  );

  @override
  Future<void> pickImage(bool fromCamera) {
    return _$pickImageAsyncAction.run(() => super.pickImage(fromCamera));
  }

  late final _$_CameraStoreBaseActionController = ActionController(
    name: '_CameraStoreBase',
    context: context,
  );

  @override
  void clearImage() {
    final _$actionInfo = _$_CameraStoreBaseActionController.startAction(
      name: '_CameraStoreBase.clearImage',
    );
    try {
      return super.clearImage();
    } finally {
      _$_CameraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
