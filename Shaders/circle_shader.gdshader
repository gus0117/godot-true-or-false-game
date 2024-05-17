shader_type canvas_item;

uniform vec4 circle_color : source_color; // Color del círculo
uniform float circle_radius : hint_range(0.0, 1.0); // Radio del círculo (0 a 1)
uniform float edge_smoothness : hint_range(0.0, 0.1); // Suavidad del borde del círculo
uniform vec2 screen_size; // Tamaño de la pantalla

void fragment() {
    vec2 uv = FRAGCOORD.xy / screen_size; // Coordenadas UV normalizadas
    vec2 center = vec2(0.5, 0.5); // Centro del círculo en coordenadas UV

    // Calcular la distancia desde el centro
    float dist = distance(uv, center);

    // Interpolación suave para el borde del círculo
    float edge = smoothstep(circle_radius, circle_radius - edge_smoothness, dist);

    // Definir el color del fragmento
    COLOR = mix(circle_color, vec4(0.0, 0.0, 0.0, 0.0), edge);
}