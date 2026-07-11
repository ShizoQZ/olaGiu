float cx = 600;
float cy = 200;

float anguloActual = 0;
float anguloInicio = 0;
float colorActualValor = 0;     
float colorInicio = 0;
float mouseXInicio = 0;

boolean mousePresionado = false;
PImage OG;

void setup() {
  size(800, 400);
  OG = loadImage("39.jpg");
}

void draw() {
  background(0);
  
  pushMatrix();
  translate(cx, cy);

  if (mousePresionado) {
    float diferencia = mouseX - mouseXInicio;
    anguloActual = anguloInicio + radians(diferencia);
    colorActualValor = colorInicio + diferencia;
  }

  rotate(anguloActual);

  color colorCirculo = calcularColor(colorActualValor);

  float coso = 400;
  for (int i = 0; i < 12; i++) {
    cosito(coso, colorCirculo);
    coso *= 0.7;
  }

  popMatrix();

  image(OG, 0, 0, 400, 400);
}


color calcularColor(float valor) {
  float r = map(sin(valor * 0.01), -1, 1, 0, 255);
  float g = map(sin(valor * 0.01 + 2), -1, 1, 0, 255);
  float b = map(sin(valor * 0.01 + 4), -1, 1, 0, 255);

  color colorArcoiris = color(r, g, b);
  float mezcla = constrain(map(abs(valor), 0, 720, 0, 1), 0, 1);

  return lerpColor(color(255), colorArcoiris, mezcla);
}

void mousePressed() {
  mousePresionado = true;
  mouseXInicio = mouseX;
  anguloInicio = anguloActual;
  colorInicio = colorActualValor;
}

void mouseReleased() {
  mousePresionado = false;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    anguloActual = 0;
    colorActualValor = 0;
  }
}
