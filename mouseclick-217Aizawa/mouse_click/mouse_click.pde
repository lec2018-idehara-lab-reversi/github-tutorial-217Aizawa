final int KURO = 1;
final int SHIRO = -1;
final int AKI = 0;
final int SOTO = 255;
final int BANSIZE = 640;
final int CELLSIZE = BANSIZE / 8;
final int STONESIZE = round(CELLSIZE * 0.9);
 
final int HITO = 1;
final int COMP = 2;
  
int[][] ban;
int teban;
int sente;
int gote;
int passCount;
int moveCount;

 
void setup()
{
  teban = KURO;
 
  sente = COMP;
  gote = HITO;
 
  passCount = 0;
  moveCount = 0;
 
  size(640, 640);
  ban = new int[10][10];
  for(int y=0; y<10; y++)
  {
    for(int x=0; x<10; x++)
    {
      ban[x][y] = AKI;
      if( x==0 || x==9 || y==0 || y==9 )
      {
        ban[x][y] = SOTO;
      }
      else
      {
        ban[x][y] = AKI;
      }
    }
  }
  ban[4][4] = SHIRO;
  ban[5][5] = SHIRO;
  ban[4][5] = KURO;
  ban[5][4] = KURO;
}
 
void showBan(int[][] b)
{
  background(0,96,0);
  for(int i=0; i<9; i++)
  {
    line(0,i*CELLSIZE,BANSIZE,i*CELLSIZE);
    line(i*CELLSIZE,0,i*CELLSIZE,BANSIZE);
  }
 
  for(int y=1; y<=8; y++)
  {
    for(int x=1; x<=8; x++)
    {
      switch(b[x][y])
      {
        case SOTO:
          break;
        case AKI:
          break;
        case KURO:
          fill(0);
          ellipse( round((x-0.5)*CELLSIZE), round((y-0.5)*CELLSIZE), STONESIZE, STONESIZE );
          break;
        case SHIRO:
          fill(255);
          ellipse( round((x-0.5)*CELLSIZE), round((y-0.5)*CELLSIZE), STONESIZE, STONESIZE );
          break;
      }
    }
  }
}
 
void draw()
{
  showBan(ban);
}
  
void mouseClicked()
{
  // mouseX, mouseY are in Screen Coordinate (0-640)
  // convert them to Logical Coordinate (1-8)
  println("(" + mouseX + "," + mouseY + ")");
  int gx = 4;
  int gy = 6;

  ban[gx][gy] = teban;
  // update teban to the next color 
}
