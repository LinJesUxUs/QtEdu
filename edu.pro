QT += quick qml gui
CONFIG += c++17

BINDIR = $$PWD/bin
BUILDDIR = $${BINDIR}/build/$$TARGET
DESTDIR = $${BINDIR}
OBJECTS_DIR = $${BUILDDIR}
MOC_DIR = $${BUILDDIR}
RCC_DIR = $${BUILDDIR}
UI_DIR = $${BUILDDIR}

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060204    # disables all the APIs deprecated before Qt 6.2.4

branch_name = $$system("git branch --show-current")
TARGET = $$branch_name

SOURCES += src/main.cpp

# HEADERS +=

system([ ! -f src/shader.frag.qsb ] || [ src/shader.frag -nt src/shader.frag.qsb ]) {
    system( 'qsb --glsl "100 es,120,150" --hlsl 50 --msl 12 -o src/shader.frag.qsb src/shader.frag' )
}

# images/Linux.jpg \
# images/Linux.png \
# images/MacOS.jpg \
# images/MacOS.png \
# images/OS2.jpg \
# images/OS2.png \
# images/Windows.jpg \
# images/Windows.png \
# images/MacOS_old.png \
# images/OS2_old.png \
# images/Windows_old.png \
resources.files += \
    images/Linux_old.png \
    src/main.qml \
    src/shader.frag \
    src/shader.frag.qsb

resources.prefix = /

RESOURCES = resources
CONFIG += resources_big

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
