
%1000,1�� 0�迭 �Ҵ� (Uniform RV)
RV = zeros(1000, 1);

%�յ�Ȯ������ 100���� ���� RV�迭�� ����, 1000�� ����
for num = 1:1:1000
    %�յ�Ȯ������ 100�� ����
    RV(num) = sum(rand(100,1));
end

%�յ�Ȯ������ ����ȭ
RVn = (RV-50) * sqrt(12/100);

%���(0)�� �л�(1) ���
%mean(RVn)
%var(RVn)

figure(1);
%Standard CDF ����
x = -4:0.008:4;
stdcdf = 0.5 * erfc(x / sqrt(2));
plot(x, 1 - stdcdf, '.');
hold on

normcdf = 0.5 * erfc(RVn / sqrt(2));
plot(RVn, 1 - normcdf, '.');

%Binomial RV ����
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
