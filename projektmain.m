[x, fs] = audioread('czapus.m4a'); %freestyle kolegi 
[x1,fs1] = audioread("testaudio.m4a"); %głosowka z dyktafonu
[x2,fs2] = audioread("20hztest.mp3"); %test dzwieku o niskiej czestotliwosci
[x3,fs3] = audioread("20khztest.mp3"); %test dziweku o wysokiej czestotliwosci

N = length(x); %długosc wektora x 
t = (0:N-1) / fs; %wektor czasu 

N1= length(x1);
t1 = (0:N1-1) / fs1;

N2= length(x2);
t2 = (0:N2-1) / fs2;
x2=x2(:,1); %bierzemy jeden kanał (dźwięk stereo)

N3= length(x3);
t3 = (0:N3-1) / fs3;
x3=x3(:,1);

S = fft(x);
Stest = S(1:N/2);
f = fs * (0:N/2-1) / N;
s = 2 * abs(Stest) / N; 

S1 = fft(x1);
S1test = S1(1:N1/2);
f1 = fs1 * (0:N1/2-1) / N1;
s1 = 2 * abs(S1test) / N1;

S2 = fft(x2);
S2test = S2(1:N2/2);
f2 = fs2 * (0:N2/2-1) / N2;
s2 = 2 * abs(S2test) / N2;

S3 = fft(x3);
S3test = S3(1:N3/2);
f3 = fs3 * (0:N3/2-1) / N3;
s3 = 2 * abs(S3test) / N3;
%wykresy dla dzwieku numer 1
figure
subplot(4,1,1);
plot(t, x, 'g'); %dziedzina czasu 
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio w domenie czasu');
subplot(4,1,2);
plot(f, s, 'b');  %dziedzina czestotliwosci 
xlabel('Częstotliwość (kHz)');
ylabel('Amplituda');
title('Sygnał audio w domenie częstotliwości');
subplot(4,1,3);
spectrogram(x, 1024, 512, 1024, fs, 'yaxis');   %spektogram 
title("Spektrogram sygnału");
xlabel("Czas (s)");
ylabel("Częstotliwość (kHz)");
subplot(4,1,4);
histogram(x); %histogram
title("histogram sygnału audio")


figure
subplot(4,1,1);
plot(t1, x1, 'g');
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio w domenie czasu');
subplot(4,1,2);
plot(f1, s1, 'b');
xlabel('Częstotliwość (kHz)');
ylabel('Amplituda');
title('Sygnał audio w domenie częstotliwości');
subplot(4,1,3);
spectrogram(x1, 1024, 512, 1024, fs1, 'yaxis');
title("Spektrogram sygnału");
xlabel("Czas (s)");
ylabel("Częstotliwość (kHz)");
subplot(4,1,4);
histogram(x1);
title("histogram sygnału audio")

figure
subplot(4,1,1);
plot(t2, x2, 'g');
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio w domenie czasu');
subplot(4,1,2);
plot(f2, s2, 'b');
xlabel('Częstotliwość (kHz)');
ylabel('Amplituda');
title('Sygnał audio w domenie częstotliwości');
subplot(4,1,3);
spectrogram(x2, 1024, 512, 1024, fs2, 'yaxis');
title("Spektrogram sygnału");
xlabel("Czas (s)");
ylabel("Częstotliwość (kHz)");
subplot(4,1,4);
histogram(x2);
title("histogram sygnału audio")

figure
subplot(4,1,1);
plot(t3, x3, 'g');
xlabel('Czas (s)');
ylabel('Amplituda');
title('Sygnał audio - dzwięk o częstotliwosci 20kHz w domenie czasu');
subplot(4,1,2);
plot(f3, s3, 'b');
xlabel('Częstotliwość (kHz)');
ylabel('Amplituda');
title('Sygnał audio - dżwięk o częstotliwości 20kHz w domenie częstotliwości');
subplot(4,1,3);
spectrogram(x3, 1024, 512, 1024, fs3, 'yaxis');
title("Spektrogram sygnału");
xlabel("Czas (s)");
ylabel("Częstotliwość (kHz)");
subplot(4,1,4);
histogram(x3);
title("Histogram sygnału audio")