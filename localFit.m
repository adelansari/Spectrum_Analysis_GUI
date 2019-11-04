function [ amp, mu, sig, fwhm, res, area, areaTotal] = localFit( energy1, countSec1, ePeak_Pos )

energy = energy1([ePeak_Pos-20:ePeak_Pos+20]);
countSec = countSec1([ePeak_Pos-20:ePeak_Pos+20]);

xData = energy;
yData = countSec;


% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [0 min(energy) 0];
opts.StartPoint = [max(countSec) mean(energy)  (max(energy)-min(energy))/7];
opts.Upper = [max(countSec)+2*max(energy) Inf];

[fitresult, gof] = fit( xData, yData, ft, opts );

coefFit = coeffvalues(fitresult);

% The area of gaussian fir curve (from -3sig to 3sig)

xFit_Reg = coefFit(2)-3*coefFit(3)/sqrt(2): 0.01:coefFit(2)+3*coefFit(3)/sqrt(2);

% Fit coeff. values
amp = coefFit(1);
mu = coefFit(2);
sig = coefFit(3)/sqrt(2);
fwhm = 2.355*sig;
res = fwhm/mu;

end
