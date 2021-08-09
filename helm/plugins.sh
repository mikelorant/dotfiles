#!/usr/bin/env bash

helmswitch 2.17.0

helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/mstrzele/helm-edit
helm plugin install https://github.com/adamreese/helm-env
helm plugin install https://github.com/fairfaxmedia/helm-git # https://github.com/aslafy-z/helm-git
helm plugin install https://github.com/lrills/helm-unittest
helm plugin install https://github.com/technosophos/helm-template

helmswitch 3.6.3

helm plugin install https://github.com/helm/helm-2to3
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/mstrzele/helm-edit
helm plugin install https://github.com/aslafy-z/helm-git
helm plugin install https://github.com/instrumenta/helm-kubeval
helm plugin install https://github.com/quintush/helm-unittest
