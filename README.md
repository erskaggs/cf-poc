## Implementation:

For this challenge my first decision was to figure out where I wanted the state file to go. Figuring that this is just for a POC and a very basic setup I decided to just do a local terraform state file instead of having it in a GCP bucket to lessen complexity and to ensure that all resources would be deleted when POC was complete. Also wanted to ensure the existence of at .gitignore file to make sure that all tfstate, credentials, and .terraform directories/files were not uploaded to Github.

While the client POC called for folders and service projects, this was not implemented as there isn't a domain to create an organization within GCP and that is needed in order to have a folder structure for projects and organizations.  So this was skipped 

Next I decided on what parts should become a module and what resources should be grouped in those modules. There are a lot of modules that are already created on the internet but wanted to create custom modules for this POC as to only use what is really needed and for a way to allow the customer to look at simpler modules that only did the necessity of what is being asked for.

### Modules

- The VPC module is used to create the vpc itself along with all subnetworks that are to be included into the vpc.  This module also creates the nat router and gateway.

-
