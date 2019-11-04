function [ area, areaTotal] = localFitArea( channel1, countSec1, ePeak_Pos )

channel = channel1([ePeak_Pos-20:ePeak_Pos+20]);
countSec = countSec1([ePeak_Pos-20:ePeak_Pos+20]);

xData = channel;
yData = countSec;


ft = fittype( 'gauss1' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [0 min(channel) 0];
opts.StartPoint = [max(countSec) mean(channel)  (max(channel)-min(channel))/7];
opts.Upper = [max(countSec)+2*max(channel) Inf];

[fitresult, gof] = fit( xData, yData, ft, opts );

coefFit = coeffvalues(fitresult);

xFit_Reg = coefFit(2)-3*coefFit(3)/sqrt(2): 0.01:coefFit(2)+3*coefFit(3)/sqrt(2);

delta = 0.5;

j=1;
k=1;
for i= 20:length(channel1)
    if (channel1(i)>xFit_Reg(1) && channel1(i)<xFit_Reg(length(xFit_Reg)))
        
        countN(j) = countSec1(i);
        channelN(j) = channel1(i);
        yFit_Temp(j) = coefFit(1)*exp((-(channel1(i)-coefFit(2))^2)/(coefFit(3))^2);
        dif=countN(j) - yFit_Temp(j);
        if dif < delta
             yFit(k) = yFit_Temp(j);
             xFit(k) = channel1(i);
             k=k+1;
        end
        
        j=j+1;
    end
end

area = sum(yFit) - (max(xFit)-min(xFit))*(yFit(1)+yFit(length(yFit)))/2;
areaTotal = sqrt(sum(yFit));

end
