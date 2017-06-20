QT += qml quick

android {
    QT += androidextras
    INCLUDEPATH += /opt/firebase_cpp_sdk/include
    equals(ANDROID_TARGET_ARCH, armeabi-v7a) {
        LIBS += -L/opt/firebase_cpp_sdk/libs/android/armeabi-v7a/c++
    }
    equals(ANDROID_TARGET_ARCH, x86)  {
        LIBS += -L/opt/firebase_cpp_sdk/libs/android/x86/c++
    }
    LIBS += -ladmob -lapp
}

CONFIG += c++11
TARGET = GSELLA
SOURCES += main.cpp \
    buttonlistener.cpp \
    configlistener.cpp \
    qenum.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    DISTFILES += \
        android/google-services.json \
        android/gradle.properties \
        android/local.properties \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat \
        android/src/com/g/sella/GSellaActivity.java \
        android/src/com/g/sella/Dialup.java
}

HEADERS += \
    buttonlistener.h \
    configlistener.h \
    qenum.h
