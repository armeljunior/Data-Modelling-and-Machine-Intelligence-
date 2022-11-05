function [train_data, validation_data] = split_train_validation(data,validation_ratio)

rng(1); %Assign a seed to the random number generator in order to ensure %that it produces the samerandom sequence all the time
randomised = ceil(rand(1102,1) * (1102)); 
size(randomised);
validation_set_size = validation_ratio;
validation_set_size = 386;
%validationsetsize = 386;
validation_indices = randomised(1: validation_set_size);
train_indices = randomised(validation_set_size:end);
train_data = data(train_indices, 1:end);
validation_data = data(validation_indices, 1:end);
end