clear all;
close;

RV = zeros(1000, 1);

% 균등확률변수 100개의 합을 RV배열에 저장, 1000개 생성
for num = 1:1:1000
    %균등확률변수 100개 생성
    RV(num) = sum(rand(100, 1));
end

% 평균, 분산 계산
mean(RV)
var(RV)

% 균등확률변수 정규화
RVn = (RV - 50) * sqrt(12 / 100);

% Standard CDF plot
figure(1);
x = -4:0.008:4;
stdcdf = 0.5 * erfc(x / sqrt(2));
plot(x, 1 - stdcdf, 'b.');
hold on

% Uniform CDF plot
normcdf = 0.5 * erfc(RVn / sqrt(2));
plot(RVn, 1 - normcdf, 'r.');
title("Comparing Uniform RV's CDF and Standard Gaussian RV's CDF");
legend('Standard CDF', 'Uniform CDF');

% Binomial RV 생성
bRV = zeros(1000, 1);
for num = 1:1:1000
    bRV(num) = sum(round(rand(100,1)));
end

mean(bRV)
var(bRV)
% Binomial RV 정규화
bRVn = (bRV - 50) * (1 / sqrt(25));

% Binomial CDF plot
figure(2);
bRVcdf = 0.5 * erfc(bRVn / sqrt(2));
plot(bRVn, 1- bRVcdf, '.', 'Markersize', 20);
xlim([-4 4]);
title("Binomial RV's CDF");
legend('Binomial CDF');