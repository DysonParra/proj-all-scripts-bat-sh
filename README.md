# Information of the project.
This repository contains various script files for do some tasks.  

# update_libs_java
Used for find all jar files with name "*-lib.jar" in the "build" folder of a project.
Find all occurrences of the same file in the folder "libs" of the others project then replace these files.  
For example you have this projects struct.

/project  
├── build  
│   ├── libs  
│   │   ├── project.jar  
│   │   ├── project-lib.jar  
│   ├── libs  
│   ├── src  

/other  
├── build  
│   ├── libs  
│   │   ├── other.jar  
│   ├── libs  
│   │   ├── project-lib.jar  
│   ├── src  

The file "project-lib.jar" in "other/libs" will be replaced with "project-lib.jar" in "project/build/libs"


# update_libs_c
Used for find all header files "*.h" in the folder "header" folder of a project.
if in the parent folder exist the source file "*.c" and the lib file (*.dll or *.a) with the same name
this project is the creator of these lib.
Find all the projects that contains the header file and the lib file with the same struct, but not the source file.  
For example you have this projects struct.

/json  
├── header  
│   ├── json.h  
├── json.c  
├── json.dll  

/other  
├── header  
│   ├── json.h  
├── json.dll  
├── other.c  
├── other.exe  

The files "json.dll" and "json.h" in project "other" will be replaced with the files in project "json"


# git_checkout
Used for execute the command:  
git checkout master  
If a parameter is specified
go to this path before execute the command and in the end come back to the original path.  
For example:

git_checkout.bat  
Execute:  
git checkout master  

git_checkout.bat "C:\Users\User\Documents"  
Execute:  
cd "C:\Users\User\Documents"  
git checkout master  
cd %original_path%


# git_commit_push
Used for execute the commands:  
git add.  
git commit -m %1  
git push  
Where %1 is the first parameter specified and if a second parameter is specified
go to this path before execute the commands and in the end come back to the original path.  
For example:

git_commit_push.bat "first commit"  
Execute:  
git add .  
git commit -m "first commit"  
git push  

git_commit_push.bat "first commit" "C:\Users\User\Documents"  
Execute:  
cd "C:\Users\User\Documents"  
git add .  
git commit -m "first commit"  
git push  
cd %original_path%


# update_files_with_name
Search on all subfolders the file with the name specified and replace all found files.


# for_each_project
Find all project folders in subfolders (a project is a folder with a ".gitignore").
Execute the command specified with the rest of the args and replace all occurrences of the value %projectPath% in all args.  
For example you have this projects struct.

/projects  
├── .gitignore  
├── c-projs  
│   ├── project-01-c  
│   │   ├── .gitignore  
│   ├── project-02-c  
│   │   ├── .gitignore  
├── java-projs  
│   ├── project-01-java  
│   │   ├── .gitignore  
│   ├── project-02-java  
│   │   ├── .gitignore  
├── test-file.txt  

For copy the file "test-file.txt" on all project folders you can use the command:  
for_each_project.bat cp -r "test-file.txt" "%projectPath%/"  
This will be expanded to the commands:  
cp -r "test-file.txt" "<ABS_PATH>/projects/c-projs/project-01-c/"  
cp -r "test-file.txt" "<ABS_PATH>/projects/c-projs/project-02-c/"  
cp -r "test-file.txt" "<ABS_PATH>/projects/java-projs/project-01-java/"  
cp -r "test-file.txt" "<ABS_PATH>/projects/java-projs/project-01-java/"  

For git checkout on all projects you can use the command:  
for_each_project.bat git_checkout.bat "%projectPath%/"  
This will be expanded to the commands:  
git_checkout.bat "<ABS_PATH>/projects/c-projs/project-01-c/"  
git_checkout.bat "<ABS_PATH>/projects/c-projs/project-02-c/"  
git_checkout.bat "<ABS_PATH>/projects/java-projs/project-01-java/"  
git_checkout.bat "<ABS_PATH>/projects/java-projs/project-01-java/"  

For git commit and push on all projects you can use the command:  
for_each_project.bat git_commit_push.bat "message" "%projectPath%/"  
This will be expanded to the commands:  
git_commit_push.bat "message" "<ABS_PATH>/projects/c-projs/project-01-c/"  
git_commit_push.bat "message" "<ABS_PATH>/projects/c-projs/project-02-c/"  
git_commit_push.bat "message" "<ABS_PATH>/projects/java-projs/project-01-java/"  
git_commit_push.bat "message" "<ABS_PATH>/projects/java-projs/project-01-java/"  


# for_each_project_cd
The same that 'for_each_project' but before execute command for a project go to the path of the project
and after process the command for each project come back to the original path.  
For example if you have the same project struct:

For git commit and push on all projects you can use the command:  
for_each_project_cd.bat git_commit_push.bat "message"  
This will be expanded to the commands:  

cd "<ABS_PATH>/projects/c-projs/project-01-c/"  
git_commit_push.bat "message"  
cd %original_path%  

cd "<ABS_PATH>/projects/c-projs/project-02-c/"  
git_commit_push.bat "message"  
cd %original_path%  

cd "<ABS_PATH>/projects/java-projs/project-01-java/"  
git_commit_push.bat "message"  
cd %original_path%  

cd "<ABS_PATH>/projects/java-projs/project-01-java/"  
git_commit_push.bat "message"  
cd %original_path%  

The result is the same if you use 'for_each_project' instead but this is more simplified and probably more easy
because yo don´t
need to use the arg "%projectPath%/".

For git checkout on all projects you can use the command:  
for_each_project_cd.bat git checkout origin master  

With the same effect that:  
for_each_project.bat git_checkout.bat "%projectPath%/"  
And no need to call the bat file "git_checkout.bat"  

More usefull for execute commands directly on each project path without call ".bat" files to navigate  
