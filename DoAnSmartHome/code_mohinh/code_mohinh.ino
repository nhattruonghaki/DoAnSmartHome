#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include<Servo.h>
#define SERVO_PIN 11

LiquidCrystal_I2C lcd(0x27, 16, 2);  

const int buttonPin = 0;
const int buttonReset = 1;

Servo gServo;
int value = 0;
int goc = 0;

const int LIGHT_SENSOR_PIN = A1; 
const int LED_PIN          = A2;  
const int ANALOG_THRESHOLD = 500;
int analogValue;

// Biến lưu trữ số lần bấm nút
int buttonPressCount = 0;
int buttonResetPressCount = 0;
//Biến lưu trữ mật khẩu
int passStt = 0;
int so1=0,so2=0,so3=0,so4=0;
int dem = 0;

// Biến lưu trữ trạng thái trước của nút nhấn
int previousButtonState = LOW;
int previousButtonResetState = LOW;  

int mode = 2;
int mode10 = 2;
int mode11 = 2;
int mode6 = 2;
int mode7 = 2;

bool isPress = true;
bool isPress8 = true;
bool isPress9 = true;
bool isPressA3 = true;
bool isPressA2 = true;
bool isPressA1 = true;
bool button8State = false;
bool button9State = false;
bool led1State = false;
bool led2State = false;
bool isPress4 = true;
bool isPress5 = true;

int modeA0 = 2;
int mode12 = 2;
int mode13 = 2;


