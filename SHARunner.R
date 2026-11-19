# This program is designed to take 2 folders (at most) as arguments and then spit out whether all files are same hashed
# or if they're different and if they're different which files
# Provided as-is, GPL 3, etc, etc.
library(cli)

hash_and_diff_files <- function(directory1, directory2) {
    # list their contents into a vector
    files1 <- list.files(folder1, full.names = FALSE, recursive = TRUE)
    # stop on empty or non-existent directories
    if (length(files1) == 0) {
        stop("Directory is empty or does not exist.")
    }

    files2 <- list.files(folder2, full.names = FALSE, recursive = TRUE)
    if (length(files2) == 0) {
        stop("Directory is empty or does not exist.")
    }

    files_w_path_1 <- list.files(folder1, full.names = TRUE, recursive = TRUE)
    files_w_path_2 <- list.files(folder2, full.names = TRUE, recursive = TRUE)

    if (length(files1) == length(files2) && identical(files1, files2)) {
        container <- list()
        # Put files in out container list
        container$contents1$files <- files1
        container$contents2$files <- files2
        # Add hashes to their respective sections of the list
        container$contents1$hashes <- hash_file_sha256(files_w_path_1)
        container$contents2$hashes <- hash_file_sha256(files_w_path_2)
        # Are they the same hashes?
        if (identical(container$contents1$hashes, container$contents2$hashes)) {
            # All good
            return("All files are good 👍")
        } else {
            # Otherwise there are issues in these files
            print("There are some files that are different!!\n See the list below:\n")
            return(container$contents1$files[container$contents1$hashes %in% container$contents2$hashes])
        }
    } else if (!identical(files1, files2)) {
        stop("Error: The file names aren't identical...")
    } else if (length(files1) != length(files2)) {
        stop("Error: There are a different number of files in each directory...")
    } else {
        stop("Error: How did I get here?")
    }
}

if (interactive()) {
    # Get the directories
    folder1 <- readline("Provide the first directory: ")
    folder2 <- readline("Provide the second directory: ")

    print(hash_and_diff_files(folder1, folder2))

} else {
    args <- commandArgs(trailingOnly = TRUE)

    if (length(args) == 2) {
        print(hash_and_diff_files(args[1], args[2]))
    } else {
        stop("Error: An incorrect number of arguments was provided, exiting.")
    }
}
