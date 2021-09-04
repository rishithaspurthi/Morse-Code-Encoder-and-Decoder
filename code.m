text=input('enter text: ');
morse={'.---- ','..--- ','...-- ','....- ','..... ','-.... ','--... ','---.. ','----. ','----- ','.- ','-... ','-.-. ','-.. ','. ','..- . ','--. ','.... ','.. ','.--- ','-.- ','.-.. ','-- ','-. ','--- ','.--. ','--.- ','.-. ','... ','- ','..- ','...- ','.-- ','-..- ','-.-- ','--.. ','---- ','---. ',' ','.- ','-... ','-.-. ','-.. ','. ','..-. ','--. ','.... ','.. ','.--- ','-.- ','.-.. ','-- ','- . ','--- ','.--. ','--.- ','.-. ','... ','- ','..- ','...- ','.-- ','-..- ','-.-- ','--.. '};
numbers_and_letters={'1','2','3','4','5','6','7','8','9','0','a','b ','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r',' s','t','u','v','w','x','y','z','?','.',' ','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',' Q','R','S','T','U','V','W','X','Y','Z'};
morsecode=[];
for i=1:length(text)
[~ , Morsecode] = ismember(text(i), numbers_and_letters);
morsecode=[morsecode,morse(Morsecode)];
fprintf('%s',morse{Morsecode}); end
%sound
morsecode=strjoin(morsecode);
 
dot=count(morsecode,'.'); dash=count(morsecode,'-'); space=count(morsecode,' '); letterspace=count(morsecode,' ');
dot_duration=0.2; t_dot=0:0.001:dot_duration; t_dash=0:0.001:3*dot_duration; t_code_space=0:0.001:dot_duration; t_letter_space=0:0.001:3*dot_duration; t_word_space=0:0.001:7*dot_duration; y_dot=cos(2*pi*700*t_dot); y_dash=cos(2*pi*700*t_dash); y_code_space=0*t_code_space; y_letter_space=0*t_letter_space; y_word_space=0*t_word_space; signal=[];
for t=(1:length(morsecode)) if morsecode(t)=='.'
signal=[signal,y_dot,y_code_space]; elseif morsecode(t)=='-'
signal=[signal,y_dash,y_code_space]; elseif morsecode(t)==' '
signal=[signal,y_letter_space,y_code_space];
end end
%sound(signal,(1/0.0003),8);
%signal1= signal + 0.5*randn(size(signal));
n = length(signal);
signal1= signal + pinknoise(n); %sound(signal1,(1/0.0003),8);
subplot(2,1,1)
plot(signal)
subplot(2,1,2)
plot(signal1)
%audiowrite('corrupt_morse.wav', signal1, 3000)

[y, Fs]= audioread('corrupt_morse.wav'); t = (0:length(y)-1)/Fs;
figure
plot(t,y)
%title('gaussian noise') %title('random noise')
title('pink noise')
fft_values = fft(y);
mean_value = mean(abs(fft_values));
threshold = 3*mean_value; fft_values(abs(fft_values) < threshold) = 0; filtered_samples = ifft(fft_values);
figure
plot(filtered_samples)
%imwrite(getframe(gcf).cdata, 'filteredsig3.png') %imshow('filteredsig3.png') %sound(filtered_samples,(1/0.0003),8); x=input('enter morse code');
morsecode = {'.-';'-...';'-.-.';'-..';'.';'..-.';'--
.';'....';'..';'.---'; ...
'-.-';'.-..';'--';'-.';'---';'.--.';'--.-';'.-.'; ... '...';'-';'..-';'...-';'.--';'-..-';'-.--';'--..'; ... '.----';'..---';'...--';'....-';'.....';'-....'; ...
'--...';'---..'; '----.';'-----';'_'}; text = ['A':'Z', '1':'9', '0'];
[~, index] = ismember(x, morsecode); Out = text(index)
