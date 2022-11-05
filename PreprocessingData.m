T = readtable('/Users/armelnenejr/Downloads/CW_dataset (1).csv','TreatAsEmpty',{'.','NA'});
disp(T)

constant_value = '0';

PoolQc = fillmissing(T.PoolQC,'constant',constant_value); %%clean nan values on poolqc
T.PoolQC = PoolQc;

Fence = fillmissing(T.Fence,'constant',constant_value); %%clean nan values on Fence
T.Fence = Fence;

%% Changes the rating requirement to numerical data
Rating = {'Ex', 'Gd', 'TA', 'Fa', 'Po','NaN'};
RatingNumber = [5,4,3,2,1,0];

%% BsmtQual
[wasfound, idx] = ismember(T.BsmtQual, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.BsmtQual = RatingNum;
%% BsmtCond
[wasfound, idx] = ismember(T.BsmtCond, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.BsmtCond = RatingNum;
%% HeatingQC
[wasfound, idx] = ismember(T.HeatingQC, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.HeatingQC = RatingNum;
%% KitchenQual
[wasfound, idx] = ismember(T.KitchenQual, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.KitchenQual = RatingNum;
%% FireplaceQu
[wasfound, idx] = ismember(T.FireplaceQu, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.FireplaceQu = RatingNum;
%% GarageQual
[wasfound, idx] = ismember(T.GarageQual, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.GarageQual = RatingNum;
%% GarageCond
[wasfound, idx] = ismember(T.GarageCond, Rating);
RatingNum = nan(length(idx), 1);
RatingNum(wasfound) = RatingNumber(idx(wasfound));
T.RatingNumber = RatingNum;
T.GarageCond = RatingNum;
%%
T.RatingNumber = [];

FireplaceQu = fillmissing(T.FireplaceQu,'constant',0); %%different data type so uses 0
T.FireplaceQu = FireplaceQu; 
%%
NewTable = T;


writetable(NewTable,'/Users/armelnenejr/Downloads/processandclean.csv','Delimiter',',','QuoteStrings',true);
type '/Users/armelnenejr/Downloads/processandclean.csv' ;


scatter(T.OverallQual,T.OverallCond,'filled')



