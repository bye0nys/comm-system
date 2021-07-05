clear all;
close;

%binary sequence N개 생성
N = 10^5;
bRV1 = round(rand(1, N));
bRV2 = round(rand(1, N));

%BPSK,QPSK gray coding
BPSK = (2 * bRV1) - 1;
BPSK1 = (2 * bRV1) - 1;
BPSK2 = (2 * bRV2) - 1;

%AWGN Noise 생성
N0 = 1;
AWGN1 = sqrt(N0 / 2) * randn(1, N);
AWGN2 = sqrt(N0 / 2) * randn(1, N);
AWGNs = (AWGN1 + j * AWGN2);

yB = zeros(1, N);
yQ1 = zeros(1, N);
yQ2 = zeros(1, N);

% dB범위 설정
Eb = [-6:8];
ErrorB = zeros(1,length(Eb));
ErrorQb = zeros(1,length(Eb));
ErrorQs = zeros(1,length(Eb));

for num = 1:length(Eb)
    %BPSK AWGN Noise 추가
    yB = BPSK + 10^-((Eb(num) / 20)) * AWGNs;
    
    %QPSK AWGN Noise 추가
    yQ1 = BPSK1 + 10^-((Eb(num) / 20)) * AWGNs;
    yQ2 = BPSK2 + 10^-((Eb(num) / 20)) * AWGNs;
    
    for cnum = 1:N
        
        % BPSK Error Count (BER = SER)
        if BPSK(cnum) == 1 && real(yB(cnum)) < 0
            ErrorB(num) = ErrorB(num) + 1;
        elseif BPSK(cnum) == -1 && real(yB(cnum)) > 0
            ErrorB(num) = ErrorB(num) + 1;
        end
      
        % QPSK Error Count
        if (BPSK1(cnum) == 1 && BPSK2(cnum) == 1) && (real(yQ1(cnum)) < 0 || real(yQ2(cnum)) < 0) == 1
            ErrorQb(num) = ErrorQb(num) + 1;
            if (real(yQ1(cnum)) < 0 && real(yQ2(cnum)) < 0) == 1
                ErrorQs(num) = ErrorQs(num) + 1;
            end
        elseif (BPSK1(cnum) == 1 && BPSK2(cnum) == -1) && (real(yQ1(cnum)) < 0 || real(yQ2(cnum)) > 0) == 1
            ErrorQb(num) = ErrorQb(num) + 1;
            if (real(yQ1(cnum)) < 0 && real(yQ2(cnum)) > 0) == 1
                ErrorQs(num) = ErrorQs(num) + 1;
            end
        elseif (BPSK1(cnum) == -1 && BPSK2(cnum) == 1) && (real(yQ1(cnum)) > 0 || real(yQ2(cnum)) < 0) == 1
            ErrorQb(num) = ErrorQb(num) + 1;
            if (real(yQ1(cnum)) > 0 && real(yQ2(cnum)) < 0) == 1
                ErrorQs(num) = ErrorQs(num) + 1;
            end
        elseif (BPSK1(cnum) == -1 && BPSK2(cnum) == -1) && (real(yQ1(cnum)) > 0 || real(yQ2(cnum)) > 0) == 1
            ErrorQb(num) = ErrorQb(num) + 1;
            if (real(yQ1(cnum)) > 0 && real(yQ2(cnum)) > 0) == 1
                ErrorQs(num) = ErrorQs(num) + 1;
            end
        end
    end
end

% 에러 개수의 확률적 표현
BTheoryBER = 0.5 * erfc(sqrt(10.^(Eb/10)));
BResultBER = ErrorB / N;
QResultBER = ErrorQb / N;
QResultSER = ErrorQs / (N*2);

figure(1);
semilogy(Eb, BTheoryBER, 'r*-');
hold on
semilogy(Eb, BResultBER, 'bs-');
axis([-6 8 10^-5 1]);
legend('BPSK Theoretical BER', 'BPSK Result BER');
xlabel('dB   (Eb/N0)');
ylabel('Probability');
title("Comparing BPSK's Theoretical and Result BER");
grid on;

figure(2);
semilogy(Eb, QResultBER, 'mv-');
hold on
semilogy(Eb, QResultSER, 'g*-');
axis([-6 8 10^-6 1]);
legend('QPSK Result BER', 'QPSK Result SER');
xlabel('dB   (Eb/N0)');
ylabel('Probability');
title("Comparing QPSK's BER and SER");
grid on;

figure(3);
semilogy(Eb, BResultBER, 'k^-');
hold on
semilogy(Eb, QResultSER, 'bo-');
axis([-6 8 10^-6 1]);
legend('BPSK Result SER', 'QPSK Result SER');
xlabel('dB   (Eb/N0)');
ylabel('Probability');
title("Comparing BPSK and QPSKs' SER");
grid on;

figure(4);
semilogy(Eb, BResultBER, 'k^-');
hold on
semilogy(Eb, QResultBER, 'bo-');
hold on
semilogy(Eb, QResultSER, 'm*-');
axis([-6 8 10^-5 1]);
legend('BPSK Result BER', 'QPSK Result BER', 'QPSK Result SER');
xlabel('dB   (Eb/N0)');
ylabel('Probability');
title("Comparing BPSK and QPSKs' BER");
grid on;
