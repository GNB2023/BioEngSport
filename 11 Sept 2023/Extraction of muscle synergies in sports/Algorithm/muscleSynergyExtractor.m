function synergy = muscleSynergyExtractor(opts, matrix)
% ---------------------------------------------------------
% Author(s): M. Ghislieri (marco.ghislieri@polito.it)
% Release: v2.4
% Last Update: 06/09/2023
% ---------------------------------------------------------
%
% INPUT
% - opts: structure containing the acquisition system and factorization
%         options (e.g., sampling frequency, number of muscles acquires, number of
%         synergies to be extracted, etc.)
% - matrix: matrix containing the sEMG envelopes to be analyzed
%
% OUTPUT
% - synergy: structure containing the muscle synergies extracted for each
%            number of synergies (n_input)
%

k=1;
synergy = struct();
for ii = opts.n_input 
    synergy(k).NumSynergies = ii;
    
    % Any potential negative entrie in data matrix will be set to zero
    % V = V.*(V>0);
    matrix(matrix<0) = 0;
    
    % Any potential muscle channnel with only zeros is not included in the iteration
    test = sum(matrix,2);
    ind = find(test==0);
    matrixnew_m = matrix(test~=0,:);
    
    % Any potential condition with only zeros is not included in the iteration
    test_cond = sum(matrix,1);
    ind_cond = find(test_cond==0);
    matrixnew = matrixnew_m(:,test_cond~=0);
    
    % If attempting to extract more synergies than remaining muscles,
    % extract only the number of synergies equal to number of muscles
    nummus = size(matrixnew,1);
    if ii > nummus
        ii = nummus;
    end
    
    [~,col] = size(matrix);
    Htmp = rand(ii,col);
    Htmp = max(Htmp,eps);
    Wtmp = matrixnew/Htmp;
    Wtmp = max(Wtmp,eps);

    options = statset('MaxIter', opts.iter, 'TolFun', opts.tof, 'TolX', opts.residual,'Display', 'final');
    [synergy(k).W,synergy(k).H,synergy(k).RMSE] = nnmf(matrixnew, ii, 'W0', Wtmp, 'H0', Htmp, 'Replicates', opts.reps, 'Algorithm', 'mult', 'Options', options);
    
    % NNMF output normalization
    m = max(synergy(k).W,[],1);
    synergy(k).H = synergy(k).H.*m';
    synergy(k).W = synergy(k).W./m;
    
    % Set to zero the columns or rows that were not included in the iteration
    [muscles,samples] = size(matrix);
    col_0 = zeros(ii,1);
    row_0 = zeros(1,ii);
    
    for c = ind_cond
        if c == 1
            synergy(k).H = [col_0 synergy(k).H];
        elseif c == samples
            synergy(k).H = [synergy(k).H col_0];
        else
            synergy(k).H = [synergy(k).H(:,1:c-1) col_0 synergy(k).H(:,c:end)];
        end
    end
    
    for g = ind'
        if g == 1
            synergy(k).W = [row_0 ; synergy(k).W];
        elseif g == muscles
            synergy(k).W = [synergy(k).W; row_0];
        else
            synergy(k).W = [synergy(k).W(1:g-1,:) ; row_0 ; synergy(k).W(g:end,:)];
        end
    end
    k = k+1;
end
end   