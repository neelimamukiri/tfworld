#!/bin/bash

# Copyright 2019 The Kubeflow Authors.
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

# Delete CR first
experiments=`kubectl get experiments --all-namespaces | awk '{if (NR>1) {print $1"/"$2}}'`
for s in $experiments
do
  ns=`echo $s|cut -d "/" -f 1`
  exp=`echo $s|cut -d "/" -f 2`
  kubectl delete experiments $exp -n $ns
done

kubectl delete -f v1alpha3/katib-controller
kubectl delete -f v1alpha3/manager
kubectl delete -f v1alpha3/db
kubectl delete -f v1alpha3/ui
kubectl delete -f v1alpha3/pv
kubectl delete -f v1alpha3
kubectl delete -f pytorch
kubectl delete -f tf-job
cd - > /dev/null
