QT += quick qml gui

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
#DESTDIR = bin

branch_name = $$system("git branch --show-current")
TARGET = $$branch_name

VPATH += ./src
SOURCES += main.cpp \

HEADERS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# Checks for shader compiling needs. Then compile
system([ src/shader.frag -nt src/shader.frag.qsb ]) {
    system(qsb -b --glsl 330 -o src/shader.frag.qsb src/shader.frag)
}

#DISTFILES += \
resources.files += \
    images/Linux.jpg \
    images/Linux.png \
    images/MacOS.jpg \
    images/MacOS.png \
    images/OS2.jpg \
    images/OS2.png \
    images/Windows.jpg \
    images/Linux_old.png \
    images/Windows.png \
    images/MacOS_old.png \
    images/OS2_old.png \
    images/Windows_old.png \
    src/main.qml \
    src/shader.frag \
    src/shader.frag.qsb
resources.prefix = /

RESOURCES = resources
CONFIG += resources_big
