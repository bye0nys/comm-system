bRV = round(rand(1,1000));

%N0 = 1고정, Eb : -6 ~ 8dB로 만듦
N0 = 1;
i = 1;
%Eb/N0 = 0dB로 가정

for num = -6:1:8
    Eb(i) = 10.^(num/10);
    i = i + 1;
end

Energy = zeros(1,1000);

figure
for num = 1:1:15
    for x = 1:1:1000
        if bRV(1,x) == 0
            Energy(1,x) = -sqrt(Eb(num));
            plot(Energy,'.');
            grid on;
            hold on;
        else
            Energy(1,x) = sqrt(Eb(num));
            plot(Energy,'.');
            grid on;
            hold on;
        end
    end
end






