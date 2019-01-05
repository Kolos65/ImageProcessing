function [HoleVolumes] = process_the_block_of_cheese(cube)
    HoleCount = 0;
    HoleVolumes = zeros(1,sum(cube(:)));
    LastVisited = 0;
    FIFO = cell(0,1);
    while true
        if isempty(FIFO)
            %Scanning
            LastVisited = LastVisited + 1;
            if LastVisited > numel(cube)
                break;
            end
            [py, px, pz] = ind2sub(size(cube), LastVisited);
            if cube(py,px,pz) == 1
                index = [py, px, pz];
                FIFO = fifo_enqueue(FIFO, index);
                HoleCount = HoleCount + 1;
                HoleVolumes(HoleCount) = 0;
            end
        else
            %Filling
            [FIFO, index] = fifo_dequeue(FIFO);
            if cube(index(1),index(2),index(3)) == 0
                continue;
            end
            HoleVolumes(HoleCount) = HoleVolumes(HoleCount) + 1;
            cube(index(1),index(2),index(3)) = 0;
            M = [1,0,0; -1,0,0; 0,1,0; 0,-1,0; 0,0,1; 0,0,-1];
            for i=1:6
                neib = index + M(i,:);
                %Check if we are in bounds
                isinside = true;
                for d = 1:3
                    if neib(d) > size(cube,d) || neib(d) < 1
                        isinside = false;
                    end
                end
                if isinside
                    %Only index the cube if indexes are correct
                    if cube(neib(1),neib(2),neib(3)) == 1
                        FIFO = fifo_enqueue(FIFO, neib);
                    end
                end
             end
        end
    end
    HoleVolumes = HoleVolumes(HoleVolumes ~= 0);
end
