
close all;clear all;clc; 
  
cover_image = imread('yellowlily.jpg');  
cover_image=rgb2gray(cover_image);  
cover_image=imresize(cover_image, [512 512]); 
message =input ('Enter your message: ' , 's');           
 
len = length(message) * 8; 
 
ascii_value = uint8(message); 
  
bin_message = transpose(dec2bin(ascii_value, 8)); 
  

bin_message = bin_message(:); 
  

N = length(bin_message); 
  
 
bin_num_message=str2num(bin_message); 
  

output = cover_image; 
  
 
height = size(cover_image, 1); 
width = size(cover_image, 2); 
  
 
embed_counter = 1; 
  

for i = 1 : height 
    for j = 1 : width 
          
         
        if(embed_counter <= len) 
             pix= dec2bin(cover_image(i,j),8);
             if (bin_num_message(embed_counter)==0)
                 pix(8)='0';
             else
                 pix(8)='1';
             end
            output(i,j)=bin2dec(pix);

            embed_counter = embed_counter+1; 
        end
          
    end
end

subplot 121;imshow(cover_image);title('Original Image');
subplot 122; imshow(output);title('Stego image using LSB');
imwrite(output,'stego_image.bmp');
ps=psnr((output),(cover_image));
ss=ssim((output),(cover_image));