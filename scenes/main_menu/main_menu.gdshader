shader_type canvas_item;

uniform float speed = 0.2;

void fragment() {
    vec2 uv = UV;
    uv.y = fract(uv.y + TIME * speed); // boucle infinie, impossible de sortir
    COLOR = texture(TEXTURE, uv);
}
