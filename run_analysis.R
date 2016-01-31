run.analysis <- function() {
    
    library(data.table)
    
    
    # Setting some constant variables and the functions needed
   
    source("constants.R")
    source("analysis_functions.R")
    
    # Create a single dataset with train and test datasets
    # Create the training set

    print("Creating training dataset ...")
    train.dataset <- create.set("train")
    
    # Create the test set

    print("Creating testing dataset ...")
    test.dataset <- create.set("test")
    
    print("Making final dataset ...")
    # Create the total dataset
    total.dataset <- rbind(train.dataset, test.dataset)
    
    # Cleaning memory
    rm(train.dataset, test.dataset)
    
    
    # Making changes to improve de dataset
    # Setting column names

    colnames(total.dataset) <- dataset.column.names()

    # get only cols to extract

    total.dataset <- extract.columns.dataset(total.dataset)
    # Use activity names
    total.dataset <- label.activity.column(total.dataset)
    
    
    # Creating and exporting the new dataset

    write.table(create.new.dataset(total.dataset), 
                "new_dataset.txt",
                sep=",",
                row.names = FALSE,
                quote = FALSE)
    print("Done! The new_dataset.txt file is in your working directory.")
}   