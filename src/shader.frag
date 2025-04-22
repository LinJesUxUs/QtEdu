#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    int qt_width;
    int qt_height;
};
layout(binding = 1) uniform sampler2D source;

const float triEdgeLen = 1.0/3.0;
const float triAngleRad = 180.0/3.0;

const int pointsCount = 3;
vec2 points[pointsCount] = {
    vec2(0.5, 0.5 + (cos(triAngle) * triEdgeLen) / 2.0),
    vec2(0.5 - triEdgeLen/2.0, 0.5 - (cos(triAngle) * triEdgeLen) / 2.0 ),
    vec2(0.5 + triEdgeLen/2.0, 0.5 - (cos(triAngle) * triEdgeLen) / 2.0 )
};

const float originEdge = triEdgeLen;
const float smoothEdge = originEdge/10;
const float edge0 = originEdge - smoothEdge;
const float edge1 = originEdge + smoothEdge;
const vec3 red = vec3(0.6,0.0,0.0);
const vec3 green = vec3(0.0,0.5,0.0);
const vec3 blue = vec3(0.0,0.0,0.7);
vec3 colors[pointsCount] = {
    vec3(0.6,0.0,0.0),  // Red
    vec3(0.0,0.5,0.0),  // Green
    vec3(0.0,0.0,0.7)   // Blue
};

void main()
{
    // vec4 p = texture(source, qt_TexCoord0);
    // fragColor = vec4(p.rgb,qt_Opacity);

    // float mx = min(qt_width,qt_height);
    // vec2 uv = qt_TexCoord0.xy / mx;

    vec3 color = vec3(0.1,0.2,0.3);

    for (int n = 0; n < pointsCount; ++n) {
        color = max(color, smoothstep(
                        edge1, edge0,
                        distance(qt_TexCoord0, points[n]) ) * colors[n] );
    }

    fragColor = vec4(color,qt_Opacity);
}
