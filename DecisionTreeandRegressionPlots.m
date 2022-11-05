
for loops = 1:6
    processeddata = readtable('/Users/armelnenejr/Downloads/processandcleannew.csv');
    processeddata(1,:)= []; % Take all the values from 1: onwards
    randomised = ceil(rand(1102,1) * (1102)); % Rounds each element of in the array to the nearest integer greater than or equal to that element.

    validationratio = 0.35; %Training data versus validation
    validationsetsize = 386;
    validationindices = randomised(1: validationsetsize); 

    traineddata = randomised(validationsetsize:end);
    trainprocesseddata = processeddata(traineddata, 1:end);
    validationprocesseddata = processeddata(validationindices, 1:end);


    validationprocesseddatapercentage = 0.35;
    for innerloop = 1:height(trainprocesseddata)

        x = trainprocesseddata(1:innerloop,1:13);
        y = trainprocesseddata.SalePrice(1:innerloop);
        n = size(x);
        
        Psi = [ones(n(1,1),1), table2array(x)];
        thetahat = pinv(Psi'*Psi)*Psi'*y;
        
        yprediction = Psi*thetahat;
        
        xtest = validationprocesseddata(1:end,1:13);
        xtestsize = size(xtest);
        ntest = xtestsize(1,1);
        
        Psitest = [ones(ntest,1) table2array(xtest)];
        ypredicttest = Psitest*thetahat;
        
        trainingerrors = (yprediction - table2array(trainprocesseddata(1:innerloop,14)));
        trainingRootmeansquaredeviation(innerloop) = sqrt(mean((trainingerrors).^2));

        validationerrors = (ypredicttest - table2array(validationprocesseddata(:,14)));
        validationRootmeansquaredeviation(innerloop) = sqrt(mean((validationerrors).^2));
    end

    title('Training versus Validation',loops)
    subplot(3,2,loops)
    plot(1:length(trainingRootmeansquaredeviation), trainingRootmeansquaredeviation, 'r')
    hold on
    subplot(3,2,loops)
    plot(1:length(validationRootmeansquaredeviation), validationRootmeansquaredeviation, 'b')
    xlabel('Training set size');
    ylabel('RMSD');
    legend('training Rootmeansquaredeviation','validation Rootmeansquaredeviation')
end

[train_data, test_data] = split_train_validation(processeddata,0.2);
%split the data using hold out validation
%construct and view a decision tree using the assembled data
ctree = fitctree(train_data(:,1:4),train_data(:,5)); % create classification tree

view(ctree,'mode','graph')



