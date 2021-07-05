N0 = 1;

%Gaussian RV 2°³ »ý¼º
RV1 = sqrt(N0) * randn(1000,1);
RV2 = sqrt(N0) * randn(1000,1);

figure
plot(RV1, RV2, '.');
