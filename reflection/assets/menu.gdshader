shader_type canvas_item;

uniform float speed = 0.2;
uniform vec4 color1 : source_color = vec4(0.6, 0.1, 0.9, 1.0);
uniform vec4 color2 : source_color = vec4(0.1, 0.7, 1.0, 1.0);
uniform vec4 color3 : source_color = vec4(1.0, 0.5, 0.2, 1.0);
uniform vec4 color4 : source_color = vec4(0.2, 1.0, 0.5, 1.0);

void fragment() {
    vec2 uv = UV;
    float t = TIME * speed;

    // smooth wave factor
    float f = 0.5 + 0.5 * sin((uv.x) * 0.5 + t);

    // use f to pick position in palette
    vec4 col;
    if (f < 0.33) {
        col = mix(color1, color2, smoothstep(0.0, 0.33, f));
    } else if (f < 0.66) {
        col = mix(color2, color3, smoothstep(0.33, 0.66, f));
    } else {
        col = mix(color3, color4, smoothstep(0.66, 1.0, f));
    }

    COLOR = col;
}
