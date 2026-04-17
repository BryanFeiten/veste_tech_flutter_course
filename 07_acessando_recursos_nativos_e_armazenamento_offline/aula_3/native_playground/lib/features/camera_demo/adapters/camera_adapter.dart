import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// Contrato para o Adapter de Câmera.
abstract class ICameraAdapter {
  Future<File?> pickImageFromCamera();
  Future<File?> pickImageFromGallery();
}

/// Implementação do Adapter responsável pela comunicação direta com o pacote image_picker.
class CameraAdapter implements ICameraAdapter {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        requestFullMetadata: false,
      );
      return photo != null ? File(photo.path) : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );
      return photo != null ? File(photo.path) : null;
    } catch (e) {
      return null;
    }
  }
}
