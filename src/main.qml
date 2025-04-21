import QtQuick

Rectangle {
    color: "black"
    width: sourceImage.width
    height: sourceImage.height
    Image {
        id: sourceImage
        width: parent.width
        height: parent.height
        visible: false
        source: "qrc:/images/Linux_old.png"
    }
    ShaderEffect {
        width: sourceImage.width
        height: sourceImage.height
        property variant source: sourceImage
        fragmentShader: "qrc:/src/shader.frag.qsb"
    }
}
