/* Rosa Martinez, 3/12/25,  Modify an existing program to customize a grid-based structure, practicing use of object-oriented programming and 2D array structure and syntax. Document code with comments and create a 
simple HTML page to embed their Processing sketch and caption it, reinforcing both programming and web development skills. */
// Add a comment to each "//" that you see. 
int cols = 6;  // array grids
int rows = 5;  // array grids
Sprite[][] sprites; // 2D array
PImage gotham;

int numFrames = 4;  // frame animation ammount
PImage[] spriteFrames; // image import
int frameDelay = 20;  // Speed of animation (higher = slower)

void setup() {
  size(500, 450);
  loadSpriteFrames();  // loading image
  sprites = new Sprite[cols][rows];
  gotham=loadImage("gotham.jpg");

  // iterating through the arrays to fill with the sprite objects

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(100);
  image(gotham,0,0);
  
  // for loop iderating through the array once more and updating the value w/ the next sprite displaying the image
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// loading in the sprites
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("sprite_" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 75; // the size of the image
  float speedX = 0.75; // the speed of the image

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // adding in order for the image to move across the screen
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // 
    x += speedX;

    // if statement for the x and y variables so that the image can move
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
