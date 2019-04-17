#version 300 es


uniform mat4 u_Model;
uniform mat4 u_ModelInvTr;
uniform mat4 u_ViewProj;
uniform vec2 u_PlanePos; // Our location in the virtual world displayed by the plane

uniform sampler2D hightmap;

in vec4 vs_Pos;
in vec4 vs_Nor;
in vec4 vs_Col;
in vec2 vs_Uv;

out vec3 fs_Pos;
out vec4 fs_Nor;
out vec4 fs_Col;

out vec2 fs_Uv;



void main()
{
  fs_Pos = vs_Pos.xyz;
  fs_Uv = vs_Uv;
  float yval = 1.f*texture(hightmap,vs_Uv).x;
  vec4 modelposition = vec4(vs_Pos.x, yval, vs_Pos.z, 1.0);
  modelposition = u_Model * modelposition;
  gl_Position = u_ViewProj * modelposition;
}