import QtQuick

Rectangle {
    color: "black"
    anchors.fill: parent
    Image {
        id: sourceImage
        height: Math.min(parent.width, parent.height)
        visible: false
        source: "qrc:/images/Linux_old.png"
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }
    ShaderEffect {
        anchors.fill: sourceImage
        property variant source: sourceImage
        fragmentShader: "qrc:/src/shader.frag.qsb"
        // opacity: 0.5
    }
}
