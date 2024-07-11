clc
clear
fid=fopen("E:\matlab beta\final project\input.txt");
data=fscanf(fid,'%d');
%to open the input file

%condition 1

start=[0;0;0;0;0;0;0;1];
data=[start;data];

%condition 2

for  i=9:2007
    if data(i+1)==0
    if data(i)==1
        data(i)=0;
    else data(i)=1;
    end
    end
end
%another way
% for  i=1:2008
% if data(i+1)==0
%     data(i)=data(i).^(1<<i)
% end
% end


%condition 3
counter = 0
for i=1:length(data)
    if( data(i) == 1)
        Counter = Counter + 1;
    else
        Counter = 0;
    end
      if( Counter == 5)
        data = [data(1:i); 0; data(i + 1 :end)];
        Counter = 0; 
    end

end


%condition 4
 counter=0;
 for i=9:length(data)
     counter=counter+1;
     if counter==32
         data=[data(1:i);0;0;0;data(i+1:end)];
             counter=0;
    end
 end

%condition 5
while true 
    if mod(length(data),32)~=0
        %data = [data;randi(1,1,2)-1];
        data= [data;0];
    else 
        break;
    end
end

im=fopen("E:\matlab beta\final project\output.txt",'w');
fprintf(im,'%d',data)
%to write the data in the output file



