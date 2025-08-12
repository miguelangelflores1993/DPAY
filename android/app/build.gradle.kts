plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.dpay"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.dpay"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "app"
    productFlavors {
        create("production") {
            dimension = "app"
            applicationIdSuffix = ""
            // versionCode = 3
            // versionName = "1.0.0"
            manifestPlaceholders["appName"] = "DPAY"
        }
        create("staging") {
            dimension = "app"
            applicationIdSuffix = ".stg"
            manifestPlaceholders["appName"] = "DPAY - Stag"
        }
        create("qa") {
            dimension = "app"
            applicationIdSuffix = ".qa"
            manifestPlaceholders["appName"] = "DPAY - QA"
        }
        create("development") {
            dimension = "app"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["appName"] = "DPAY - Dev"
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

