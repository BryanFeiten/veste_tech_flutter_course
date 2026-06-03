plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.growdev.veste_fcm_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // --- INÍCIO: EXIGÊNCIA DO FLUTTER LOCAL NOTIFICATIONS ---
        // Habilita o "Desugaring": Uma técnica do Android que permite que 
        // celulares mais antigos rodem recursos muito modernos do Java (como novas APIs de data e hora).
        // Sem isso, o pacote flutter_local_notifications quebra a compilação.
        isCoreLibraryDesugaringEnabled = true
        // --- FIM ---

        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.growdev.veste_fcm_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// --- INÍCIO: DEPENDÊNCIAS NATIVAS ---
// Dependência obrigatória para a mágica do "Desugaring" (configurado lá em cima) acontecer.
// Esse pacote oficial do Google é quem faz o trabalho pesado de traduzir
// o código moderno para rodar liso nos aparelhos mais velhos na hora do build.
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.3")
}
// --- FIM ---