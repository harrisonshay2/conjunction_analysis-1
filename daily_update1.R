library(RDCOMClient)
library(fs)

search.phrase <- 'Conjunction Reports'

save.fldr <- 'C:\\Users\\Harri\\OneDrive\\Documents\\conjunction_analysis' # Set a root folder to save attachments into
print(save.fldr)

outlook_app <- COMCreate("Outlook.Application")
search <- outlook_app$AdvancedSearch(
  "Inbox",
  paste0("http://schemas.microsoft.com/mapi/proptag/0x0037001E ci_phrasematch '", search.phrase, "'")
)

Sys.sleep(10) # Wait some time to allow search to complete

results <- search[['Results']]

#for(i in c(1:results[['Count']])){ # Loop through search results
 # attachments.obj <- results[[i]][['attachments']] # Gets the attachment object
index = c(results[['Count']])


attachments.obj <- results[[index]][['attachments']]
  
  if(attachments.obj[['Count']] > 0){ # Check if there are attachments
    attach.fldr <- file.path(save.fldr, path_sanitize(results[[i]][['Subject']])) # Set folder name for attachments based on email subject
    
    if(!dir.exists(attach.fldr)){
      dir.create(attach.fldr) # Create the folder for the attachments if it doesn't exist
    }
    
    
    #for(a in c(1:attachments.obj[['Count']])){ # Loop through attachments
      save.path <- file.path(attach.fldr, attachments.obj[[1]][['FileName']]) # Set the save path
      print(save.path)
      attachments.obj[[1]]$SaveAsFile(save.path) # Save the attachment
    #}
    
  }
#}  
  
  