function PlotCosts(pop)

    Costs = [pop.cost];
    
    plot(Costs(1,:), Costs(2,:), 'r*', 'MarkerSize', 8);
    xlabel('Average Packet Latency (cycles)');
    ylabel('FIT (Number of Failures per Billion Hours)');
    grid on;

    % Set X-axis to logarithmic scale
    set(gca, 'XScale', 'log');
end