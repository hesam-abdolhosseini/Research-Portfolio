% run_noc_nsga.m
% Wrapper script for NSGA-II optimization demo
% This script sets up the environment and calls Main.m
% Reviewers should only run this file.

disp('Running NSGA-II optimization demo...');

% Get the folder where this script lives
thisFolder = fileparts(mfilename('fullpath'));

% Add the ../src folder (and its subfolders) to the MATLAB path
srcFolder = fullfile(thisFolder, '../src');
addpath(genpath(srcFolder));

% Call your existing Main.m (entry point of your optimization code)
Main;

% Optional: clean up path afterwards (so helpers aren’t globally exposed)
rmpath(genpath(srcFolder));

disp('Demo finished.');