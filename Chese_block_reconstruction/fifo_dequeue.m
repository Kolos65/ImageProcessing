function [FIFO, item] = fifo_dequeue(FIFO)
    if isempty(FIFO)
        item = [];
        return;
    end
    item = FIFO{1};
    FIFO(1) = [];
end
