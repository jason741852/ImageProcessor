I = imread('plant.jpg');
% figure;

axes1 = gca;

axes(axes1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);


I2=uint8(I1);

D1 = [0 2;3 1];
D2 = [0 8 2 10; 12 4 14 6; 3 11 1 9; 15 7 13 5];
D3 = [0 32 8 40 2 34 10 42;48 16 56 24 50 18 58 26;12 44 4 36 14 46 6 38;60 28 52 20 62 30 54 22;3 35 11 43 1 33 9 41;51 19 59 27 49 17 57 25;15 47 7 39 13 45 5 37;63 31 55 23 61 29 53 21]; 

O1 = zeros(size(I2));
O2 = zeros(size(I2));
O3 = zeros(size(I2));
I2 = I2./(256/5);

for x=1:size(I2,1)
    for y=1:size(I2,2)
        i=mod(x,size(D1,1));
        j=mod(y,size(D1,1));
        i=i+1;
        j=j+1;
        if I2(x,y) > D1(i,j)
            O1(x,y)=1;
        else
            O1(x,y)=0;
        end
    end
end

imshow(O1);

for x=1:size(I2,1)
    for y=1:size(I2,2)
        i=mod(x,size(D2,1));
        j=mod(y,size(D2,1));
        i=i+1;
        j=j+1;
        if I2(x,y) > D2(i,j)
            O2(x,y)=1;
        else
            O2(x,y)=0;
        end
    end
end

figure
imshow(O2);

for x=1:size(I2,1)
    for y=1:size(I2,2)
        i=mod(x,size(D3,1));
        j=mod(y,size(D3,1));
        i=i+1;
        j=j+1;
        if I2(x,y) > D3(i,j)
            O3(x,y)=1;
        else
            O3(x,y)=0;
        end
    end
end

figure
imshow(O3);

