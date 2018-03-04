% extract the offset of the poses and the landmarks

function [poses, landmarks] = get_poses_landmarks(g)

poses = [];
landmarks = [];

fields=fieldnames(g.idLookup);

%for [value, key] = g.idLookup
for i =1:numel(fields)
    key=fields{i};
    value=g.idLookup.(key);
    dim = value.dimension;
  offset = value.offset;
  if (dim == 3)
    poses = [poses; offset];
  elseif (dim == 2)
    landmarks = [landmarks; offset];
  end
end

end
