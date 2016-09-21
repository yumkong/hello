function o = boxoverlap(a, b)
% Compute the symmetric intersection over union overlap between a set of
% bounding boxes in a and a single bounding box in b.
%
% a  a matrix where each row specifies a bounding box
% b  a matrix where each row specifies a bounding box
% -------------------------------------------------------

o = cell(1, size(b, 1));
for i = 1:size(b, 1)
    x1 = max(a(:,1), b(i,1));
    y1 = max(a(:,2), b(i,2));
    x2 = min(a(:,3), b(i,3));
    y2 = min(a(:,4), b(i,4));

    w = x2-x1+1;
    h = y2-y1+1;
    inter = w.*h;
    aarea = (a(:,3)-a(:,1)+1) .* (a(:,4)-a(:,2)+1);
    barea = (b(i,3)-b(i,1)+1) * (b(i,4)-b(i,2)+1);
    % intersection over union overlap
    o{i} = inter ./ (aarea+barea-inter);
    % set invalid entries to 0 overlap
    o{i}(w <= 0) = 0;
    o{i}(h <= 0) = 0;
end

o = cell2mat(o);
end