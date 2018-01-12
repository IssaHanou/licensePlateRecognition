function ans = cropToPlate(boxes, dimensions, im)
    % Compute the overlap ratio
    overlapRatio = bboxOverlapRatio(boxes, boxes);

    % Set the overlap ratio between a bounding box and itself to zero to
    % simplify the graph representation.
    n = size(overlapRatio,1);
    overlapRatio(1:n+1:n^2) = 0;

    % Create the graph
    g = graph(overlapRatio);

    % Find the connected text regions within the graph
    componentIndices = conncomp(g);

    % Merge the boxes based on the minimum and maximum dimensions.
    xmin = accumarray(componentIndices', dimensions(1), [], @min);
    ymin = accumarray(componentIndices', dimensions(2), [], @min);
    xmax = accumarray(componentIndices', dimensions(3), [], @max);
    ymax = accumarray(componentIndices', dimensions(4), [], @max);

    % Compose the merged bounding boxes using the [x y width height] format.
    textBBoxes = [xmin ymin xmax-xmin+1 ymax-ymin+1];

    % Remove bounding boxes that only contain one text region
    numRegionsInGroup = histcounts(componentIndices);
    textBBoxes(numRegionsInGroup == 1, :) = [];

    % Show the final text detection result.
    ITextRegion = insertShape(im, 'Rectangle', textBBoxes,'LineWidth',3);

    figure
    imshow(ITextRegion);
    title('Detected Text');

    I = rgb2gray(im);
    ocrtxt = ocr(I, textBBoxes);
    ans = [ocrtxt.Text];

end