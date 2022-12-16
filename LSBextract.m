close all;clear all;clc;
stego_image = imread('stego_image.bmp');
height = size(stego_image, 1); 
width = size(stego_image, 2); 
chars = input('How many characters your massage has: ');
message_length = chars * 8;

counter = 1;
for i = 1 : height 
    for j = 1 : width 
          
        
        if (counter <= message_length) 
              
            extracted_bits(counter, 1) = mod(double(stego_image(i, j)), 2); 
              
           
            counter = counter + 1; 
        end
    end
end


binValues = [ 128 64 32 16 8 4 2 1 ]; 
  
 
binMatrix = reshape(extracted_bits, 8, (message_length/8)); 
  
 
textString = char(binValues*binMatrix);  

disp(textString);