function ans = checkPlate(im)
    [boxes, dimensions] = createRegions(im);
    ans = cropToPlate(boxes, dimensions, im);
end