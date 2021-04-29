% Evaluate Distance metrics

dataset = csvread('./dataset.csv');
[numRecords, numFeatures] = size(dataset);
query = [27 -0.397 301 180 27195 0.49 100 -3.497561273 9 0.98806];

euclidean = double(zeros(numRecords, 1));
manhattan = double(zeros(numRecords, 1));
chi_square = double(zeros(numRecords, 1));
chess_board = double(zeros(numRecords, 1));
earth_movers = double(zeros(numRecords, 1));

for i=1:size(dataset, 1)
    record = dataset(i, :);
    euclidean(i, 1) = sum((query - record).^2);
    manhattan(i, 1) = sum(abs(query - record));
    chi_square(i, 1) = sum((record - query).^2 / (record + query)) / 2;
    chess_board(i, 1) = max(abs(record - query));
    earth_movers(i, 1) = sum(abs(cumsum(record) - cumsum(query)));
end


labels = string(split(sprintf('feature-%d ', 1:numFeatures))).';
labels = labels(1:numFeatures);
labels = [labels ...
    'euclidean' 'manhattan' 'chi_squared' 'chess_board' 'earth_movers'];
% writematrix(labels, 'distance-metrics.csv', 'Writemode', 'append');
results = [labels; 
    dataset euclidean manhattan chi_square chess_board earth_movers ];
writematrix(results, 'distance-metrics.csv', 'Writemode', 'append');