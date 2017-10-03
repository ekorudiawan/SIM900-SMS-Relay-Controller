char data[100],a;
char match1 []= "123eri\n\r";
char match2 []= "123irawan\n\r";
int x,y;
boolean simpan;

void setup() {
    //Serial.begin(115200);
    Serial.begin(9600);
    pinMode(A0,1);
    pinMode(A1,1);
    Serial.println("AT+CMGDA = \"DEL ALL\"");
    
 
}

void loop(){
  
   if (Serial.available()>0) {
      a=Serial.read();
      if(a==(char)34)x++;
      
      if(x==6){
    
        if(a==match1[0]||a==match2[0]) simpan = true;
        if(simpan == true){
          data[y]=a;
        //  Serial.println((char)a);
          if(data[y]==match1[y]){
            y++;
            if(y==6){
            //  Serial.println("eks1 on");
              digitalWrite(A0,1);
              delay(3000);
            //  Serial.println("eks2 on");
              digitalWrite(A1,1);
              delay(3000);
              digitalWrite(A1,0);
            //  Serial.println("eks2 off");
              Serial.println("AT+CMGDA = \"DEL ALL\"");
              simpan = false;
              x=0;
              y=0;
            }
          }
          else if(data[y]==match2[y]){
            y++;
            if(y==9){
              //Serial.println("eks1 off");
              digitalWrite(A0,0);
              Serial.println("AT+CMGDA = \"DEL ALL\"");
              simpan = false;
              x=0;
              y=0;
            }
          }
        }
      }
    }
  
}

