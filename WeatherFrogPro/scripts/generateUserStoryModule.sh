#!/bin/bash/
testPath="WeatherFrogProTests/PresentationLayer/UserStories/$1"
echo $testPath
projectPath="WeatherFrogPro/PresentationLayer/UserStories/$1"
echo $projectPath
echo $2
generamba gen "$2" swinject --test_path "$testPath" --project_file_path "$projectPath" --project_group_path "$projectPath"
