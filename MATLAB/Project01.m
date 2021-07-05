clear all;
close;

RV = zeros(1000, 1);

% �յ�Ȯ������ 100���� ���� RV�迭�� ����, 1000�� ����
for num = 1:1:1000
    %�յ�Ȯ������ 100�� ����
    RV(num) = sum(rand(100, 1));
end

% ���, �л� ���
mean(RV)
var(RV)

% �յ�Ȯ������ ����ȭ
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

% Binomial RV ����
bRV = zeros(1000, 1);
for num = 1:1:1000
    bRV(num) = sum(round(rand(100,1)));
end

mean(bRV)
var(bRV)
% Binomial RV ����ȭ
bRVn = (bRV - 50) * (1 / sqrt(25));

% Binomial CDF plot
figure(2);
bRVcdf = 0.5 * erfc(bRVn / sqrt(2));
plot(bRVn, 1- bRVcdf, '.', 'Markersize', 20);
xlim([-4 4]);
title("Binomial RV's CDF");
legend('Binomial CDF');