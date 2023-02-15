int x_coord,y_coord;
bool xb[4];
bool yb[4];

void setup()
{
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  for(int i=2; i<12; i++){
    pinMode(i, OUTPUT);
    if(i==5)
      i=8;
  };
}

void loop()
{
  x_coord= analogRead(A0);
  y_coord= analogRead(A1);
  convert(x_coord,xb);
  convert(y_coord,yb);
  produce(xb,2);
  produce(yb,8);
  delay(100);
}

void convert(int num, bool conres[4]){
  conres[0]= num/512;
  conres[1]= (num%512)/256;
  conres[2]= (num%256)/128;
  conres[3]= (num%128)/64;
}

void produce(bool arr[4], int pin){
  for(int i=0; i<4; i++){
    digitalWrite(pin+i, arr[3-i]);
  };
}
