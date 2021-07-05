RV1 = zeros(100,1);
for num = 1:1:100
    RV1(num) = sum(rand(100,1));
end

RV2 = zeros(1000, 1);
for num = 1:1:1000
    RV2(num) = sum(rand(100,1));
end

RV1n = (RV1-50) * sqrt(12/100);
RV2n = (RV2-50) * sqrt(12/100);

mean(RV1n)
var(RV1n)
mean(RV2n)
var(RV2n)
RV1n[1]
RV1n[2]