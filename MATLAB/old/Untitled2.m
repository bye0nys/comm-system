
%1000,1의 0배열 할당 (Uniform RV)
RV = zeros(1000, 1);

%균등확률변수 100개의 합을 RV배열에 저장, 1000개 생성
for num = 1:1:1000
    %균등확률변수 100개 생성
    RV(num) = sum(rand(100,1));
end

%균등확률변수 정규화
RVn = (RV-50) * sqrt(12/100);

%평균(0)과 분산(1) 계산
%mean(RVn)
%var(RVn)

figure(1);
%Standard CDF 생성
x = -4:0.008:4;
stdcdf = 0.5 * erfc(x / sqrt(2));
plot(x, 1 - stdcdf, '.');
hold on

normcdf = 0.5 * erfc(RVn / sqrt(2));
plot(RVn, 1 - normcdf, '.');

%Binomial RV 생성
BRV = zeros(1000, 1);
for num = 1:1:1000
    BRV(num) = rand();
    if (BRV(num) < 0.5)
        BRV(num) = 0;
    else
        BRV(num) = 1;
    end
end

figure(2)
plot(BRV, '.');
