RV1 = zeros(1000,1);
for num = 1:1:1000
    RV1(num) = sum(rand(100,1));
end

RV1n = (RV1-50) * sqrt(12/100);

mean(RV1n)
var(RV1n)