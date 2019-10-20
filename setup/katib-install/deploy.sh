#!/bin/bash

# Copyright 2018 The Kubeflow Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

kubectl apply -f v1alpha3
kubectl apply -f v1alpha3/katib-controller
kubectl apply -f v1alpha3/manager
kubectl apply -f v1alpha3/pv
kubectl apply -f v1alpha3/db
kubectl apply -f v1alpha3/ui
kubectl apply -f tf-job
kubectl apply -f pytorch
