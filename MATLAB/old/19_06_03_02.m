N0 = 1;

%Gaussian RV 2�� ����
RV1 = sqrt(N0) * randn(1000,1);
RV2 = sqrt(N0) * randn(1000,1);

figure
plot(RV1, RV2, '.');
