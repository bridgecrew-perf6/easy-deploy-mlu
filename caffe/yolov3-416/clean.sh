#!/bin/bash
set -e

#clean test
rm -vf ./test/yolov3_online_multicore/*
rm -vf ./test/yolov3_offline_multicore/*

#clean models
rm -vrf ./models/mlu/*
rm -vrf ./models/mlu/*.weights
