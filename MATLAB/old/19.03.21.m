a = [1 2 3];
b = 1:1:10;
c = 1:2:11;
d = 2:1:11;

e = b.*d;
f = sum(e);
g = (b>=5);
k = (b>=5 & b<9);

t = -20 : 0.001 : 20;
Rec = (t>=-1/2 & t<=1/2);

figure(1);
plot(t, Rec);

freq = -10:0.01:10;
X = zeros(1, length(freq));

x = 0:0.001:1;
y = x.^2;
sum(y * 0.001);

for index = 1:1:length(X)
    X(index) = sum(Rec.*exp(-i*2*pi*freq(index).*t)*0.001);
end

figure(2);
plot(freq, X);