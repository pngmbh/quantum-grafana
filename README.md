|![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Warning.svg/156px-Warning.svg.png) | This repository is no longer maintained.<br />Please [see the new repository](https://github.com/hostwithquantum/grafana-stack) for more detail. |
|---:|---|
| :point_right: | https://github.com/hostwithquantum/grafana-stack |

# Grafana Setup for Planetary Quantum

https://www.planetary-quantum.com/

This starts up a Grafana on your Quantum cluster, to view your docker logs and
some basic metrics about your Quantum cluster.

## Deploy

You'll need [`quantum-cli`](https://cli.planetary-quantum.com/).

* `cp docker-compose.example.yml docker-compose.yml`, and edit it:
    * set the `traefik.frontend.rule` label to include the hostname of your endpoint/cluster (or your custom domain, if you want that)
    * set `INITIAL_ADMIN_PASSWORD` to something random
    * set `QUANTUM_ENDPOINT` to the name of your endpoint/cluster
* then:
    ```
    $ QUANTUM_ENDPOINT=your-cluster-name
    $ quantum-cli stack update --create --wait --stack "grafana-$QUANTUM_ENDPOINT"
    ```

## Basic usage

* on the left-hand side menu choose "Explore"
  ![explore menu screenshot](img/explore_menu.png)
* select "Docker Logs" at the top, and click on "Logs" right next to it
  ![docker logs selection screenshot](img/docker_logs.png)
* select some log label via the drop-down next to the search bar
  ![log label selection](img/log_labels.png)
* you should now see your logs

For metrics: go to Dashboards => Manage. There should be one pre-configured
dashboard "Usage by Stack".
