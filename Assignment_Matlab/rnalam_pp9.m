function [val] = rnalam_pp9(x,f)

a = min(x); %assigned a as min of x
b = max(x); %assigned b as max of x

total_area = 0; %assigned val to 0
i = 1;   %assigned i to 1
n = length(x); %made length of x to n


while i<=n-1
    h = f(i+1)+f(i); %arrays are used to find value at that perticualr location 
    n1 = x(i+1)-x(i); %value in perticular array stored in n1
    total_area = total_area+(h*n1);% area of trepizioid is identified.
    i = i+1;
end
val = (0.5)*total_area;%the obtained total value is assigned to val by halfing it.
end
