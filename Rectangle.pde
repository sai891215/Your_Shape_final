class Rectangle {
  float x;
  float y;
  float width;
  float height;

  Rectangle(float x_, float y_, float w, float h) {
    x = x_;
    y = y_;
    width = w;
    height = h;
  }

  boolean contains(float px, float py) {
    return (px > x && px < x + width  && py > y && py < y + height);
  }
}
