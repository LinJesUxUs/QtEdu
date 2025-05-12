#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    int qt_width;
    int qt_height;
} ubuf;
layout(binding = 1) uniform sampler2D source;

vec3 inverseHue(vec3 frag) {
    return vec3(frag.g+frag.b,frag.r+frag.b,frag.g+frag.r)/2;
}

vec3 inverseColor(vec3 frag) {
    return vec3(1.0)-frag;
}

vec3 contrast(vec3 frag, float val) {
    return ((frag-0.5)*val*10000)+0.5;
}

void main() {
    lowp vec3 color = texture(source, qt_TexCoord0).rgb;
    color = inverseHue(color);
    // color = inverseColor(texture(source, qt_TexCoord0).rgb);
    // color = contrast(color,u_time);

    fragColor = vec4(color.rgb, ubuf.qt_Opacity);
}
