figure,
    op1=imgcomp('futurama.png',10)
    subplot(3,2,1);
    imshow(op1);
    title('Rank 10')
    op2=imgcomp('futurama.png',20)
    subplot(3,2,2);
    imshow(op2);
    title('Rank 20')
    op3=imgcomp('futurama.png',30)
    subplot(3,2,3);
    imshow(op3);
    title('Rank 30')
    op4=imgcomp('futurama.png',40)
    subplot(3,2,4);
    imshow(op4);
    title('Rank 40')
%Displays decent image with rank=40 which is properly visible  

figure,
    fut=imgcomp('futurama.png',50)
    subplot(3,2,1);
    imshow(fut);
    title('futurama')
    UB=imgcomp('UB.png',50)
    subplot(3,2,2);
    imshow(UB);
    title('UB')
    sq=imgcomp('square.png',30)
    subplot(3,2,3);
    imshow(sq);
    title('sq')
function im= imgcomp(name,rank)
I=imread(name);
red = double(I(:,:,1));
green = double(I(:,:,2));
blue = double(I(:,:,3));
      
[u,s,v] = svds(red,rank);
imred=uint8(u*s*v');
        
[u,s,v] = svds(green,rank);
imgreen =uint8(u*s*v');
        
[u,s,v] = svds(blue,rank);
imblue =uint8(u*s*v');
        
im(:,:,1) = imred;
im(:,:,2) = imgreen;
im(:,:,3) = imblue;
imsave     
        
end