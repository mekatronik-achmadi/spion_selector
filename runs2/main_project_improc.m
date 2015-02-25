close all
clear
clc

vtry=0;

while(vtry==0)
  close all
  clear
  clc

  %system("sudo chmod 777 /dev/ttyUSB0");
  %system("stty -F /dev/ttyUSB0 cs8 38400 -cstopb -parenb ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok");
  
  %system("echo \"untake\\n\" > /dev/ttyUSB0");
  %pause(1);
  %system("echo \"ungrip\\n\" > /dev/ttyUSB0");
  
  vtake=0;
  
  while(vtake==1)
    vgrip=0;
    
    disp("select menu ")
    disp("1. Grip ")
    disp("2. Ungrip")
    disp("3. Next Step")
    
    vgrip=input("choose your input= ")
    
    if(vgrip==1)
	%system("echo \"grip\\n\" > /dev/ttyUSB0");
	disp("gripped")
    elseif(vgrip==2)
	%system("echo \"ungrip\\n\" > /dev/ttyUSB0");
	disp("ungripped")
    elseif(vgrip==3)
	vtake=1;
	disp("processing...")
    end
  
  end
  
  %system("echo \"take\\n\" > /dev/ttyUSB0");
  pause(5);
  
  tic

  %% Read Image
  info = 1;	% 1 with info - 0 without info
  for i=1:5
    system('./image_cap');
    pause(1);
  end
  image = imread('input.png');

  %% Image segmentation with thresholding
  % Threshold ranges from 0 to 255
  Qth = 80;
  gray_image = rgb2gray(image);
  biner_image = gray_image > Qth;

  if info == 1
    addinfo(image,gray_image,biner_image)
  end

  %% Taking group of piksel ranged from AL to AU
  AL = 10;
  AU = 1000;
  Xc = bwareaopen(biner_image,AL);
  IXc = ~bwareaopen(Xc,AU);
  Xc_new = Xc& IXc;

  if info == 1
    addinfo(image,gray_image,biner_image,Xc_new)
  end

  %% Detecting Circle in the image
  % threshold from 0 (not circle) to 1 (perfect circle)
  threshold = 0.9;
  L_new = bwfill(Xc_new,'holes');
  % xc (row) & yc (coloum)
  [xc yc] = circle_detection(L_new,threshold);

  if info == 1
    addinfo(image,gray_image,biner_image,Xc_new)
    hold on
    plot(xc,yc+size(image,1),'r','markersize',5)
  end

  %% Just taking lines
  L = bwlabel(L_new,8);
  L_max = max(max(L));
  L_save = zeros(L_max,1);
  ij = 1;
  Length_min = 25;
  rho_piksel = 3;
  for i = 1:L_max
    [xi yi] = find(L==i);    
    Rs = sqrt((max(xi) - min(xi)).^2 + (max(yi) - min(yi)).^2);
    % sum(sum(L==i))/Rs
    if Rs > Length_min && sum(sum(L==i))/Rs < rho_piksel
    L_save(ij) = i;
    ij = ij + 1;
    end
  end

  L_save = L_save(1:ij-1);
  L_new = logical(zeros(size(L)));
  for i = 1:length(L_save)
    L_new = L_new | L==L_save(i);
  end
  clear L

  if info == 1
    addinfo(image,gray_image,biner_image,Xc_new,L_new)
    hold on
    plot(xc+size(image,2),yc+size(image,1),'r','markersize',5)
  end

  %% Calculation of image distortion
  L = bwlabel(L_new,8);
  Distorsi = zeros(max(max(L)),1);
  xy = zeros(max(max(L)),4);
  dxy = zeros(max(max(L)),2);
  count = 1;
  for i = 1:max(max(L))
    [row col] = find(L==i);
    radius = sqrt((row-yc).^2 + (col-xc).^2);
    id = find(radius == max(radius));    
    xy(i,:) = [xc col(id(1)) yc row(id(1))];
    grad = (yc-row(id))/(xc-col(id));
    grad = grad(1);
    constanta = yc - grad*xc;
    Distance = abs((row - grad*col - constanta)/sqrt(1+grad^2));
    id_d = Distance == max(Distance);        
    id_d = find(id_d==1);  
    if size(id_d,1) ~= 0
      dxy(count,1:2) = [col(id_d(1)) row(id_d(1))];
      Distorsi(count) = max(Distance)*100/max(radius);
      count = count + 1;
    end    
  end
  Distorsi = Distorsi(1:count-1);
  dxy = dxy(1:count-1,:);

  if info == 1
    addinfo(image,gray_image,biner_image,Xc_new,L_new,L_new)
    hold on
    plot(xc+size(image,2),yc+size(image,1),'r','markersize',5)
    for i = 1:size(xy,1)
	plot(xy(i,1:2)+2*size(image,2),xy(i,3:4)+size(image,1),'g')
    end
  end

  %% Show Image
  figure
  imshow(image)
  hold on
  plot(dxy(:,1),dxy(:,2),'r.')
  for i = 1:size(xy,1)
    plot(xy(i,1:2),xy(i,3:4),'g')
  end

  %% Show Distortion Factor
  text(35*1,35*1,'Distortion Factor', ...
    'FontSize',18,'Color',[0 100 255]/255)
  text(35*1,(35*1)+25,num2str(max(Distorsi)), ...
    'FontSize',18,'Color',[0 100 255]/255)

  vgood=0
  
  if max(Distorsi) < 7
    text(35*1,35*1+50,'Sesuai Standar', ...
      'FontSize',18,'Color',[255 0 0]/255)
    vgood=1; 
  else
    text(35*1,35*1+50,'Tidak Sesuai Standar', ...
      'FontSize',18,'Color',[255 0 0]/255)
    vgood=0;  
  end

  toc
  
  if(vgood==1)
    %system("echo \"ungrip\\n\" > /dev/ttyUSB0");
  elseif(vgood==0)
    %system("echo \"untake\\n\" > /dev/ttyUSB0");
    pause(1);
    %system("echo \"ungrip\\n\" > /dev/ttyUSB0");
  end
  
  srl_close(s0);
  
  disp("Run again?")
  disp("0. Yes")
  disp("1. No")
  vtry= input("choose your input= ")

end
