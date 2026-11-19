# This program is designed to take 2 folders (at most) as arguments and then spit out whether all files are same hashed
# or if they're different and if they're different which files

if (interactive()) {
    folder1 <- readline("Provide the first directory")

    folder2 <- readline("Provide the second directory")
} else {
    if (len(commandArgs))
}