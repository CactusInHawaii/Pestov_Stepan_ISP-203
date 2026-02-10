uses GraphABC;
procedure task1();
begin
  Circle(150,200,50);
  Circle(650,200,50);
  DrawPolygon([(200,200),(400,300),(600,200),(200,200),(400,100),(600,200)]);
  FloodFill(150,200,clred);
  FloodFill(650,200,clYellow);
  FloodFill(400,150,clBlue);
  FloodFill(400,250,clGreen);
end;

procedure task2();
begin
  DrawPolygon([(150,150),(250,400),(500,400),(600,150),(375,350)]);
  FillPolygon([(315,400),(435,400),(375,150)]);
  DrawPolygon([(315,400),(435,400),(375,150)]);
  Circle(150,150,25);
  FloodFill(150,150,clBlue);
  FloodFill(250,350,clBlue);
  
  Circle(375,150,25);
  FloodFill(375,150,clRed);
  FloodFill(375,300,clRed);
  
  Circle(600,150,25);
  FloodFill(600,150,clGreen);
  FloodFill(500,350,clGreen);
end;

procedure task3();
begin
  foreach var x in Range(50,290,30) do
  begin
    SetPenColor(rgb(random(256), random(256), random(256)));
    SetBrushColor(rgb(random(256), random(256), random(256)));
    Circle(x,100,10);
  end;
end;

procedure task4();
begin
    foreach var x in Range(10,200,10) do
  begin
    //SetPenColor(rgb(random(256), random(256), random(256)));
    //SetBrushColor(rgb(random(256), random(256), random(256)));
    Circle(200,200,x);
    Sleep(200)
  end;
end;

procedure task5();
begin
      foreach var x in Range(20,200,20) do
  begin
    var i:=Round(x/4);
    SetPenColor(rgb(random(256), random(256), random(256)));
    SetBrushColor(rgb(random(256), random(256), random(256)));
    Circle(x*2,x,i);
    Sleep(200)
  end;
end;

procedure task6();
begin
var N:=8; var x1:=50; var y1:=50; var x2:=100; var y2:=100;
  for var i:=1 to N do 
  begin
    
    for var q:=1 to N do 
    begin
      
      Rectangle(x1,y1,x2,y2);
      if (q+i) mod 2 <> 0 then FloodFill(x1+1,y1+1,clBlack);
      x1+=50; x2+=50; 
    end;
      
    y2+=50; y1+=50; x1:=50; x2:=100;
   end;
end;

procedure task7();
begin
  var x1:=50; var y1:=350; var x2:=100; var y2:=400;
  Brush.Color := clBlack;
while y1>=200 do
begin
  Rectangle(x1,y1,x2,y2);
  x1+=1;
  x2+=1;
  y1-=1; 
  y2-=1; 
  Sleep(10);
  ClearWindow(clWhite);
end;
while y1<=350 do
begin
  Rectangle(x1,y1,x2,y2);
  x1+=1;
  x2+=1;
  y1+=1; 
  y2+=1; 
  Sleep(10);
  if y1<=350 then ClearWindow(clWhite);
end;
end;
begin
  task1();
end.