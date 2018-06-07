final int KURO = 1; 
final int SHIRO = -1;
final int AKI = 0;
final int SOTO = 255;
final int BANSIZE = 640;
final int CELLSIZE = BANSIZE / 8; //80
final int STONESIZE = round(CELLSIZE * 0.9); //72.0

int[][] ban;
int teban = KURO;

void setup()
{
//  size(BANSIZE, BANSIZE);
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
    line(0,i*CELLSIZE,BANSIZE,i*CELLSIZE); //draw lineX
    line(i*CELLSIZE,0,i*CELLSIZE,BANSIZE); //deaw lineY
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
        ellipse(round(CELLSIZE*(x-0.5)),round(CELLSIZE*(y-0.5)),STONESIZE,STONESIZE);
          break;
        case SHIRO:
        fill(255);
        ellipse(round(CELLSIZE*(x-0.5)),round(CELLSIZE*(y-0.5)),STONESIZE,STONESIZE);
          break;
      }
    }
  }
}

void draw()
{
  showBan(ban);
}
