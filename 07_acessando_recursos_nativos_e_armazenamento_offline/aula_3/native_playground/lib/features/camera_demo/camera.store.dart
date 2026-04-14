import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:native_playground/features/camera_demo/adapters/camera_adapter.dart';

part 'camera.store.g.dart';

/// Store responsável pelo estado da tela de demonstração de câmera.
// ignore: library_private_types_in_public_api
class CameraStore = _CameraStoreBase with _$CameraStore;

abstract class _CameraStoreBase with Store {
  final ICameraAdapter _cameraAdapter;

  _CameraStoreBase(this._cameraAdapter);

  @observable
  File? _imageFile;

  @observable
  bool _isLoading = false;

  File? get imageFile => _imageFile;
  bool get isLoading => _isLoading;

  @action
  Future<void> pickImage(bool fromCamera) async {
    _isLoading = true;
    try {
      final File? image = fromCamera
          ? await _cameraAdapter.pickImageFromCamera()
          : await _cameraAdapter.pickImageFromGallery();

      _imageFile = image;
    } catch (e) {
      // Tratamento de erro simplificado para o playground
    } finally {
      _isLoading = false;
    }
  }

  @action
  void clearImage() {
    _imageFile = null;
  }
}
