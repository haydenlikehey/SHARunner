# SHARunner.R

## What does it do?
It's supposed to take in two folders as arguments in non-interactive mode or as string responses to prompts in interactive mode and tell you whether or not the files in the directories all have the same SHA 256 hashes.

## What happens if there are different hashes?
The program outputs the names of the offending files.

## What happens if there are different numbers of files?
It errors.

## What happens if there aren't any files or the directories don't exist?
It errors.

## Why did you make this?
I wanted to see if the files from a Daggerfall download through a Google Drive link were fishy or not.

## Did you use AI to make it?
No, I don't really believe in all that.

## How do I run it in interactive mode?
Source the file, please.

## How do I run it in non-interactive mode?
```sh
R --args "folder1" "folder2"
```
I think. I don't invoke R non-interactively a lot, it's a bit of a pain in the ass on Windows. I think on Windows it's specifically
```powershell
R.exe --args "folder1" "folder2"