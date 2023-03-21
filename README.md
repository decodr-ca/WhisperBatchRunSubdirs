# WhisperBatchRun
 This batch file will run OpenAi's whisper to transcribe (or translate) all files in the active directory and subdirectories if desired.  Eventually will include additional features and possibly a GUI.

 Currently, Version #1 of the batch file does the following:

 (1) checks of whisper is installed, and if so, starts to run;
 (2) Asks if you want to process sub-folders, and if an answer is not provided in 10 seconds, defaults to "N";
 (3) Applies the following command to each mp3 or wav file in the folder/sub-folders: "whisper "FILENAME" --model large-v2 --output_format vtt"
 (4) Creates a log file in the active directory, but only if there were any errors;
 (5) ends.

 To use, simply place it in your system's "PATH."  Search online how to do this if need be - i.e. to alter your environment variables.

 Once in the system PATH you simply open a Command Prompt (CMD) and type the batch file name (without the extension if desired).

 Whisper must be installed in your computer and in the system PATH as well, which will necessitate install other items as well such as Python in order for Whisper to run.  Check out Whisper's github for more info.

 PLEASE NOTE: That the batch file uses Whisper's large-v2 model, which is THE MOST CUMBERSOME.  You can easily modify the batch file to specify smaller models...and also change it up to include other arguments, which are all listed on Whisper's GitHub.  Similarly, it's set to only output VTT files but users may want another file format such as TXT.

 FINALLY, this is my first program ever and first Github repo ever.  Thanks for visiting.  Here are some ideas if anyone wants to help contribute.  I'm looking forward to collaborating with random people!

 IDEAS - PEOPLE COULD POSSIBLY HELP WITH:

 *** Creating a GUI.  My research indiates that using "tkinter" is the easiest and most compatible along with something like PAGE to visually drag/drop/create a GUI that'll work with the script.

 *** Modify the script to give users the option of choosing different arguments - e.g. different model sizes, to "translate," and if so, from which language, change the output file to something other than VTT...all of which could eventually be incorporated into a GUI.

 *** Once everything is finalized, create an installer/EXE so it's easier to run.

 *** Send me additional ideas!  Thanks!