function [y1 y2]=Crossover(x1,x2)

    pSinglePoint=0.4;
    pDoublePoint=0.3;
    pUniform=1-pSinglePoint-pDoublePoint;
    
    METHOD=RouletteWheelSelection([pSinglePoint pDoublePoint pUniform]);
    
    switch METHOD
        case 1
            [y1 y2]=singlePoinCrossover(x1,x2);
            
        case 2
            [y1 y2]=DoublePointCrossover(x1,x2);
            
        case 3
            [y1 y2]=UniformCrossover(x1,x2);
            
    end


end