Create the hook for GitHub Issues
<pre>curl -u "USERNAME:PASSWORD" -i https://api.github.com/repos/USERNAME/REPO/hooks
   -d '{ "name": "web", "config":{"url":"YOUR URL HERE"},"events":["issues"]}'</pre>