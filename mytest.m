% data = importdata('../tt.xyz');
%  [voxelArray,outMesh]= voxelpoint(data,0.1);
%  xx = cellfun(@normnd,voxelArray,'UniformOutput', false);
[a b c]=size(xx);
vv = [];v = [];
out = [];
for k1 = 1:a
    for k2 = 1:b
        for k3 = 1:c
           v =  xx{k1,k2,k3};
           if v(1)~=0
               vv = [vv;v(1:6)'];
               dv = vv(4:6)-vv(1:3);
               A = atand(dv(3)/sqrt(dv(1).^2+dv(2).^2));
               if A<50
                   out = [out;voxelArray{k1,k2,k3}];
               end
           end
        end
    end
end
% hold on;
% quiver3(vv(:,1),vv(:,2),vv(:,3),vv(:,4),vv(:,5),vv(:,6));axis equal;hold on;
hold on;
figure(1);plot3(data(:,1),data(:,2),data(:,3),'r.');axis equal;
figure(2);plot3(out(:,1),out(:,2),out(:,3),'g.');axis equal;