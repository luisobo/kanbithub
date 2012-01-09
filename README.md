## Features
When a issue is created on Github it automatically recreates it on Kanbanery:

* Same title
* Same task type based on GitHub labels (Feature, Bug or Chore at this moment)
* Description with a link to the Github Issue

## Installation
Create the hook for GitHub Issues
<pre>curl -u "USERNAME:PASSWORD" -i https://api.github.com/repos/USERNAME/REPO/hooks \
   -d '{ "name": "web", "config":{"url":"YOUR URL HERE"},"events":["issues"]}'</pre>

Edit the config file and deploy. I use heroku.