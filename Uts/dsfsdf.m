% Read in a standard MATLAB color demo image.
folder = fullfile(matlabroot, '\toolbox\images\imdemos');
baseFileName = 'learn1.jpg';
fullFileName = fullfile(folder, baseFileName);
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
  % Didn't find it there.  Check the search path for it.
  fullFileName = baseFileName; % No path this time.
  if ~exist(fullFileName, 'file')
    % Still didn't find it.  Alert user.
    errorMessage = sprintf('Error: %s does not exist.', fullFileName);
    uiwait(warndlg(errorMessage));
    return;
  end
end
rgbImage = imread(fullFileName);
% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);
[rows columns numberOfColorChannels] = size(rgbImage);
% Make black strips to space them apart
widthOfStrip = 20;
verticalStrip = zeros(rows, widthOfStrip, 'uint8');
horizontalStrip = zeros(widthOfStrip, 2*columns + widthOfStrip, 'uint8');
% Make into color so we can stitch.
horizontalStrip = cat(3, horizontalStrip, horizontalStrip, horizontalStrip);
verticalStrip = cat(3, verticalStrip, verticalStrip, verticalStrip);
% Stitch together
outputImage = [rgbImage, verticalStrip, redChannel; horizontalStrip; greenChannel, verticalStrip, blueChannel];
imshow(outputImage);