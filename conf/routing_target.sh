#!/usr/bin/env bash

ip route replace default via 10.0.2.4 dev target-0 proto static
