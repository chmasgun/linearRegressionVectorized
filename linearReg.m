function linearReg(file,learnRate)
iters=6000;
d1=fopen(file,'r');
header=fscanf(d1, '%f %f \n',[1 2]);
length=header(1);
numVars=header(2);
theta=zeros((numVars+1),1);
data1=fscanf(d1,'%f',[(numVars+1) length]);
data1=data1';
y=data1(:,numVars+1);
x=data1(:,1:numVars);
x(:,2:numVars+1)=x;

x(:,1)=ones(length,1);


for m=1:1:iters
    temp=theta;
    theta=theta-(learnRate/length)*x'*((x*theta)-y);
    if temp==theta
        disp(m);
        break;
    end
end    
theta
if(numVars==1)
    scanplot(file,'r')
    hold on
    refline(theta(2),theta(1))
    
end
fclose(d1);
end
