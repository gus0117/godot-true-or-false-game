shader_type canvas_item;


uniform float amt : hint_range(0.0, 1.0);
uniform float edge_softness : hint_range(0.0, 1.0);
uniform vec4 color : source_color;
uniform vec2 screen_size;

void fragment() 
{
	vec2 uv = FRAGCOORD.xy / screen_size;
	float radius = amt * 0.5;
	vec2 center = vec2(0.5, 0.5); // Centro del círculo en coordenadas UV
	float d = distance(uv, center);
	float circle = smoothstep(d - edge_softness, d, radius - edge_softness);
	COLOR = vec4(color.rgb, circle);
}