N0 = 1;

RV1 = sqrt(2*N0) * randn(1000,1);
RV2 = sqrt(2*N0) * randn(1000,1);

figure
plot(RV1,1000);
hold;
plot(1000,RV2);
