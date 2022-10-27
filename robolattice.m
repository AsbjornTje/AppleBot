clear;
clc;
%create the roadmap:
road = zeros(70, 100)

%make the edges of the map occupated:
road(1,:) = 1
road(end,:) = 1
road([1:70],1) = 1
road([1:70], end) = 1

%add rows to the map:
road(10:60,[15:23 36:44 57:65 78:86]) = 1


lp = Lattice(road, 'grid', 1, 'root', [2 2 0])

lp.plan('cost', [1 30 30])

p = lp.query([5 5 pi/2], [72 45 (3*pi)/4])

lp.plot()