clear all;
close;

% AWGN RV1, RV2 생성
figure(1)
for N0_1 = 1:2:10;
    RVc = sqrt(N0_1 / 2) * randn(1, 1000);
    RVs = sqrt(N0_1 / 2) * randn(1, 1000);
    RVs = RVc + j * RVs;
    xlim([-8 8]);
    ylim([-8 8]);
    plot(RVs, '.', 'Markersize', 4);
    hold on
end
title("AWGNs' through N0 range 1:2:9")
grid on

figure(2)
x = 0:0.1:40;
noisecdf = zeros(length(x), 1);
for N0_2 = 1:2:10;
    RV1 = sqrt(N0_2 / 2) * randn(1, 1000);
    RV2 = sqrt(N0_2/ 2) * randn(1, 1000);
    
    % in-phase와 quadrature의 avg noise energy 계산
    noise = (RV1.*RV1) + (RV2.*RV2);
    mean(noise)
    
     % noise energy의 CDF 생성
    for num = 1:1:length(x)
        noisecdf(num) = (sum(noise < x(num)) / 1000);
    end

    % noise energy의 CDF plot
    plot(x, noisecdf);
    hold on;
    
    % exp noise의 CDF plot
    expRV = 1 - exp((-1 / mean(noise)) * x);  
    plot(x, expRV, '.', 'Markersize', 2);
end
grid on
title("Comparing AWGN's CDF and exponential CDF");
