function p = log_odds_to_prob(l)
% Convert log odds l to the corresponding probability values p.
% l could be a scalar or a matrix.

% TODO: compute p.
%predefine
p=[];
for i=size(l,1)
    for j=size(l,2)
        p(i,j)=1-1/(1+exp(l(i,j)));
    end
end


end
