


```

docker run -e BUILDKITE_AGENT_TOKEN="INSERT-YOUR-AGENT-TOKEN-HERE" buildkite/agent


```

You'll need to:

- use the bk token from your bk account
- configure buildkite to talk to github via webhooks for each commit
- ensure your agent can checkout code - generate or import private keys into the container in `~/.ssh` by mounting your own ssh folder or building the required keys that can do git checkout into the container

github ssh:
https://buildkite.com/docs/agent/v3/github-ssh-keys

if your bk agent is running as a container - and you want it to be able to launch it's own continers within a build job - mount the docker in your run command.
https://buildkite.com/docs/agent/v3/docker#allowing-builds-to-use-docker

read the docs:

https://buildkite.com/docs/tutorials/getting-started

... they're really good - read as many of the bk docs as you can, then read them again

and use minimal plugins to avoid making your pipeline buildkite specific.

some plugins like docker can be handy - just remember that you may want to change build systems one day.

buildkite has some awesome docs on writing really good bash scripts - keep these script generic enough that you can run them on your local machine OR in buildkite by easily setting some variables etc