void setup() {
  lcd.init();                
  lcd.backlight(); 

  pinMode(10,INPUT);
  gServo.attach(SERVO_PIN);
  pinMode(8,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(7,INPUT);
  pinMode(9,OUTPUT);
  pinMode(11,INPUT);
  pinMode(A1,INPUT);
  pinMode(A2,INPUT);
  pinMode(A3,INPUT);
  pinMode(A0,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(6, INPUT);
  pinMode(4, OUTPUT);
  pinMode(0, INPUT);
  pinMode(1, INPUT);
  

  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(buttonReset, INPUT_PULLUP); 
  pinMode(3,INPUT);
  pinMode(2,OUTPUT); 
             
  lcd.setCursor(1, 0);
  lcd.print("Nhap mat khau:");
 
}

void loop() {
  
// Đọc trạng thái hiện tại của nút nhấn

  int currentButtonState = digitalRead(buttonPin);
  int currentButtonResetState = digitalRead(buttonReset);
  if(passStt==0)
  {
    lcd.setCursor(0,0);
    lcd.print(buttonPressCount);
    lcd.setCursor(0,1);
    lcd.print("Pass Word: ");
  }
  //else giải quyết sáng đèn các kiểu
  else lcd.clear();
  
  // Kiểm tra xem nút nhấn có được nhấn xuống hay không
  if (currentButtonState == LOW && previousButtonState == HIGH) {
    // Tăng biến đếm số lần bấm nút
    buttonPressCount++;
    if(buttonPressCount>9){
      buttonPressCount=0;
    }
    lcd.setCursor(0,0);
    lcd.print(buttonPressCount);
  }
  if (currentButtonResetState == LOW && previousButtonResetState == HIGH) {
    buttonResetPressCount++;
    if(buttonResetPressCount==1) 
    {
      so1 = buttonPressCount;
      lcd.setCursor(11,1);
      lcd.print(so1);
    }
    if(buttonResetPressCount==2) 
    {
      so2 = buttonPressCount;
      lcd.setCursor(12,1);
      lcd.print(so2);
    }
    if(buttonResetPressCount==3) 
    {
      so3 = buttonPressCount;
      lcd.setCursor(13,1);
      lcd.print(so3);
    }
    if(buttonResetPressCount==4) 
    {
      so4 = buttonPressCount;
      lcd.setCursor(14,1);
      lcd.print(so4);
      //PassWord: 1234
      if(so1!=1||so2!=2||so3!=3||so4!=4)
      {
        lcd.clear();
        lcd.setCursor(0,0);
        lcd.print("Wrong PassWord!");
        passStt = 0;
        delay(1000);
        lcd.clear();
      }
      else{
        lcd.clear();
        lcd.setCursor(0,0);
        lcd.print("Pass!");
        delay(1000);
        passStt = 1;
      }
      buttonResetPressCount=0;
    }
    if(buttonResetPressCount==5) 
    {
      buttonResetPressCount=0;
      lcd.clear();
      delay(50);
    }
    //Đặt lại biến đếm số lần bấm nút
    buttonPressCount=0;

    lcd.setCursor(0,0);
    lcd.print(buttonPressCount);
  }
  
  // Lưu trạng thái hiện tại của nút nhấn để sử dụng trong lần lặp tiếp theo
  previousButtonState = currentButtonState;
  previousButtonResetState = currentButtonResetState;
    /////////////////////////////////////////////////////
  int btn = digitalRead(3);
  if(btn == 1){
     isPress = true; }
  else{ 
    if(isPress)
      { mode =(mode == 2?mode=1:mode+1);
    if(mode == 1)
      { 
        mode = 1; 
      } 
    if(mode == 2)
      { 
        mode = 2; 
      } 
      isPress = false;
     }
    }if(passStt==1){
     switch(mode)
       { 
          case 2: digitalWrite(2,1);
          break; 
          case 1: digitalWrite(2,0); 
          break; 
      }
    }
  ///////////////////////////////////
  int button3State = digitalRead(10);
  int button4State = digitalRead(11);

  if(button3State == 1){
    isPress8 = true;
  }
  else{
    if(isPress8){
      mode10 =(mode10 == 2?mode10 = 1:mode10 + 1);
      if(mode10 == 1){
        mode10 = 1;
      }
      if(mode10 == 2){
        mode10 = 2;
      }
      isPress8 = false;
    }
  }if(passStt==1){
      switch(mode10){
      case 2:
      digitalWrite(8,1);
      break;
      case 1:
      digitalWrite(8,0);
      break;
    }
  }
  ////////////////////////////////
  if(button4State == 1){
    isPress9 = true;
  }
  else{
    if(isPress9){
      mode11 =(mode11 == 2?mode11 = 1:mode11 + 1);
      if(mode11 == 1){
        mode11 = 1;
      }
      if(mode11 == 2){
        mode11 = 2;
      }
      isPress9 = false;
    }
  }if(passStt==1){
      switch(mode11){
      case 2:
      digitalWrite(9,1);
      break;
      case 1:
      digitalWrite(9,0);
      break;
    }
  }
/////////////////////////////////////////////
  int button5State = digitalRead(A3);
  int button6State = digitalRead(A2);
  int button7State = digitalRead(A1);

  if(button5State == 1){
    isPressA3 = true;
  }
  else{
    if(isPressA3){
      modeA0 =(modeA0 == 2?modeA0 = 1:modeA0 + 1);
      if(modeA0 == 1){
        modeA0 = 1;
      }
      if(modeA0 == 2){
        modeA0 = 2;
      }
      isPressA3 = false;
    }
  }if(passStt==1){
      switch(modeA0){
      case 2:
      digitalWrite(A0,1);
      break;
      case 1:
      digitalWrite(A0,0);
      break;
    }
  }
    //
    if(button6State == 1){
    isPressA2 = true;
  }
  else{
    if(isPressA2){
      mode12 =(mode12 == 2?mode12 = 1:mode12 + 1);
      if(mode12 == 1){
        mode12 = 1;
      }
      if(mode12 == 2){
        mode12 = 2;
      }
      isPressA2 = false;
    }
  }if(passStt==1){
      switch(mode12){
      case 2:
      digitalWrite(13,1);
      break;
      case 1:
      digitalWrite(13,0);
      break;
    }
  }
    //
    if(button7State == 1){
    isPressA1 = true;
  }
  else{
    if(isPressA1){
      mode13 =(mode13 == 2?mode13 = 1:mode13 + 1);
      if(mode13 == 1){
        mode13 = 1;
      }
      if(mode13 == 2){
        mode13 = 2;
      }
      isPressA1 = false;
    }
  }if(passStt==1){
      switch(mode13){
      case 2:
      digitalWrite(12,1);
      break;
      case 1:
      digitalWrite(12,0);
      break;
    }
  }
///////////////////////////////////////////////////////////
  int button8State = digitalRead(6);
  int button9State = digitalRead(7);

  if(button8State == 1){
    isPress4 = true;
  }
  else{
    if(isPress4){
      mode6 =(mode6 == 2?mode6 = 1:mode6 + 1);
      if(mode6 == 1){
        mode6 = 1;
      }
      if(mode6 == 2){
        mode6= 2;
      }
      isPress4 = false;
    }
  }if(passStt==1){
      switch(mode6){
      case 2:
      digitalWrite(4,1);
      break;
      case 1:
      digitalWrite(4,0);
      break;
    }
  }
  /////
  if(button9State == 1){
    isPress5 = true;
  }
  else{
    if(isPress5){
      mode7 =(mode7 == 2?mode7 = 1:mode7 + 1);
      if(mode7 == 1){
        mode7 = 1;
      }
      if(mode7 == 2){
        mode7= 2;
      }
      isPress5 = false;
    }
  }if(passStt==1){
      switch(mode7){
      case 2:
      digitalWrite(5,1);
      break;
      case 1:
      digitalWrite(5,0);
      break;
    }
  }
  //////////
  analogValue = analogRead(LIGHT_SENSOR_PIN); 

  if(analogValue < ANALOG_THRESHOLD)
    digitalWrite(LED_PIN, HIGH); 
  else
    digitalWrite(LED_PIN, LOW);


  if(passStt == 1){
  value = analogRead(A3);
  goc = map(value,0,512,0,90);
  gServo.write(goc);
  }
}